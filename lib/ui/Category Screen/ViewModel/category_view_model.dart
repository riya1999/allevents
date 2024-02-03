import 'package:allevents/repository/events_repository.dart';
import 'package:get/get.dart';

import '../../../models/response/category_model.dart';

class CategoryViewModel extends FullLifeCycleController {

  RxBool isLoading = true.obs;
  var categoryList = <Category>[].obs;
  var onError = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoryList();
  }


  Future<void> getCategoryList() async{

    var category = await EventsRepository().fetchEventCategories();
    print('CAtegory ${category}');
    if (category != null) {
      isLoading.value = false;
      categoryList.value = category;
    } else {
      isLoading.value = false;
      onError.value = true;
    }

  }




}