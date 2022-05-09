// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PizzaResponseDTO _$PizzaResponseDTOFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PizzaResponseDTO',
      json,
      ($checkedConvert) {
        final val = PizzaResponseDTO(
          $checkedConvert('id', (v) => v as int),
          $checkedConvert('title', (v) => v as String),
          $checkedConvert('ingredients',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          $checkedConvert('price', (v) => (v as num).toDouble()),
          $checkedConvert('imageUrl', (v) => v as String),
          $checkedConvert('description', (v) => v as String),
        );
        return val;
      },
    );
