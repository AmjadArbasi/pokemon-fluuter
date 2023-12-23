import 'package:pokdmon/src/features/pokemon/domain/entities/types_entity.dart';

class TypesModel extends TypesEntity {
  TypesModel({required super.type});

  factory TypesModel.fromJson(Map<String, dynamic> parsedJson) {
    return TypesModel(type: TypeModel.fromJson(parsedJson["type"]));
  }

  Map<String, dynamic> toJson() {
    return {"type": type};
  }
}

class TypeModel extends TypeEntity {
  TypeModel({required super.name});

  factory TypeModel.fromJson(Map<String, dynamic> parsedJson) {
    return TypeModel(name: parsedJson["name"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name};
  }
}

// final List<TypesEntity> types; => TypeEntity  => name;