// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controllers/music_controller.dart';
//
// class HomeView extends GetView<HomeController> {
//   const HomeView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HomeView'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//           child: ElevatedButton(
//               onPressed: () async {
//                 final player = AudioPlayer();
//                 await player.play(UrlSource('sound.wav'));
//               },
//               child: const Text('Click me for hear sound'))),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/app/routes/app_pages.dart';

import '../controllers/music_controller.dart';

class MusicView extends GetView<HomeController> {
  const MusicView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff3C415C),
              Color(0xff232323),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.topLeft,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Music Play",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GetBuilder<HomeController>(
                  builder: (controller) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.musicList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        controller
                            .playMusic(controller.musicList[index]["url"]);
                        controller.currentTitle.value =
                            controller.musicList[index]["title"];
                        controller.currentArtist.value =
                            controller.musicList[index]["artist"];
                        controller.currentCover.value =
                            controller.musicList[index]["cover"];
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              controller.musicList[index]["cover"]),
                        ),
                        title: Text(
                          controller.musicList[index]["title"],
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          controller.musicList[index]["artist"],
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w200),
                        ),
                        trailing: Container(
                          margin: const EdgeInsets.all(17.0),
                          child: Icon(
                            Icons.music_note,
                            color: Colors.blueGrey.shade200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const Divider(color: Colors.white),
                  GetBuilder<HomeController>(
                    builder: (controller) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(controller.currentCover.value),
                      ),
                      title: Text(
                        controller.currentTitle.value,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        controller.currentArtist.value,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                      trailing: Container(
                        height: 40.0,
                        width: 40.0,
                        margin: const EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => controller.pauseOrResumeMusic(),
                          icon: Icon(
                            controller.btnIcon.value,
                            size: 26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GetBuilder<HomeController>(
                    builder: (controller) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${controller.musicPosition.inMinutes}:${controller.musicPosition.inSeconds.remainder(60)}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                          Expanded(
                            child: Slider.adaptive(
                              activeColor: Colors.white,
                              inactiveColor: Colors.grey,
                              value:
                                  controller.musicPosition.inSeconds.toDouble(),
                              max:
                                  controller.musicDuration.inSeconds.toDouble(),
                              onChanged: (val) {
                                final position = Duration(seconds: val.toInt());
                                controller.seekToPosition(position);
                              },
                            ),
                          ),
                          Text(
                            "${controller.musicDuration.inMinutes}:${controller.musicDuration.inSeconds.remainder(60)}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: const Text('Register'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
