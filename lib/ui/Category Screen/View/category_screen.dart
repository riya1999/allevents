import 'package:allevents/repository/events_repository.dart';
import 'package:allevents/ui/Category%20Screen/ViewModel/category_view_model.dart';
import 'package:allevents/ui/Event%20Screen/ViewModel/event_list_view_model.dart';
import 'package:allevents/ui/Event%20Screen/View/event_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/custom_widgets.dart';
import '../../../utils/diameter_constants.dart';
import '../../../utils/sign_out.dart';
import '../../../utils/string_constants.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with WidgetsBindingObserver{

  final categoryViewModel = Get.find<CategoryViewModel>();
  final eventListViewModel = Get.find<EventListViewModel>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSimpleText(categoryText),
        actions: [
          IconButton(onPressed: () => signOut(context: context), icon: Icon(Icons.logout_outlined))
        ],
      ),
      body:Obx(() => categoryViewModel.isLoading.value ==true ? customLoader() : GridView.builder(
          itemCount: categoryViewModel.categoryList.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0
          ),

          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.all(paddingWith8Dia),
              child: GestureDetector(
                onTap: () {
                  EventsRepository().getMusicList(categoryViewModel.categoryList[index].category).then((value) {
                    if (value?.itemsData != null) {

                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EventScreen(musicData: value!.itemsData!, type: categoryViewModel.categoryList[index].category,)));
                    }
                  });
                },
                child: customGridCategoryTile(categoryViewModel.categoryList[index].category)
              ),
            );
          }
      )),
    );
  }
}
