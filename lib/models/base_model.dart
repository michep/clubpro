import 'package:clubpro/service/security_service.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'base_model.mapper.dart';

@MappableClass(discriminatorKey: '_baseType')
class BaseModel with BaseModelMappable {
  @MappableField(key: '_id')
  String? id;
  DateTime? created;
  @MappableField(key: 'created_by')
  String? createdBy;
  DateTime? modified;
  @MappableField(key: 'modified_by')
  String? modifiedBy;

  BaseModel({
    this.id,
    this.created,
    this.createdBy,
    this.modified,
    this.modifiedBy,
  });

  @mustCallSuper
  void save() {
    var sec = Get.find<SecurityService>();
    if (id == null) {
      created = DateTime.now();
      createdBy = sec.currentUser?.login;
    } else {
      modified = DateTime.now();
      modifiedBy = sec.currentUser?.login;
    }
  }
}

extension BaseModelMethods on BaseModel {}
