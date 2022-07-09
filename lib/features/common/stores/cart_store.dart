import 'package:mobx/mobx.dart';
import 'package:pizza_elementary/features/pizza/domain/entity/custom_pizza.dart';

part 'cart_store.g.dart';

/// Хранилище для корзины
/// По хорошему тут еще надо сделать сохранение корзины в локальное хранилище,
/// но это не в рамках этого примера
class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  ObservableList<CustomPizza> cartList = ObservableList<CustomPizza>.of([]);
  
  /// количество в корзине
  @computed
  int get quantityInCart => cartList.length;

  /// итоговая цена в корзине
  @computed
  int get totalCost => cartList.map((e) => e.price).reduce((value, element) => value + element);

  @action
  void addPizza(CustomPizza pizza) {
    cartList.add(pizza);
  }

  @action
  void removePizza(CustomPizza pizza) {
    cartList.remove(pizza);
  }

  @action
  void clear() {
    cartList.clear();
  }
}
