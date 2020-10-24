import 'package:flutter/cupertino.dart';
import 'package:youtube_ui_clone/models/video.dart';
import 'package:flutter/material.dart';

class VideoLibrary extends ChangeNotifier {
  List<Video> likedVideos;
  List<Video> dislikedVideos;
  List<Video> watchedVideos;

  VideoLibrary() {
    this.likedVideos = [];
    this.dislikedVideos = [];
    this.watchedVideos = [];
  }

  void likeTheVideo(Video video) {
    likedVideos.add(video);
    for (int i = 0; i < dislikedVideos.length; i++) {
      if (video == dislikedVideos[i]) {
        dislikedVideos.remove(video);
      }
    }
    print("liked: " "${likedVideos.length}");
    print("disliked: " "${dislikedVideos.length}");
    notifyListeners();
  }

  void unlikeTheVideo(Video video) {
    likedVideos.remove(video);
    print("liked: " "${likedVideos.length}");
    print("disliked: " "${dislikedVideos.length}");
    notifyListeners();
  }

  void undislikeTheVideo(Video video) {
    dislikedVideos.remove(video);
    print("liked: " "${likedVideos.length}");
    print("disliked: " "${dislikedVideos.length}");
    notifyListeners();
  }

  void dislikeTheVideo(Video video) {
    dislikedVideos.add(video);
    for (int i = 0; i < likedVideos.length; i++) {
      if (video == likedVideos[i]) {
        likedVideos.remove(video);
      }
    }
    print("disliked: " "${dislikedVideos.length}");
    print("liked: " "${likedVideos.length}");
    notifyListeners();
  }

  void watcheTheVideo(Video video) {
    watchedVideos.add(video);
    print("${watchedVideos.length}");
    notifyListeners();
  }

  bool isWatched(Video video) {
    for (int i = 0; i < watchedVideos.length; i++) {
      if (video == watchedVideos[i]) {
        return true;
      }
    }
    return false;
  }

  bool isLiked(Video video) {
    for (int i = 0; i < likedVideos.length; i++) {
      if (video == likedVideos[i]) {
        return true;
      }
    }
    return false;
  }

  bool isDisliked(Video video) {
    for (int i = 0; i < dislikedVideos.length; i++) {
      if (video == dislikedVideos[i]) {
        return true;
      }
    }
    return false;
  }
}
