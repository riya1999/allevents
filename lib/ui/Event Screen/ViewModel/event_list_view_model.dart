import 'package:allevents/repository/events_repository.dart';
import 'package:get/get.dart';

class EventListViewModel extends FullLifeCycleController {


  Future<void> getAllEventsList(String type) async {
    final eventList = await EventsRepository().getMusicList(type);
    print('EVENT ${eventList?.itemsData}');
  }



}



