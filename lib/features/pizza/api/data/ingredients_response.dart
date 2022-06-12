import 'package:json_annotation/json_annotation.dart';

part 'ingredients_response.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class IngredientsResponse {
  final String name;
  final int price;
  final String imageUrl;

  IngredientsResponse(
    this.name,
    this.price,
    this.imageUrl,
  );

  factory IngredientsResponse.fromJson(Map<String, dynamic> json) =>
      _$IngredientsResponseFromJson(json);
}
