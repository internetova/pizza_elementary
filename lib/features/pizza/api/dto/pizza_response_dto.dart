import 'package:json_annotation/json_annotation.dart';

part 'pizza_response_dto.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class PizzaResponseDTO {
  final int id;
  final String title;
  final List<String> ingredients;
  final double price;
  final String imageUrl;
  final String description;

  PizzaResponseDTO(
    this.id,
    this.title,
    this.ingredients,
    this.price,
    this.imageUrl,
    this.description,
  );

  factory PizzaResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PizzaResponseDTOFromJson(json);
}
