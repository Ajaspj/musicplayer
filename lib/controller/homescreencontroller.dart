import 'package:flutter/material.dart';
import 'package:musicplayer/utils/basepage.dart';
import 'package:musicplayer/view/homescreen/homepage.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreenController extends ChangeNotifier {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  //  Songs List
  List<SongModel> songs = [];

  //  Albums List
  List<AlbumModel> albums = [];

  bool isLoading = false;
  bool _hasPermission = false;
  PageController pageController = PageController();
  List<Widget> pageList = [
    const BaseKeepAlivePage(child: HomePage()),
  ];
  int selectedPageIndex = 0;
  HomeScreenController() {
    checkAndRequestPermissions();
  }

  Future<void> getAudio() async {
    await _audioQuery.scanMedia('/storage/emulated/0/');

    // Query Audios
    songs = await _audioQuery.querySongs();

    // Query Albums
    albums = await _audioQuery.queryAlbums();
    notifyListeners();
  }

  checkAndRequestPermissions({bool retry = false}) async {
    // The param 'retryRequest' is false, by default.
    _hasPermission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );

    // Only call update the UI if application has all required permissions.
    _hasPermission ? getAudio(/* RequestType.audio */) : null;
  }
}
