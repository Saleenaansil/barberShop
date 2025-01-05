import 'package:get/get.dart';

class FilterController extends GetxController {
  RxInt selectedIndex = (-1).obs; // Observable for selected index
var rating = 3.0.obs;
  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
  void updateRating(double newRating) {
    rating.value = newRating;
  }
}
