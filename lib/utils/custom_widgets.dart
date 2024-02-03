import 'package:allevents/utils/diameter_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'icon_constants.dart';

Widget customLoader() {
  return const Center(child: CircularProgressIndicator(),);
}

Widget customSimpleText(String text) {
  return Text(text);
}

Widget customSizedBoxWith10Height() {
  return const SizedBox(
    height: 10,
  );
}

Widget customGridCategoryTile(String categoryTitle) {
  return Container(
      width:gridTileContainerWidth,
      height: gridTileContainerHeight,
      decoration: BoxDecoration(
          border: Border.all(
              style: BorderStyle.solid
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          categoryIcon,
          customSizedBoxWith10Height(),
          customSimpleText(categoryTitle),
        ],
      ));
}


Widget customTextEllipsisText(String text) {
  return Text(text, overflow: TextOverflow.ellipsis,);
}

Widget customGridEventListTile(String imageUrl, String eventName, String startDate, String eventLocation) {
  return Container(
      decoration: BoxDecoration(
          border: Border.all(
              style: BorderStyle.solid
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customNetworkImageWithHeightWidth(imageUrl),
          customTextEllipsisText(eventName),
          customTextEllipsisText(startDate),
          customTextEllipsisText(eventLocation)
        ],
      ));
}

Widget customEventListTile(BuildContext context, String imageUrl, String eventName, String eventStartDate,String eventLocation) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.94,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      // elevation: 10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                MediaQuery.of(context).size.width *
                    0.28,
                maxHeight:
                MediaQuery.of(context).size.width *
                    0.28,
              ),
              child: customNetworkImage(imageUrl)
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width:
                MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  // padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 5.0),
                  child: customTextWithBoldFontSize16(eventName)
                ),
              ),
              Container(
                width:
                MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 2),
                  child: customTextWithFontSize12(eventStartDate)
                ),
              ),
              Container(
                width:
                MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: customTextWithFontSize12(eventLocation)
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget customTextWithFontSize12(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 12,
    ),
  );
}

Widget customTextWithBoldFontSize16(String text) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );
}


Widget customNetworkImage(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.fill,
    progressIndicatorBuilder: (context, url, progress) => customLoader(),
    errorWidget: (context, url, error) =>
    const Icon(
      Icons.error,
    ),
  );
}

Widget customNetworkImageWithHeightWidth(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.fill,
    width: 200,
    height: 100,
    progressIndicatorBuilder: (context, url, progress) => customLoader(),
    errorWidget: (context, url, error) =>
    const Icon(
      Icons.error,
    ),

  );
}