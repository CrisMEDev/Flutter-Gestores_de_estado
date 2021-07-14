import 'package:flutter/material.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text( 'Page 1' ),
      ),

      body: Center(
        child: Text('Page1 Page'),
     ),

     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushReplacementNamed(context, 'page2')
    ),
   );
  }
}