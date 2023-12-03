import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'misi1_page.dart';

const Color primaryColor = Color(0xFF023C40);
const Color buttonColor = Color(0xFF023A3F);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pretest2misi1Page(
        completeLevel: (level) {
          // Handle level completion
          print('Level $level completed!');
        },
      ),
    );
  }
}

class Pretest2misi1Page extends StatefulWidget {
  final void Function(int) completeLevel;

  Pretest2misi1Page({required this.completeLevel});

  @override
  _Pretest2misi1PageState createState() => _Pretest2misi1PageState();
}

class _Pretest2misi1PageState extends State<Pretest2misi1Page> {
  late CustomVideoPlayerController _customVideoPlayerController;
  String assetVideoPath = "video/videomisi1_penjumlahan1.mp4";
  bool isVideoCompleted = false;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 2', style: TextStyle(color: primaryColor)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(),
      ),
      body: Column(
        children: [
          CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController),
          SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.09),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Video Pembelajaran',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Untuk memulai petualangan, kamu tentunya butuh persiapan agar dapat menghadapi rintangan, ayo persiapkan diri dengan menonton video ini',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 40),
          if (isVideoCompleted)
            ElevatedButton(
              onPressed: () {
                widget.completeLevel(2);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Misi1Page(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.width * 0.12,
                ),
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Buka Peta Petualangan'),
            ),
        ],
      ),
    );
  }

  void initializeVideoPlayer() {
    VideoPlayerController? _videoPlayerController; // Declare as nullable
    _videoPlayerController = VideoPlayerController.asset(assetVideoPath)
      ..initialize().then((value) {
        setState(() {});

        _videoPlayerController!.addListener(() {
          if (_videoPlayerController!.value.position == _videoPlayerController!.value.duration) {
            setState(() {
              isVideoCompleted = true;
            });
            widget.completeLevel(2);
          }
        });
      });

    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _videoPlayerController!);
  }
}
