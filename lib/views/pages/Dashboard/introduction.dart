import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:kiganjani_afya_check/main.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

class Utangulizi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utangulizi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: UtanguliziPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UtanguliziPage extends StatefulWidget {
  @override
  _UtanguliziPageState createState() => _UtanguliziPageState();
}

class _UtanguliziPageState extends State<UtanguliziPage> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  bool _isPlaying1 = false;
  bool _isPlaying2 = true;

  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.asset('assets/videos/obesity.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller1.play();
        _controller1.setLooping(true);
      });

    _controller2 = VideoPlayerController.asset('assets/videos/BMI.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller2.play();
        _controller2.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _togglePlayPause1() {
    setState(() {
      if (_controller1.value.isPlaying) {
        _controller1.pause();
        _isPlaying1 = false;
      } else {
        _controller1.play();
        _isPlaying1 = true;
      }
    });
  }

  void _togglePlayPause2() {
    setState(() {
      if (_controller2.value.isPlaying) {
        _controller2.pause();
        _isPlaying2 = false;
      } else {
        _controller2.play();
        _isPlaying2 = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Utangulizi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeInDown(
                child: const Text(
                  'Karibu kwenye Safari ya Afya!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              FadeInUp(
                child: const Text(
                  'Furahia mwongozo wa kufikia malengo yako ya kiafya na kuboresha maisha yako.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              _controller2.value.isInitialized
                  ? Column(
                      children: [
                        FadeInLeft(
                          child: AspectRatio(
                            aspectRatio: _controller2.value.aspectRatio,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                VideoPlayer(_controller2),
                                VideoProgressIndicator(
                                  _controller2,
                                  allowScrubbing: true,
                                  colors: const VideoProgressColors(
                                    playedColor: Colors.blueAccent,
                                    bufferedColor: Colors.lightBlueAccent,
                                    backgroundColor: Colors.grey,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isPlaying2
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: _togglePlayPause2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeInLeft(
                          child: const Text(
                            'Video: Jifunze Zaidi',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              const SizedBox(height: 30),
              _controller1.value.isInitialized
                  ? Column(
                      children: [
                        FadeInRight(
                          child: AspectRatio(
                            aspectRatio: _controller1.value.aspectRatio,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                VideoPlayer(_controller1),
                                VideoProgressIndicator(
                                  _controller1,
                                  allowScrubbing: true,
                                  colors: const VideoProgressColors(
                                    playedColor: Colors.blueAccent,
                                    bufferedColor: Colors.lightBlueAccent,
                                    backgroundColor: Colors.grey,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isPlaying1
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: _togglePlayPause1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeInRight(
                          child: const Text(
                            'Video: Kujua Afya Yako',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              const SizedBox(height: 30),
              FadeInRight(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Anza Safari Yako',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FadeInRight(
                child: TextButton(
                  onPressed: () {
                    // Navigate to more info
                  },
                  child: const Text(
                    'Jifunze Zaidi',
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Training Lessons Section
              FadeInUp(
                child: const Text(
                  'Masomo ya Mafunzo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              FadeInLeft(
                child: LessonCard(
                  title: 'Mazoezi ya Msingi',
                  description:
                      'Jifunze mbinu bora za kufanya mazoezi kwa urahisi na kwa usalama.',
                  onTap: () {
                    // Navigate to lesson
                  },
                ),
              ),
              const SizedBox(height: 10),
              FadeInRight(
                child: LessonCard(
                  title: 'Lishe Bora',
                  description:
                      'Pata mwongozo wa lishe bora kwa afya bora na kupunguza uzito.',
                  onTap: () {
                    // Navigate to lesson
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  LessonCard({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
