
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'full_image.dart';

class WAImages extends StatefulWidget {
  @override
  _WAImagesState createState() => _WAImagesState();
}

class _WAImagesState extends State<WAImages> {
  final Directory _imagesDirectory = new Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');
  var imageList;
  getImagesList() {
    var imageList=_imagesDirectory.listSync().map((item) => item.path).where((item) => item.endsWith(".jpg")).toList(growable: false);
    return imageList.length==0
        ?Container(
             
        
         child: Center(
          child: Text("No Status on WhatsApp!",
           style:  TextStyle( 
              fontSize: 30.0
            ),
          ),
        ),

      ):Scaffold(
       appBar: AppBar(
           backgroundColor: Colors.green,
          title: Text('WhatsApp Images',
          style: const TextStyle( 
              fontSize: 25.0
            ),
            ),
            centerTitle: true,
            ),
            
       body: Container(
         padding: EdgeInsets.all(10),
              decoration: BoxDecoration(image:DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover)),
         child: StaggeredGridView.countBuilder(
         crossAxisCount: 4,
         itemCount: imageList.length,
         itemBuilder: (context,index){
           String imagePath=imageList[index];
           return    InkWell(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>FullImage(imageList[index])));
             },
             child: ClipRRect(
               borderRadius: BorderRadius.circular(20.0),
               child: Hero(
                 tag: imageList[index],
                 child: Image.file(
                   File(imagePath),
      
                   fit: BoxFit.fill,
                 ),
               ),
             
           
             ),
           ); 
          
         },
            staggeredTileBuilder: (i) =>
           StaggeredTile.count(2,2.5),
  
            mainAxisSpacing: 7.0,
            crossAxisSpacing: 7.0,
          ),
       ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return !Directory("${_imagesDirectory.path}").existsSync()?
        Container(
          child: Center(child: Text('Install WhatsApp', 
          style: TextStyle(color: Colors.red, fontSize: 25)
          )),
        )
        :getImagesList();
  }
}
