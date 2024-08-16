import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FastingPage extends StatefulWidget {
  @override
  _FastingPageState createState() => _FastingPageState();
}

class _FastingPageState extends State<FastingPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/BMI.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kupunguza uzito kwa kufunga'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_controller.value.isInitialized)
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              else
                Center(child: CircularProgressIndicator()),
              SizedBox(height: 20),
              const Text(
                'Manufaa ya Kufunga kwa Kupunguza Uzito',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                'Fasting, or intermittent fasting, can be an effective way to reduce weight. '
                'Here are some of the key benefits and tips to follow for a successful fasting journey.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              LessonCard(
                title: 'Somo la Kwanza: Nini Kifanyike Kabla ya Kuanza Kufunga?',
                description:
                    'Kabla ya kuanza kufunga, ni muhimu kuelewa jinsi ya kujiandaa. '
                    'Soma zaidi kuhusu maandalizi ya mwili wako na akili yako.',
              ),
              LessonCard(
                title: 'Somo la Pili: Aina za Kufunga',
                description:
                    'Kuna aina tofauti za kufunga. Fahamu aina ya kufunga inayokufaa kulingana na lengo lako la kupunguza uzito.',
              ),
              LessonCard(
                title: 'Somo la Tatu: Chakula Wakati wa Kifungua na Kufuturu',
                description:
                    'Chakula unachokula wakati wa kifungua na kufuturu kina athari kubwa katika malengo yako ya kupunguza uzito.',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add action to navigate to additional resources or next steps
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Anza Mpango',
                  style: TextStyle(fontSize: 18),
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

  LessonCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
