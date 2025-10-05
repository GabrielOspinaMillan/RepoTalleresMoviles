import 'package:flutter/material.dart';
import 'package:taller1/widgets/custom_drawer.dart'; // <-- Añade este import
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _titulo = "Hola, Flutter";
  Color _colorTexto = Colors.black;
  final TextEditingController controller = TextEditingController();

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
  void dispose() {
    controller.dispose(); // Liberamos la memoria del controlador
    // el metodo super.dispose() se encarga de liberar la memoria de los recursos utilizados por el widget
    super.dispose();
  }

  /// !goToDetalle
  /// recibe el tipo de navegación (go, push, replace)
  /// y redirige a la pantalla de detalle con el valor ingresado.
  void goToDetalle(String metodo) {
    String valor = controller.text; // Capturamos el valor del campo de texto

    if (valor.isEmpty) return; // Si el campo está vacio, no hacemos nada

    switch (metodo) {
      case 'go':
        context.go('/detalleHome/$valor/$metodo');
        break;
      case 'push':
        context.push('/detalleHome/$valor/$metodo');
        break;
      case 'replace':
        context.replace('/detalleHome/$valor/$metodo');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_titulo),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40),
            const Text(
              "Gabriel Ospina Millan",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    "https://www.shutterstock.com/image-photo/curious-cat-looking-bee-outside-260nw-2187265243.jpg",
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/gato1.jpg"),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _cambiarTitulo,
              child: const Text("Cambiar Título"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _cambiarColor,
              child: Container(
                padding: const EdgeInsets.all(30.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 154, 76),
                  border: Border.all(
                    color: const Color.fromARGB(255, 53, 46, 14),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  "Este es un texto dentro de un contenedor con padding, margin y decoration.",
                  style: TextStyle(fontSize: 16, color: _colorTexto),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese un valor entre el 1 al 10',
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 110,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => goToDetalle('go'),
                    child: const Text('Go'),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 110,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => goToDetalle('push'),
                    child: const Text('Push'),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 110,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => goToDetalle('replace'),
                    child: const Text('Replace'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            
            // Contenedor para los tres botones
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Botón de Asincronía
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => context.go('/asincronia'),
                      icon: const Icon(Icons.sync, color: Colors.white),
                      label: const Text(
                        'Asincronía',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Botón de Cronómetro
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => context.go('/cronometro'),
                      icon: const Icon(Icons.timer, color: Colors.white),
                      label: const Text(
                        'Cronómetro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Botón de Isolate
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => context.go('/isolate'),
                      icon: const Icon(Icons.calculate, color: Colors.white),
                      label: const Text(
                        'Isolate Demo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}