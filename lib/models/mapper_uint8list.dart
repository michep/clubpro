import 'dart:convert';
import 'dart:typed_data';
import 'package:dart_mappable/dart_mappable.dart';

class Uint8ListMapper extends SimpleMapper<Uint8List?> {
  @override
  Uint8List? decode(dynamic value) {
    if (value == null) return null;
    return base64Decode(value);
  }

  @override
  dynamic encode(Uint8List? self) {
    if (self == null) return '';
    return base64Encode(self.toList());
  }
}
