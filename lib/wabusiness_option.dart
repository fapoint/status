import 'package:flutter/material.dart';
import 'package:status/wabusiness_images.dart';
import 'package:status/wabusiness_videos.dart';

class WABusinessOption extends StatefulWidget {
  const WABusinessOption({ Key key }) : super(key: key);

  @override
  _WABusinessOptionState createState() => _WABusinessOptionState();
}
class _WABusinessOptionState extends State<WABusinessOption> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.green,
          title: Text('WA Business Status Saver',
          style: const TextStyle( 
              fontSize: 25.0
            ),
            ),
            centerTitle: true,
            ),
            body: Container(
             decoration: BoxDecoration(image:DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                     child: Column(
                      children: [
                        
                  //             Container(padding: EdgeInsets.all(80),
                  //               child: Text('Whatsapp Status Saver',
                  //               style: TextStyle(color: Colors.black87,
                  //          fontSize: 20, fontWeight: FontWeight.bold),
                  //               ),
                  //             ),
                      ],
                    ),
                 
                  ),
                  Container(
                    child: Column(

             
                mainAxisAlignment:MainAxisAlignment.center,
               children: [
                Container(
                  
                   child: Text('Select one to see the Images or Videos',
                                style: TextStyle(color: Colors.black54,
                           fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                   height: 50,
                ),
              
                 Center(
                 
                   child: Container(
                     child: RaisedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ImageScreen()));
                     },
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                     color: Colors.green,
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
                          child: Text('Images',style: TextStyle(color: Colors.white,
                           fontSize: 18, fontWeight: FontWeight.bold),),
                   ),         
            ),
            
                 ),
                 SizedBox(height: 10,),
                 Container(
                
                   child: RaisedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WABVideos()));
                   },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                   color: Colors.green,
                       padding: EdgeInsets.only(top: 15, bottom: 15, left: 45, right: 40),
                          child: Text('Videos',style: TextStyle(color: Colors.white,
                           fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                   ),
                 ), 
               ],
                    ),
                    height: 400
                  )
                ],
              )
             ),
            
    ),
    );
  }
}

                    