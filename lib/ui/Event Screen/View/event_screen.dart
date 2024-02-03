import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/response/music_model.dart';
import '../../../utils/custom_web_view.dart';
import '../../../utils/custom_widgets.dart';
import '../../../utils/icon_constants.dart';

class EventScreen extends StatefulWidget {
  final List<ItemsData> musicData;
  final String type;

  const EventScreen({super.key, required this.musicData, required this.type});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  RxBool isGridViewVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text(widget.type),
          actions: [
            IconButton(
                onPressed: () {
                  if (isGridViewVisible.value == true) {
                    isGridViewVisible.value = false;
                  } else {
                    isGridViewVisible.value = true;
                  }
                },
                icon: Obx(() =>
                    isGridViewVisible.value == true ? listIcon : gridIcon))
          ],
        ),
        body: Obx(() => isGridViewVisible.value == true
            ? GridView.builder(
                itemCount: widget.musicData.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WebViewClass(
                                  url: widget.musicData[index].eventUrl
                                      .toString(),
                                  title: widget.musicData[index].eventRawName
                                      .toString(),
                                )));
                      },
                      child: customGridEventListTile(
                          widget.musicData[index].thumbUrl.toString(),
                          widget.musicData[index].eventRawName.toString(),
                          widget.musicData[index].startDate.toString(),
                        widget.musicData[index].location.toString()
                      ),
                    ),
                  );
                })
            : ListView.builder(
                itemCount: widget.musicData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 5.0, top: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WebViewClass(
                                  url: widget.musicData[index].eventUrl
                                      .toString(),
                                  title: widget.musicData[index].eventRawName
                                      .toString(),
                                )));
                      },
                      child: customEventListTile(context,widget.musicData[index].thumbUrl
                          .toString(),
                          widget.musicData[index].eventRawName
                              .toString(),
                          widget.musicData[index].startDate
                              .toString(),
                          widget.musicData[index].location
                              .toString()
                      ),
                    ),
                  );
                })));
  }
}
