import 'package:flutter/material.dart';
class Setting extends StatefulWidget {
  const Setting ({ Key key }) : super(key: key);
  @override
  _SettingState createState() => _SettingState();
}
class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.green,
          title: Text('Setting',
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
                     child: Center(
                       child: Column(
                         mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                        
                                Container(padding: EdgeInsets.all(20),
                                  child: Text('Dark Mode',
                                  style: TextStyle(color: Colors.black87,
                             fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                 Container(padding: EdgeInsets.all(100),
                                  child: Text('Remove Ads',
                                  style: TextStyle(color: Colors.black87,
                             fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                 ),
                        ],
                    ),
                     ),
                 
                  ),
                
              )
    );
  }
}                    