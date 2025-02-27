import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../bloc/movie/videobloc/bloc/video_bloc.dart'; 

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    _controller?.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Scaffold(
      body: BlocBuilder<VideoBloc, VideoState>(builder: (context, state) {
        if (state is MovieVIDEOSUCCESS) {
           if (state.data.results.isEmpty) {
             
               return Center(
            child: Text(
             'video not available now',
              style: const TextStyle(color: Colors.white),
            ),
          );
           }else{
          String videoKey = state.data.results[0].key;
          _controller = YoutubePlayerController(
            initialVideoId: videoKey,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              showLiveFullscreenButton: true, 
              enableCaption: false,
              isLive: false,
            useHybridComposition : true,
            ),
          );

          return Stack(
            children: [
              Center(
                child: YoutubePlayer(
                  controller: _controller!,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: khhomecolor,
                  progressColors: const ProgressBarColors(
                    backgroundColor: Colors.white,
                    playedColor: khhomecolor,
                    handleColor: khhomecolor,
                  ),
                  liveUIColor: khhomecolor,
                  onReady: () {
                    _controller?.addListener(() {
                      if (_controller?.value.isFullScreen == true) {

                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.landscapeRight,
                        ]);
                      } else if (_controller?.value.isFullScreen == false) {

                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.portraitDown,
                        ]);
                      }
                    });
                  },
                  onEnded: (YoutubeMetaData metaData) {
                    Navigator.pop(context); 
                  },
                ),
              ),
             
              Positioned(
                top: 30,  
                right: 10, 
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.pop(context); // Closes the video and goes back
                  },
                ),
              ),
            ],
          );
        } }else if (state is MovieVIDEOFALIURE) {
          return Center(
            child: Text(
              state.failure.errMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else {
          return ShimmerLoading(
              width: Screan_size.width,
              height: Screan_size.hieght,
              borderraduis: 0);
        }
      }),
    );
  }
}
