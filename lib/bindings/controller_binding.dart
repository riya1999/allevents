import 'package:allevents/ui/Category%20Screen/ViewModel/category_view_model.dart';
import 'package:allevents/ui/Event%20Screen/ViewModel/event_list_view_model.dart';
import 'package:allevents/ui/Event%20Screen/View/event_screen.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryViewModel>(CategoryViewModel());
    Get.put<EventListViewModel>(EventListViewModel());
  }

}