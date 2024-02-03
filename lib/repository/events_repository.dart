import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;

import '../models/response/category_model.dart';
import '../models/response/music_model.dart';



class EventsRepository {

  Future<MusicData?> getMusicList(String type) async {
    try {
      final response = await http.get(Uri.parse('https://allevents.s3.amazonaws.com/tests/$type.json'));
      var map = json.decode(response.body);
      MusicData data = MusicData.fromJson(map);
      return data;
    } catch(err) {
      throw err;
    }
  }

  Future<List<Category>> fetchEventCategories() async {
    final response = await http.get(Uri.parse('https://allevents.s3.amazonaws.com/tests/categories.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load event categories');
    }
  }




}
