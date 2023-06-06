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

  FileSet({
    List<String>? fileIds,
  }) {
    this.fileIds = fileIds ?? [];
  }

  static const fromJson = FileSetMapper.fromJson;
  static const fromMap = FileSetMapper.fromMap;

  @override
  bool get isEmpty => fileIds.isEmpty && _fileIdsNew.isEmpty;

  @override
  bool get isNotEmpty => !isEmpty;

  Future<DBFile> operator [](int idx) async {
    String id;
    if (idx < fileIds.length) {
      id = fileIds[idx];
    } else if (idx < _fileIdsNew.length + fileIds.length) {
      id = _fileIdsNew[fileIds.length - idx];
    } else {
      id = '';
    }

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
  }

  void addSingle(String filename, Uint8List data) {
    var id = ObjectId().hexString;
    var file = DBFile(id: id, data: data, filename: filename);
    clear();
    _fileseData[id] = file;
    _fileIdsNew.add(id);
  }

  void remove(String fileid) {
    _fileIdsToRemove.add(fileid);
    fileIds.remove(fileid);
    _fileIdsNew.remove(fileid);
  }

  void clear() {
    _fileIdsToRemove.addAll(fileIds);
    fileIds.clear();
    _fileIdsNew.clear();
  }

  Future<void> save() async {
    if (_fileIdsToRemove.isNotEmpty) await ApiFilestore.deleteFiles(_fileIdsToRemove);
    for (var id in _fileIdsNew) {
      await ApiFilestore.uploadFile(_fileseData[id]!.filename!, _fileseData[id]!.data, id: id);
    }
    fileIds.addAll(_fileIdsNew);
    _fileIdsToRemove.clear();
    _fileIdsNew.clear();
  }

  @override
  Iterator<Future<DBFile>> get iterator => FileSetIterator(fileIds, _fileIdsNew, _fileseData);
}

class FileSetIterator extends Iterator<Future<DBFile>> {
  int _idx = -1;
  Future<DBFile>? _current;
  final List<String> _fileIds;
  final Map<String, DBFile> _filesData;
  final List<String> _fileIdsNew;

  FileSetIterator(
    this._fileIds,
    this._fileIdsNew,
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
    if (_idx < _fileIds.length) {
      id = _fileIds[_idx];
    } else if (_idx < _fileIdsNew.length + _fileIds.length) {
      id = _fileIdsNew[_idx - _fileIds.length];
    } else {
      _current = null;
      return false;
    }

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
