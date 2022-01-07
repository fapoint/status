import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:status/permission_handler.dart';

class Splash extends StatefulWidget {
  const Splash({ Key key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  SplashScreen(
      seconds: 3,
      navigateAfterSeconds:  AfterSplash(),
      title: Text('Welcome In Status Saver & Sticker App!',
      style:  TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image:  Image.asset('assets/saver.jpeg'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader:  TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red
    )
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        
      appBar:  AppBar(
         backgroundColor: Color(0x008037),
        centerTitle: true,
      title:  const Text("Status Saver",style: TextStyle( 
              fontSize: 25.0, color: Colors.white
            ),),
      ),
      body:  Container(
        decoration: BoxDecoration(image:DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("Save Status, Stickers easily & Enjoy!",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,color:Colors.black54,
              ),),
            ),
            SizedBox(height: 70),
            Container(
              
              child: Center(
                
                child: RaisedButton(
                  
                   padding:  EdgeInsets.only(left:40, right: 40, bottom: 15, top: 15),
                color: Colors.green,
                textColor: Colors.white,
                child: Text('Next',style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),), 
                onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => StoragePermission()));
                }
                ),
                
            )
            ),
          ],
        ),
      ),
    
    )
    );
    
  }
}
