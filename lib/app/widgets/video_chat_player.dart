import 'dart:developer';
import 'dart:io';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:bloc_app/app/util/reponsive.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoChatPlayerWidget extends StatefulWidget {
  final String url;
  VideoChatPlayerWidget({
    required this.url,
  });

  @override
  State<VideoChatPlayerWidget> createState() => _VideoChatPlayerWidgetState();
}

class _VideoChatPlayerWidgetState extends State<VideoChatPlayerWidget> {
  late VideoPlayerController _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.url,
    );
    _initializeVideoPlayerFuture = _controller.initialize().then((value) => {
          _controller.addListener(() {
            //custom Listner

            setState(() {
              if (!_controller.value.isPlaying &&
                  _controller.value.isInitialized &&
                  (_controller.value.duration == _controller.value.position)) {
                //checking the duration and position every time
                //Video Completed//
                setState(() {});
              }
            });
          })
        });

    _controller.setLooping(false);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: playOrPuaseVideo,
        child: Container(
          color: Colors.black,
          width: getWidth(context),
          height: getHeight(context),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(
                        _controller,
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              Align(
                alignment: Alignment.center,
                child: !_controller.value.isPlaying ||
                        _controller.value.position == _controller.value.duration
                    ? Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 35,
                        ))
                    : SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ProgressBar(
                    timeLabelLocation: TimeLabelLocation.sides,
                    progress: _controller.value.position,
                    progressBarColor: Colors.white,
                    baseBarColor: Colors.white.withOpacity(0.3),
                    thumbGlowColor: Colors.white,
                    thumbColor: Colors.white,
                    timeLabelTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                    total: _controller.value.duration,
                    onSeek: (duration) {
                      _controller.seekTo(duration);
                      setState(() {});
                    },
                  ),
                  //  VideoProgressIndicator(
                  //     padding: paddingDefault,
                  //     colors: VideoProgressColors(
                  //         backgroundColor: Colors.red.withOpacity(0.4),
                  //         bufferedColor: Colors.white,
                  //         playedColor: Colors.grey),
                  //     _controller,
                  //     allowScrubbing: false)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void playOrPuaseVideo() async {
    try {
      print(_controller.value.isPlaying);
      if (_controller.value.isPlaying) {
        await _controller.pause();
      } else {
        await _controller.play();
      }
      print(_controller.value.isInitialized);
      setState(() {});
    } catch (e) {
      log(e.toString());
    }
  }
}
