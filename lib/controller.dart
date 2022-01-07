// import 'package:flutter/material.dart';

// class Images extends StatefulWidget {
//   const Images({ Key key }) : super(key: key);

//   @override
//   _ImagesState createState() => _ImagesState();
// }

// class _ImagesState extends State<Images> {
//    Container MyArticles(String Assests, String Heading){
//      return Container(
//        width: 410,
//        child: Card(
//          child: Wrap(
//            children: <Widget>[
//                         Image.asset(Assests),
//                         ListTile(
//                           title: Text(Heading),
//                         )
//                       ],
//          ),
//        )
//      );
//    }
//   @override
//   Widget build(BuildContext context) {
   
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//           home: Scaffold(
           

//             body: Container(
              
           
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
                 
//                  MyArticles("assets/1.jpg", "Price: 0.69\$"),
//                  MyArticles("assets/3.jpg", "Price: 0.69\$"),
//                  MyArticles("assets/4.jpg", "Price: 0.69\$"),
//                  MyArticles("assets/5.jpg", "Price: 0.69\$"),
//                  MyArticles("assets/6.jpg", "Price: 0.69\$"),
//                  MyArticles("assets/7.jpg", "Price: 0.69\$"),
//                  MyArticles("assets/8.jpg", "Price: 0.69\$"),
//                  MyArticles("assets/9.jpg", "Price: 0.69\$"),
//                  MyArticles("assets/10.jpg","Price: 0.69\$"),
//                 ]
//               ),
//             )
//           ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class StatusVideo extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final String videoSrc;
  final double aspectRatio;

  const StatusVideo({
    @required this.videoPlayerController,
    this.looping,
    this.videoSrc,
    this.aspectRatio,
    Key key,
  }) : super(key: key);

  @override
  _StatusVideoState createState() => _StatusVideoState();
}

class _StatusVideoState extends State<StatusVideo> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        autoInitialize: true,
        looping: widget.looping,
        allowFullScreen: true,
        aspectRatio: widget.videoPlayerController.value.aspectRatio,
        // autoPlay: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(errorMessage),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print(' aspect ratio: ${widget.videoPlayerController.value}');
    return Container(
            padding: const EdgeInsets.only(top: 0),
            child: Hero(
              tag: widget.videoSrc,
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          );
    //     ],
    //   ),
    // );
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}