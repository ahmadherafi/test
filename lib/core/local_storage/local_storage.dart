// import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final storage = GetStorage();
   Future<void> init() async {
    await GetStorage.init("test");
  }

  Future<void> saveToken(String token) async {
    await storage.write('token', token);
  }

  String? getToken() {
    return storage.read('token');
  }

  // Future<void> saveCartItems(List<CartItemModel> cartItem) async {
  //   await storage.write(
  //     'cartItem',
  //     json.encode(
  //       {"cartItem": CartItemModel.toJsonList(cartItem)},
  //     ),
  //   );
  //   print("NNNNNNNNNNNNnn");
  //   print(CartItemModel.toJsonList(cartItem));
  // }

  // Future<List<CartItemModel>> getCartItems() async {
  //   String? item = storage.read("cartItem");
  //   if (item == null || item.isEmpty) {
  //     print("YYYYYYYYYYYyyy");
  //     return [];
  //   } else {
  //     List<dynamic> myJsonList = json.decode(item)['cartItem'];
  //     // log('llll ${myJsonList.length}');
  //     List<CartItemModel> cartItem = CartItemModel.fromJsonList(
  //         json.decode(item), "cartItem",
  //         caching: true);
  //     // print(myJsonList);
  //     print("qqqqqqqqqq");
  //     print(cartItem);
  //     return cartItem;
  //   }
  // }

  // Future<void> clearCart() async {
  //   await storage.remove("cartItem");
  // }

  // Future<void> saveUser(User user) async {
  //   await storage.write("user", user.toJson());
  // }

  // Future<User> get getUser async {
  //   return await storage.read("user") == null
  //       ? User.zero()
  //       : User.fromJson(await storage.read("user"));
  // }

  Future<void> remove() async {
    await storage.erase();
  }
}
