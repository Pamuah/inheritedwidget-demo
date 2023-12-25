import 'package:flutter/material.dart';


ThemeData themeData() {
  
  return ThemeData(
   scaffoldBackgroundColor: const Color(0xFFE5E5E5),
   colorScheme: ThemeData().colorScheme.copyWith(
      primary: const Color.fromARGB(255, 172, 222, 174),
     onPrimary:  Colors.black,
      background: Colors.grey,
     onBackground:  Colors.white,
      
    ),
  
  );
  
}