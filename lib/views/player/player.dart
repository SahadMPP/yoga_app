import 'package:chewie/chewie.dart';
import 'package:divyog/controller/download/download_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/utils/constants/height_width.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  const Player({
    super.key,
    this.title = 'Asana',
    required this.tag,
    // Added videoUrl parameter
  });

  final String title;
  final int tag;
  final String videoUrl =
      'https://media.istockphoto.com/id/1050325938/video/close-up-of-young-beautiful-asian-buddhist-girl-wearing-white-cloth-for-meditation.mp4?s=mp4-640x640-is&k=20&c=70qVkoh7H4hPYhDmYEJdApvJLID70qTqc76I3dj7des='; // Added videoUrl parameter

  @override
  State<StatefulWidget> createState() {
    return _PlayerState();
  }
}

class _PlayerState extends State<Player> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  final DownloadController _downloadController = Get.put(DownloadController());

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    try {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      await _videoPlayerController.initialize();
      _createChewieController();
      setState(() {});
    } catch (e) {
      print("Error initializing video player: $e");
    }
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoInitialize: true,
      looping: false,
      allowFullScreen: true,
      showControls: true,
      placeholder: Center(
        child: CircularProgressIndicator(),
      ),
      errorBuilder: (context, errorMessage) {
        return Center(child: Text('Error loading video: $errorMessage'));
      },
    );
  }

  Future<void> _handleDownload() async {
    final fileName = widget.videoUrl.split('/').last;
    await _downloadController.downloadVideo(widget.videoUrl, fileName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: sblack, size: 20)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.cast_outlined))
        ],
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: _chewieController == null ||
                    !_videoPlayerController.value.isInitialized
                ? const Center(child: CircularProgressIndicator())
                : Chewie(controller: _chewieController!),
          ),
          const Material(
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 30, right: 30, bottom: 0),
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Duration',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '12 Min',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Difficulty',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Medium',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: sWhite),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '''What is Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,''',
                      ),
                      sh10,
                      HeadingTextstyle(text: 'Benefits'),
                      Divider(),
                      ListView.builder(
                        itemCount: 3, // Replace with your list item count
                        shrinkWrap:
                            true, // Allows the ListView to take up only the space it needs
                        physics:
                            const NeverScrollableScrollPhysics(), // Prevents the ListView from scrolling independently
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: sblack,
                                ),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Text(
                                    '''What is Lorem mbol that can be used to represent a specific function or piece of content within the app. Flutter icons are ...''',
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      HeadingTextstyle(text: "Required  Equipment"),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: sblack,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                '''Yogamat
''',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: sGreen,
              ),
            ),
            IconButton(
              onPressed: _handleDownload,
              icon: Icon(
                Icons.download_outlined,
                color: sblue400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
