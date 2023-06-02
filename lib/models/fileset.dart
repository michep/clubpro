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
class FileSet with FileSetMappable {
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

  bool get isEmpty => fileIds.isEmpty && _pictureIdsNew.isEmpty;
  bool get isNotEmpty => !isEmpty;

  Future<DBFile?> operator [](int idx) async {
    String? id;
    if (idx < fileIds.length) {
      id = fileIds[idx];
    } else if (idx < _pictureIdsNew.length + fileIds.length) {
      id = _pictureIdsNew[fileIds.length - idx];
    }

    if (id == null) return null;

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
    // _pictureData.remove(fileid);
    fileIds.remove(fileid);
    _pictureIdsNew.remove(fileid);
  }

  void clear() {
    _pictureIdsToRemove.addAll(fileIds);
    // _pictureData.clear();
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
}
