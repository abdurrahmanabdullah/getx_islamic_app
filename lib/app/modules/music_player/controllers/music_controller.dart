import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final audioPlayer = AudioPlayer();
  final isPlaying = false.obs;
  final currentTitle = ''.obs;
  final currentArtist = ''.obs;
  final currentCover = ''.obs;
  final currentSong = ''.obs;
  final btnIcon = Icons.play_arrow.obs;

  Duration musicDuration = const Duration();
  Duration musicPosition = const Duration();

  List musicList = [
    {
      "title": "Life is a Dream",
      "artist": "Michael Ramir",
      "cover":
          "https://images.pexels.com/photos/1884306/pexels-photo-1884306.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-life-is-a-dream-837.mp3",
    },
    {
      "title": "Feeling Happy",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/2682877/pexels-photo-2682877.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-feeling-happy-5.mp3",
    },
    {
      "title": "Dance with Me",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/235615/pexels-photo-235615.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-dance-with-me-3.mp3",
    },
    {
      "title": "Sleepy Cat",
      "artist": "Alejandro Magaña",
      "cover":
          "https://images.pexels.com/photos/1122868/pexels-photo-1122868.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-sleepy-cat-135.mp3",
    },
    {
      "title": "Delightful",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/259707/pexels-photo-259707.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-delightful-4.mp3",
    },
    {
      "title": "Life is a Dream",
      "artist": "Michael Ramir",
      "cover":
          "https://images.pexels.com/photos/1884306/pexels-photo-1884306.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-life-is-a-dream-837.mp3",
    },
    {
      "title": "Feeling Happy",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/2682877/pexels-photo-2682877.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-feeling-happy-5.mp3",
    },
    {
      "title": "Dance with Me",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/235615/pexels-photo-235615.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url":
          "https://assets.mixkit.co/music/preview/mixkit-dance-with-me-3.mp3",
    },
    {
      "title": "Sleepy Cat",
      "artist": "Alejandro Magaña",
      "cover":
          "https://images.pexels.com/photos/1122868/pexels-photo-1122868.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-sleepy-cat-135.mp3",
    },
    {
      "title": "Delightful",
      "artist": "Ahjay Stelino",
      "cover":
          "https://images.pexels.com/photos/259707/pexels-photo-259707.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "url": "https://assets.mixkit.co/music/preview/mixkit-delightful-4.mp3",
    },
  ];

  @override
  void onInit() {
    super.onInit();
    audioPlayer.onDurationChanged.listen((event) {
      musicDuration = event;
      update();
    });

    audioPlayer.onPositionChanged.listen((event) {
      musicPosition = event;
      update();
    });
  }

  void seekToPosition(Duration position) {
    audioPlayer.seek(position);
  }

  //
  // if (isPlaying.value && currentSong.value != url) {
  // This condition checks if music is currently playing (isPlaying.value is true) and if the URL of the current song (currentSong.value) is different from the new URL (url).
  // If both conditions are met, it means that a different song needs to be played, so the current song should be paused first.

  void playMusic(String url) async {
    if (isPlaying.value && currentSong.value != url) {
      await audioPlayer.pause();
      await audioPlayer.play(UrlSource(url));
      currentSong.value = url;
      isPlaying.value = true;
      btnIcon.value = Icons.pause;
    } else if (!isPlaying.value) {
      await audioPlayer.play(UrlSource(url));
      isPlaying.value = true;
      btnIcon.value = Icons.pause;
    }
  }

  void pauseOrResumeMusic() {
    if (isPlaying.value) {
      audioPlayer.pause();
      btnIcon.value = Icons.play_arrow;
      isPlaying.value = false;
    } else {
      audioPlayer.resume();
      btnIcon.value = Icons.pause;
      isPlaying.value = true;
    }
  }
}
