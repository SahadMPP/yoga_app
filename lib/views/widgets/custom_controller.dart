import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';

class CustomControls extends StatefulWidget {
  final ChewieController chewieController;

  const CustomControls({super.key, required this.chewieController});

  @override
  _CustomControlsState createState() => _CustomControlsState();
}

class _CustomControlsState extends State<CustomControls> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video player controls can go here
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    widget.chewieController.videoPlayerController.value
                            .isPlaying
                        ? widget.chewieController.videoPlayerController.pause()
                        : widget.chewieController.videoPlayerController.play();
                  },
                  icon: Icon(
                    widget.chewieController.videoPlayerController.value
                            .isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${widget.chewieController.videoPlayerController.value.position.inMinutes}:${(widget.chewieController.videoPlayerController.value.position.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    widget.chewieController.enterFullScreen();
                  },
                  icon: Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
