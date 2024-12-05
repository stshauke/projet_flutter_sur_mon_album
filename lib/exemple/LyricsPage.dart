import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LyricsPage extends StatefulWidget {
  final String title;
  final String lyrics;
  final String url;

  const LyricsPage({
    Key? key,
    required this.title,
    required this.lyrics,
    required this.url,
  }) : super(key: key);

  @override
  _LyricsPageState createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  bool _showVideoPlayer = false;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the YouTube controller with the video ID from the URL
    String videoId = YoutubePlayer.convertUrlToId(widget.url) ?? "";
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: const Color.fromARGB(255, 193, 235, 194),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(widget.lyrics, style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showVideoPlayer = true;
                        });
                      },
                      icon: const Icon(Icons.music_note),
                      label: const Text("Écouter la chanson"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Afficher le lecteur vidéo sous la carte
            if (_showVideoPlayer)
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
          ],
        ),
      ),
    );
  }
}
