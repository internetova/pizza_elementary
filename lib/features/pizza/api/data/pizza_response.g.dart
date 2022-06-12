// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PizzaResponse _$PizzaResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PizzaResponse',
      json,
      ($checkedConvert) {
        final val = PizzaResponse(
          $checkedConvert('id', (v) => v as int),
          $checkedConvert('title', (v) => v as String),
          $checkedConvert('base',
              (v) => PizzaBaseResponse.fromJson(v as Map<String, dynamic>)),
          $checkedConvert('sauce', (v) => v as String),
          $checkedConvert('ingredients',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          $checkedConvert('price', (v) => v as int),
          $checkedConvert('imageUrl', (v) => v as String),
        );
        return val;
      },
    );

PizzaBaseResponse _$PizzaBaseResponseFromJson(Map<String, dynamic> json) =>
    PizzaBaseResponse(
      json['size'] as String,
    );

Map<String, dynamic> _$PizzaBaseResponseToJson(PizzaBaseResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
    };
