import 'package:flutter/material.dart';


class Page2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text( 'Page 2' ),
      ),

      body: Center(
        child: Text('Page2 Page'),
     ),

     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushReplacementNamed(context, 'page1'),
    ),
   );
  }
}