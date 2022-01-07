import 'package:flutter/material.dart';
import 'package:status/stickers.dart';
import 'package:status/wabusiness_option.dart';
import 'package:status/whatsapp_option.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(image:DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover)),
          child: ListView(
            children: const <Widget>[
              SizedBox(
                height: 65,
                child: DrawerHeader(
                  child: Text('           Status Saver',
                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),),
                decoration: BoxDecoration(
                  color: Colors.green,
                
                ),                
                ),
              ),
              
              ListTile(
                 leading: Icon(Icons.home),
                 title: Text('Home'),
              ),
               ListTile(
                 leading: Icon(Icons.share),
                 title: Text('Share'),
              ),
             ListTile(
                 leading: Icon(Icons.star_border_purple500_rounded),
               
                 
                 title: Text('Rate Us'),
              ),
               ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favorite'),
              ),
              ListTile(
                 leading: Icon(Icons.feedback),
                 title: Text('Feedback'),
              ),
              ListTile(
                 leading: Icon(Icons.apps),
                 title: Text('More Apps'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('About Us'),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Exit'),
              )
            ]
          ),
        )
        ),
        appBar: AppBar(
           backgroundColor: Colors.green,
          title: Text('Status Saver',
          style: const TextStyle( 
              fontSize: 25.0
            ),
            ),
            centerTitle: true,
            ),
            body: Container(
             decoration: const BoxDecoration(image:DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover)),
             child: Column(
              
                mainAxisAlignment:MainAxisAlignment.center,
               children: [
                 Center(
                   child: Container(
                     child: RaisedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WAOption()));
                     },
                     color: Colors.green,
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                          child: Text('Whatsapp',style: TextStyle(color: Colors.white,
                           fontSize: 18, fontWeight: FontWeight.bold),),
                   ),         
            ),
            
                 ),
                 SizedBox(height: 10,),
                 Container(
                
                   child: RaisedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WABusinessOption()));
                                       },
                   color: Colors.green,
                       padding: EdgeInsets.only(top: 15, bottom: 15, left: 12, right: 12),
                          child: Text('WA Business',style: TextStyle(color: Colors.white,
                           fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                   ),
                 ),
                 SizedBox(height: 10,),
                Container(
                     child: RaisedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Stickers()));
                     },
                     color: Colors.green,
                     padding: EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                          child: Text('Stickers',style: TextStyle(color: Colors.white,
                           fontSize: 18, fontWeight: FontWeight.bold
                          ),
                   ),
                   ),         
            ),   
               ],
             ),
            ),
    ),
    );
  }
}