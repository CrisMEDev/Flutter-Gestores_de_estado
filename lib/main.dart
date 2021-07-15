import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:gestores_de_estado/services/usuario_service.dart';

import 'package:provider/provider.dart';

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

    // Todos los widgets de aqui para abajó en el árbol de widgets tendrán acceso a
    // UsuarioService
    return MultiProvider(

      providers: [
        ChangeNotifierProvider<UsuarioService>( create: ( _ ) => UsuarioService() )
      ],

      child: MaterialApp(
        title: 'Gestores de estado',
        debugShowCheckedModeBanner: false,
        
        initialRoute: 'page1',
    
        routes: {
          'page1':          ( BuildContext context ) => Page1Page(),
          'page2':          ( BuildContext context ) => Page2Page()
        },
    
      ),
    );
  }
}