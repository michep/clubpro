import 'dart:typed_data';
import 'package:clubpro/api/api_filestore.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:objectid/objectid.dart';

part 'fileset.mapper.dart';

class DBFile {
  String id;
  Uint8List data;
  String? filename;

  DBFile({
    required this.id,
    required this.data,
    this.filename,
  });
}

@MappableClass()
class FileSet extends Iterable<Future<DBFile>> with FileSetMappable {
  @MappableField(key: 'file_ids')
  late final List<String> fileIds;
  final Map<String, DBFile> _fileseData = {};
  final List<String> _fileIdsToRemove = [];
  final List<String> _fileIdsNew = [];
  final List<String> _indexed = [];

  FileSet({
    List<String>? fileIds,
  }) {
    this.fileIds = fileIds ?? [];
    _indexed.addAll(this.fileIds);
  }

  static const fromJson = FileSetMapper.fromJson;
  static const fromMap = FileSetMapper.fromMap;

  @override
  bool get isEmpty => fileIds.isEmpty && _fileIdsNew.isEmpty;

  @override
  bool get isNotEmpty => !isEmpty;

  Future<DBFile?> getFile(int idx) async {
    String id;
    if (idx >= _indexed.length) return null;
    id = _indexed[idx];
    if (_fileseData[id] == null) {
      var data = await ApiFilestore.getFile(id);
      _fileseData[id] = DBFile(id: id, data: data);
    }
    return _fileseData[id]!;
  }

  void add(String filename, Uint8List data) {
    var id = ObjectId().hexString;
    var file = DBFile(id: id, data: data, filename: filename);
    _fileseData[id] = file;
    _fileIdsNew.add(id);
    _indexed.add(id);
  }

  void addSingle(String filename, Uint8List data) {
    var id = ObjectId().hexString;
    var file = DBFile(id: id, data: data, filename: filename);
    clear();
    _fileseData[id] = file;
    _fileIdsNew.add(id);
    _indexed.add(id);
  }

  void remove(String fileid) {
    _fileIdsToRemove.add(fileid);
    fileIds.remove(fileid);
    _fileIdsNew.remove(fileid);
    _indexed.remove(fileid);
  }

  void clear() {
    _fileIdsToRemove.addAll(fileIds);
    fileIds.clear();
    _fileIdsNew.clear();
    _indexed.clear();
  }

  void insertInplace({required DBFile subject, required DBFile inplaceOf}) {
    var iid = inplaceOf.id;
    var sid = subject.id;

    var iidx = _indexed.indexOf(iid);
    _indexed.remove(sid);
    _indexed.insert(iidx, sid);
  }

  Future<void> save() async {
    if (_fileIdsToRemove.isNotEmpty) await ApiFilestore.deleteFiles(_fileIdsToRemove);
    for (var id in _indexed) {
      if (_fileIdsNew.contains(id)) {
        await ApiFilestore.uploadFile(_fileseData[id]!.filename!, _fileseData[id]!.data, id: id);
      }
    }
    fileIds.clear();
    fileIds.addAll(_indexed);
    _fileIdsToRemove.clear();
    _fileIdsNew.clear();
  }

  @override
  Iterator<Future<DBFile>> get iterator => FileSetIterator(_indexed, _fileseData);
}

class FileSetIterator extends Iterator<Future<DBFile>> {
  int _idx = -1;
  Future<DBFile>? _current;
  final Map<String, DBFile> _filesData;
  final List<String> _indexed;

  FileSetIterator(
    this._indexed,
    this._filesData,
  );

  @override
  Future<DBFile> get current {
    return _current != null ? _current! : throw 'fault call for current';
  }

  @override
  bool moveNext() {
    _idx++;
    String id;

    if (_idx >= _indexed.length) return false;
    id = _indexed[_idx];

    if (_filesData[id] == null) {
      _current = ApiFilestore.getFile(id).then((value) {
        _filesData[id] = DBFile(id: id, data: value);
        return _filesData[id]!;
      });
    } else {
      _current = Future(() => _filesData[id]!);
    }
    return true;
  }
}
