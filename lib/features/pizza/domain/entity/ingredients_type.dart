import 'package:pizza_elementary/features/pizza/constants/pizza_strings.dart';

enum IngredientsType {
  bacon(name: PizzaStrings.typeBacon),
  pepperoni(name: PizzaStrings.typePepperoni),
  ham(name: PizzaStrings.typeHam),
  tomatoes(name: PizzaStrings.typeTomatoes),
  champignons(name: PizzaStrings.typeChampignons),
  pickledCucumbers(name: PizzaStrings.typePickledCucumbers),
  sweetPepper(name: PizzaStrings.typeSweetPepper),
  redOnion(name: PizzaStrings.typeRedOnion),
  garlic(name: PizzaStrings.typeGarlic),
  jalapeno(name: PizzaStrings.typeJalapeno),
  pineapple(name: PizzaStrings.typePineapple),
  italianHerbs(name: PizzaStrings.typeItalianHerbs),
  cheddarAndParmesan(name: PizzaStrings.typeCheddarAndParmesan),
  mozzarella(name: PizzaStrings.typeMozzarella),
  cheeseCubes(name: PizzaStrings.typeCheeseCubes),
  olives(name: PizzaStrings.typeOlives),
  chicken(name: PizzaStrings.typeChicken),
  unknown(name: PizzaStrings.typeUnknown);

  final String name;

  const IngredientsType({required this.name});
}
