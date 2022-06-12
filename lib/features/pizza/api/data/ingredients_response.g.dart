// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientsResponse _$IngredientsResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'IngredientsResponse',
      json,
      ($checkedConvert) {
        final val = IngredientsResponse(
          $checkedConvert('name', (v) => v as String),
          $checkedConvert('price', (v) => v as int),
          $checkedConvert('imageUrl', (v) => v as String),
        );
        return val;
      },
    );
