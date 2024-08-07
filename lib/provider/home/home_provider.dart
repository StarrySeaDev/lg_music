import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lg_music/models/album.dart';

class HomeProvider extends ChangeNotifier {
  List<Album> albumList = [];

  void getTopList() async {
    Dio dio = Dio();
    Response response = await dio.get('https://www.bilibili.com/audio/music-service-c/web/menu/hit?pn=1&ps=10');
    if (response.statusCode == 200) {
      response.data['data'].forEach((element) {
        albumList.add(Album.fromJson(element));
      });
      notifyListeners();
    }
  }
}