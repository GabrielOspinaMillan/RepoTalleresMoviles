import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:taller1/routes/app_router.dart';
import 'themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  try {
    // Inicializar Firebase antes de usar cualquier servicio (Firestore, Auth, etc.)
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // En DEBUG imprime traza para depuración
    // Si ocurre un error aquí, no se podrá usar Firebase en el resto de la app
    // (ejecuta flutter run -v para más detalle)
      print('❌ Error inicializando Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme:
          AppTheme.lightTheme, //thema personalizado y permamente en toda la app
      title:
          'Flutter - UCEVA', // Usa el tema personalizado, no se muestra el tema por defecto. esto se visualiza en toda la app
      routerConfig: appRouter, // Usa el router configurado
    );
  }
}
