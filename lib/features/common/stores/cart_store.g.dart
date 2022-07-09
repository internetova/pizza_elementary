// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  Computed<int>? _$quantityInCartComputed;

  @override
  int get quantityInCart =>
      (_$quantityInCartComputed ??= Computed<int>(() => super.quantityInCart,
              name: '_CartStore.quantityInCart'))
          .value;
  Computed<int>? _$totalCostComputed;

  @override
  int get totalCost => (_$totalCostComputed ??=
          Computed<int>(() => super.totalCost, name: '_CartStore.totalCost'))
      .value;

  late final _$cartListAtom =
      Atom(name: '_CartStore.cartList', context: context);

  @override
  ObservableList<CustomPizza> get cartList {
    _$cartListAtom.reportRead();
    return super.cartList;
  }

  @override
  set cartList(ObservableList<CustomPizza> value) {
    _$cartListAtom.reportWrite(value, super.cartList, () {
      super.cartList = value;
    });
  }

  late final _$_CartStoreActionController =
      ActionController(name: '_CartStore', context: context);

  @override
  void addPizza(CustomPizza pizza) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.addPizza');
    try {
      return super.addPizza(pizza);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePizza(CustomPizza pizza) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.removePizza');
    try {
      return super.removePizza(pizza);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.clear');
    try {
      return super.clear();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartList: ${cartList},
quantityInCart: ${quantityInCart},
totalCost: ${totalCost}
    ''';
  }
}
