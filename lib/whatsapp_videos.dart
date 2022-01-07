import 'package:flutter/material.dart';
import 'package:status/play_video.dart';
import 'dart:io';

import 'package:thumbnails/thumbnails.dart';
import 'package:video_player/video_player.dart';

class WAVideos extends StatefulWidget {
  @override
  _WAVideosState createState() => _WAVideosState();
}

class _WAVideosState extends State<WAVideos> {
  final Directory _videoDirectory = new Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');
  @override
  Widget build(BuildContext context) {
    return !Directory("${_videoDirectory.path}").existsSync()?
        Container(child: Center(child: Text('Install WhatsApp'),),):
        VideoGrid(directory: _videoDirectory,);
  }
}

class VideoGrid extends StatefulWidget {

  Directory directory;
  VideoGrid({this.directory});
  @override
  _VideoGridState createState() => _VideoGridState();
}

class _VideoGridState extends State<VideoGrid> {


  getThumbnail(videoPath) async{
    String thumb=await Thumbnails.getThumbnail(
        videoFile: videoPath,
        imageType:ThumbFormat.PNG,
        quality: 8
    );
    return thumb;
  }

  @override
  Widget build(BuildContext context) {
    var videoList=widget.directory.listSync().map((item) =>item.path).
    where((item) =>item.endsWith(".mp4") ).toList(growable: false);
    return videoList.length==0||videoList==null?
        Container(child: Center(child: Text('No video status found',style: TextStyle(color: Colors.red,fontSize: 30),),),):
        Scaffold(
       appBar: AppBar(
           backgroundColor: Colors.green,
          title: Text('WA Business Images',
          style: const TextStyle( 
              fontSize: 25.0
            ),
            ),
            centerTitle: true,
            ),
            
       body:
        Container(
         
          padding: EdgeInsets.all(10),
             decoration: BoxDecoration(image:DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover)),
          child: GridView.builder(
              itemCount: videoList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing:7.0,
                crossAxisSpacing: 7.0
              ),
            itemBuilder: (context,index){
                return
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>PlayStatus(  videoFile: videoList[index],)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      child: FutureBuilder(
                        future: getThumbnail(videoList[index]),
                        builder: (context,snapshot){
                          if(snapshot.connectionState==ConnectionState.done&&snapshot.hasData) {
                            return Hero(
                                tag:videoList[index],
                                child: Image.file(
                                  File(snapshot.data),
                                  fit: BoxFit.cover,
                                )
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    )
                  ),
                );
            },

          ),
        )
        );
  }
}
