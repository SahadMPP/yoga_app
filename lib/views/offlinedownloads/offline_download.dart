// ignore_for_file: unused_element

import 'dart:developer';

import 'package:divyog/views/offlinedownloads/downlod_player.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class OfflineDownloadsScreen extends StatefulWidget {
  const OfflineDownloadsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OfflineDownloadsScreenState createState() => _OfflineDownloadsScreenState();
}

class _OfflineDownloadsScreenState extends State<OfflineDownloadsScreen> {
  List<FileSystemEntity> _videos = [];

  @override
  void initState() {
    super.initState();
    _loadDownloadedVideos();
  }

  Future<void> _cleanupDirectory() async {
    var dir = await getApplicationDocumentsDirectory();
    var allFiles = dir.listSync();
    for (var file in allFiles) {
      if (file is File) {
        await file.delete();
      }
    }
  }

  Future<void> _loadDownloadedVideos() async {
    var dir = await getApplicationDocumentsDirectory();
    log("Documents directory: ${dir.path}");

    List<FileSystemEntity> allFiles = dir.listSync();
    log("All files in directory: ${allFiles.map((file) => file.path).join(', ')}");

    setState(() {
      _videos = allFiles.where((file) {
        final filePath = file.path.toLowerCase();
        // Strip query parameters if they exist
        final cleanPath = filePath.split('?').first;
        return cleanPath.endsWith('.mp4') ||
            cleanPath.endsWith('.avi') ||
            cleanPath.endsWith('.mov') ||
            cleanPath.endsWith('.mkv') ||
            cleanPath.endsWith('.flv') ||
            cleanPath.endsWith('.wmv');
      }).toList();

      log("Found ${_videos.length} video(s)");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'O F F L I N E  D O W N L O A D S',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_videos[index].path.split('/').last),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VideoPlayerScreen(videoFile: File(_videos[index].path)),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
