import 'package:flutter/material.dart';
import 'package:status/whatsapp_images.dart';
import 'package:status/whatsapp_videos.dart';

class WAOption extends StatefulWidget {
  const WAOption({ Key key }) : super(key: key);

  @override
  _WAOptionState createState() => _WAOptionState();
}

class _WAOptionState extends State<WAOption> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.green,
          title: const Text('Whatsapp Status Saver',
          style: TextStyle( 
              fontSize: 25.0
            ),
            ),
            centerTitle: true,
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
                )
              ),
              child: Column(
                children: [
                  Container(
                     child: Column(
                      children: const [
                     
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
                  
                   child: const Text('Select one to see the Images or Videos',
                                style: TextStyle(color: Colors.black54,
                           fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                   height: 50,
                ),
              
                 Center(
                 
                   child: Container(
                     child: RaisedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WAImages()));
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WAVideos()));
                   },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                   color: Colors.green,
                       padding: EdgeInsets.only(top: 15, bottom: 15, left: 45, right: 40),
                          child: const Text('Videos',style: TextStyle(color: Colors.white,
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

                    