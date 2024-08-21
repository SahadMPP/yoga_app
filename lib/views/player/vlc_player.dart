import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VlcPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VlcPlayerWidget({
    super.key,
    this.videoUrl =
        'https://media.istockphoto.com/id/1050325938/video/close-up-of-young-beautiful-asian-buddhist-girl-wearing-white-cloth-for-meditation.mp4?s=mp4-640x640-is&k=20&c=70qVkoh7H4hPYhDmYEJdApvJLID70qTqc76I3dj7des=',
  });

  @override
  _VlcPlayerWidgetState createState() => _VlcPlayerWidgetState();
}

class _VlcPlayerWidgetState extends State<VlcPlayerWidget> {
  late VlcPlayerController _vlcPlayerController;

  @override
  void initState() {
    super.initState();
    _vlcPlayerController = VlcPlayerController.network(
      widget.videoUrl,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  void dispose() {
    _vlcPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VLC Player')),
      body: VlcPlayer(
        controller: _vlcPlayerController,
        aspectRatio: 16 / 9,
        virtualDisplay: true,
        placeholder: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
