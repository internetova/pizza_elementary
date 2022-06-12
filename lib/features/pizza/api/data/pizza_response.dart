import 'package:json_annotation/json_annotation.dart';

part 'pizza_response.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class PizzaResponse {
  final int id;
  final String title;
  final PizzaBaseResponse base;
  final String sauce;
  final List<String> ingredients;
  final int price;
  final String imageUrl;

  PizzaResponse(
    this.id,
    this.title,
    this.base,
    this.sauce,
    this.ingredients,
    this.price,
    this.imageUrl,
  );

  factory PizzaResponse.fromJson(Map<String, dynamic> json) => _$PizzaResponseFromJson(json);
}

@JsonSerializable()
class PizzaBaseResponse {
  final String size;

  PizzaBaseResponse(this.size);

  factory PizzaBaseResponse.fromJson(Map<String, dynamic> json) => _$PizzaBaseResponseFromJson(json);
}
