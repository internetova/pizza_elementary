# pizza_elementary

Пример реализации проекта на **elementary** + **mobx** c использованием паттернов проектирования GOF абстрактная фабрика, билдер.

https://pub.dev/packages/elementary

Mobx использовался для реализации корзины заказов.

Паттерн **абстрактная фабрика** использовался для реализации платформенных виджетов:
- Апп бар: CupertinoNavigationBar / AppBar
- Нижняя навигация: CupertinoTabBar / BottomNavigationBar
- Алерт диалоги: CupertinoAlertDialog / AlertDialog
- Кнопка заказа: CupertinoButton / ElevatedButton
- Индикатор загрузки: CupertinoActivityIndicator / CircularProgressIndicator
- PageRoute: CupertinoPageRouter / MaterialPageRouter
- BottomSheet: пакет modal_bottom_sheet

Паттерн **билдер** использовался для создания кастомных экземпляров пиццы

## Demo

![Demo ios](docs/demo-ios.gif) ![Demo Android](docs/demo-andr.gif)

## Фото

![Фото](docs/1.png)

![Фото](docs/2.png)

![Фото](docs/3.png)

![Фото](docs/4.png)
