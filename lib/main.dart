import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Taller 1 - Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _titulo = "Hola, Flutter";
  Color _colorTexto = Colors.black; 

  void _cambiarTitulo() {
    setState(() {
      if (_titulo == "Hola, Flutter") {
        _titulo = "¡Título cambiado!";
      } else {
        _titulo = "Hola, Flutter";
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Título actualizado')),
    );
  }

  void _cambiarColor() {
    setState(() {
      _colorTexto = _colorTexto == Colors.black ? Colors.red : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_titulo),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Gabriel Ospina Millan",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 40), // Espacio entre el texto y las imágenes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100, width: 100, child: Image.network("https://www.shutterstock.com/image-photo/curious-cat-looking-bee-outside-260nw-2187265243.jpg"),), // Imagen desde URL
              SizedBox(height: 100, width: 100, child: Image.asset("assets/gato1.jpg"),), // Imagen desde assets
            ],
          ),
          const SizedBox(height: 40), // Espacio entre las imágenes y el botón
          ElevatedButton(onPressed: _cambiarTitulo, child: const Text("Cambiar Título")),
          const SizedBox(height: 20), // Espacio entre el botón y el texto final
          GestureDetector(
            onTap: _cambiarColor,
            child: Container( // Contenedor con padding, margin y decoration
              padding: const EdgeInsets.all(30.0),
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 154, 76),
                border: Border.all(color: const Color.fromARGB(255, 53, 46, 14), width: 2,),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.9),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                "Este es un texto dentro de un contenedor con padding, margin y decoration.",
                style: TextStyle(fontSize: 16, color: _colorTexto), // Cambia el color del texto
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20), // Espacio entre el contenedor y el texto final
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Navegando a Inicio')),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configuración'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Navegando a Configuración')),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Perfil'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Navegando a Perfil')),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
