// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'fileset.dart';

class FileSetMapper extends ClassMapperBase<FileSet> {
  FileSetMapper._();

  static FileSetMapper? _instance;
  static FileSetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileSetMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'FileSet';

  static List<String> _$fileIds(FileSet v) => v.fileIds;
  static const Field<FileSet, List<String>> _f$fileIds =
      Field('fileIds', _$fileIds, key: 'file_ids', opt: true);

  @override
  final Map<Symbol, Field<FileSet, dynamic>> fields = const {
    #fileIds: _f$fileIds,
  };

  static FileSet _instantiate(DecodingData data) {
    return FileSet(fileIds: data.dec(_f$fileIds));
  }

  @override
  final Function instantiate = _instantiate;

  static FileSet fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<FileSet>(map));
  }

  static FileSet fromJson(String json) {
    return _guard((c) => c.fromJson<FileSet>(json));
  }
}

mixin FileSetMappable {
  String toJson() {
    return FileSetMapper._guard((c) => c.toJson(this as FileSet));
  }

  Map<String, dynamic> toMap() {
    return FileSetMapper._guard((c) => c.toMap(this as FileSet));
  }

  FileSetCopyWith<FileSet, FileSet, FileSet> get copyWith =>
      _FileSetCopyWithImpl(this as FileSet, $identity, $identity);
  @override
  String toString() {
    return FileSetMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FileSetMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return FileSetMapper._guard((c) => c.hash(this));
  }
}

extension FileSetValueCopy<$R, $Out> on ObjectCopyWith<$R, FileSet, $Out> {
  FileSetCopyWith<$R, FileSet, $Out> get $asFileSet =>
      $base.as((v, t, t2) => _FileSetCopyWithImpl(v, t, t2));
}

abstract class FileSetCopyWith<$R, $In extends FileSet, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds;
  $R call({List<String>? fileIds});
  FileSetCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FileSetCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileSet, $Out>
    implements FileSetCopyWith<$R, FileSet, $Out> {
  _FileSetCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileSet> $mapper =
      FileSetMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get fileIds =>
      ListCopyWith($value.fileIds, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(fileIds: v));
  @override
  $R call({Object? fileIds = $none}) =>
      $apply(FieldCopyWithData({if (fileIds != $none) #fileIds: fileIds}));
  @override
  FileSet $make(CopyWithData data) =>
      FileSet(fileIds: data.get(#fileIds, or: $value.fileIds));

  @override
  FileSetCopyWith<$R2, FileSet, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FileSetCopyWithImpl($value, $cast, t);
}
