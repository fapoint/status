
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:status/home.dart';

class StoragePermission extends StatefulWidget {
  @override
  _StoragePermissionState createState() => _StoragePermissionState();
}

class _StoragePermissionState extends State<StoragePermission> {
  Future<int> storagePermissionChecker;

  Future<int> checkStoragePermission() async {
    var result = await Permission.storage.status;

    setState(() {});
    if (result.toString() == "PermissionStatus.granted") {
      return 1;
    }
    storagePermissionChecker = requestStoragePermission();
    setState(() {});

    return 0;
  }

  Future<int> requestStoragePermission() async {
    Map<Permission, PermissionStatus> result = await [
      Permission.storage,
    ].request();
    return result[Permission.storage].toString() == "PermissionStatus.granted"
        ? 1
        : 0;
  }

  @override
  Future<int> initState() {
    super.initState();
    storagePermissionChecker = (() async {
      return await checkStoragePermission();
    })();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: storagePermissionChecker,
        builder: (context, status) {
          if (status.connectionState == ConnectionState.done) {
            if (status.hasData) {
              if (status.data == 1) {
                return Home();
              } else {
                return Scaffold(
                  body: Center(
                    child: RaisedButton(
                      color: Colors.teal,
                      child: Text(
                        "Allow storage Permission",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        storagePermissionChecker = requestStoragePermission();
                        setState(() {});
                      },
                    ),
                  ),
                );
              }
            } else {
              return Scaffold(
                  body: Center(
                child: Text(
                    'Something went wrong.. Please uninstall and Install Again'),
              ));
            }
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
