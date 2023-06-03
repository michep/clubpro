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
  final Map<String, DBFile> _pictureData = {};
  final List<String> _pictureIdsToRemove = [];
  final List<String> _pictureIdsNew = [];

  FileSet({
    List<String>? fileIds,
  }) {
    this.fileIds = fileIds ?? [];
  }

  static const fromJson = FileSetMapper.fromJson;
  static const fromMap = FileSetMapper.fromMap;

  @override
  bool get isEmpty => fileIds.isEmpty && _pictureIdsNew.isEmpty;

  @override
  bool get isNotEmpty => !isEmpty;

  Future<DBFile> operator [](int idx) async {
    String id;
    if (idx < fileIds.length) {
      id = fileIds[idx];
    } else if (idx < _pictureIdsNew.length + fileIds.length) {
      id = _pictureIdsNew[fileIds.length - idx];
    } else {
      id = '';
    }

    if (_pictureData[id] == null) {
      var data = await ApiFilestore.getFile(id);
      _pictureData[id] = DBFile(id: id, data: data);
    }
    return _pictureData[id]!;
  }

  void add(String filename, Uint8List data) {
    var id = ObjectId().hexString;
    var file = DBFile(id: id, data: data, filename: filename);
    _pictureData[id] = file;
    _pictureIdsNew.add(id);
  }

  void addSingle(String filename, Uint8List data) {
    var id = ObjectId().hexString;
    var file = DBFile(id: id, data: data, filename: filename);
    clear();
    _pictureData[id] = file;
    _pictureIdsNew.add(id);
  }

  void remove(String fileid) {
    _pictureIdsToRemove.add(fileid);
    fileIds.remove(fileid);
    _pictureIdsNew.remove(fileid);
  }

  void clear() {
    _pictureIdsToRemove.addAll(fileIds);
    fileIds.clear();
    _pictureIdsNew.clear();
  }

  Future<void> save() async {
    if (_pictureIdsToRemove.isNotEmpty) await ApiFilestore.deleteFiles(_pictureIdsToRemove);
    for (var id in _pictureIdsNew) {
      await ApiFilestore.uploadFile(_pictureData[id]!.filename!, _pictureData[id]!.data, id: id);
    }
    fileIds.addAll(_pictureIdsNew);
    _pictureIdsToRemove.clear();
    _pictureIdsNew.clear();
  }

  @override
  Iterator<Future<DBFile>> get iterator => FileSetIterator(fileIds: fileIds, pictureData: _pictureData, pictureIdsNew: _pictureIdsNew);
}

class FileSetIterator extends Iterator<Future<DBFile>> {
  int idx = -1;
  Future<DBFile>? _current;
  final List<String> fileIds;
  final Map<String, DBFile> pictureData;
  final List<String> pictureIdsNew;

  FileSetIterator({
    required this.fileIds,
    required this.pictureIdsNew,
    required this.pictureData,
  });

  @override
  Future<DBFile> get current {
    return _current != null ? _current! : throw 'fault call for current';
  }

  @override
  bool moveNext() {
    idx++;
    String id;
    if (idx < fileIds.length) {
      id = fileIds[idx];
    } else if (idx < pictureIdsNew.length + fileIds.length) {
      id = pictureIdsNew[idx - fileIds.length];
    } else {
      _current = null;
      return false;
    }

    if (pictureData[id] == null) {
      _current = ApiFilestore.getFile(id).then((value) {
        pictureData[id] = DBFile(id: id, data: value);
        return pictureData[id]!;
      });
    } else {
      _current = Future(() => pictureData[id]!);
    }
    return true;
  }
}
