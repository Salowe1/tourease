import 'package:get/get.dart';
import 'package:tourease/model/destination_model.dart';
import 'package:tourease/model/destination_lodging_model.dart';

class CartController extends GetxController {
  RxList<Destination> cartItems = RxList<Destination>();
  RxList<DestinationLodging> lodgingCartItems = RxList<DestinationLodging>();

  void addToCart(Destination destination) {
    cartItems.add(destination);
  }

  void addToLodgingCart(DestinationLodging lodging) {
    lodgingCartItems.add(lodging);
  }

  void removeFromCart(Destination destination) {
    cartItems.remove(destination);
  }

  void removeFromLodgingCart(DestinationLodging lodging) {
    lodgingCartItems.remove(lodging);
  }
   int get cartCount => cartItems.length + lodgingCartItems.length;
}

final CartController cartController = Get.put(CartController());
