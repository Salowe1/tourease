import 'package:get/get.dart';
import 'package:tourease/model/destination_lodging_model.dart';
import 'package:tourease/model/destination_model.dart';

class FavoriteController extends GetxController {
  var _favoriteDestinations = <Destination>[].obs;
  var _favoriteDestinationsLodging = <DestinationLodging>[].obs;

  List<Destination> get favoriteDestinations => _favoriteDestinations.value;
  List<DestinationLodging> get favoriteDestinationsLodging => _favoriteDestinationsLodging.value;

  bool isFavorite(Destination destination) {
    return _favoriteDestinations.contains(destination);
  }

  bool isFavoriteLodging(DestinationLodging destinationLodging) {
    return _favoriteDestinationsLodging.contains(destinationLodging);
  }

  void toggleFavorite(Destination destination) {
    if (isFavorite(destination)) {
      _favoriteDestinations.remove(destination);
    } else {
      _favoriteDestinations.add(destination);
    }
  }

  void toggleFavoriteLodging(DestinationLodging destinationLodging) {
    if (isFavoriteLodging(destinationLodging)) {
      _favoriteDestinationsLodging.remove(destinationLodging);
    } else {
      _favoriteDestinationsLodging.add(destinationLodging);
    }
  }
}
