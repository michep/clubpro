import 'dart:convert';
import 'dart:typed_data';
import 'package:dart_mappable/dart_mappable.dart';

class Uint8ListMapper extends SimpleMapper<Uint8List> {
  const Uint8ListMapper();

  @override
  Uint8List decode(dynamic value) {
    return base64Decode(value);
  }

  @override
  dynamic encode(Uint8List self) {
    return base64Encode(self.toList());
  }
}
