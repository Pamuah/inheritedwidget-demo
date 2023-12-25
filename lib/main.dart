
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:inherited_widget/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
   [ DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  ).then((_){
       runApp(
        DevicePreview(
          enabled:false,
          builder:(context)=>  MyApp(),
          
        )
       );
  });
 ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute: "/", home: ApiProvider(api: Api(),
     child: Homepage()),
     
    
    );
  }
}

