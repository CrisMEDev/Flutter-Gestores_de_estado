import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/route_manager.dart';

import 'package:gestores_de_estado/pages/page1.dart';
import 'package:gestores_de_estado/pages/page2.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return GetMaterialApp(
      title: 'Gestores de estado',
      debugShowCheckedModeBanner: false,
      
      initialRoute: 'page1',

      // routes: {
      //   'page1':          ( BuildContext context ) => Page1Page(),
      //   'page2':          ( BuildContext context ) => Page2Page()
      // },

      getPages: [
        GetPage(name: 'page1', page: () => Page1Page()),
        GetPage(name: 'page2', page: () => Page2Page())
      ],

    );
  }
}