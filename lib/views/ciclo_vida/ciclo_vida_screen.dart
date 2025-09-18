import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taller1/widgets/base_view.dart';

/// !CicloVidaScreen
/// nos permite entender cómo funciona el ciclo de vida
/// de un StatefulWidget en Flutter.

class CicloVidaScreen extends StatefulWidget {
  const CicloVidaScreen({super.key});

  @override
  State<CicloVidaScreen> createState() => CicloVidaScreenState();
}

class CicloVidaScreenState extends State<CicloVidaScreen> {
  String texto = "texto inicial 🟢";

  /// initState()
  /// CUÁNDO: Se llama **una sola vez** cuando el widget se inserta en el árbol de widgets.
  /// POR QUÉ: Ideal para inicializar variables, controladores o cargar datos iniciales.
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print("🟢 initState() -> La pantalla se ha inicializado");
    }
  }

  /// didChangeDependencies()
  /// CUÁNDO: Se llama después de initState() y cada vez que cambian las dependencias del widget.
  /// POR QUÉ: Útil para obtener datos de InheritedWidget o dependencias del contexto.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (kDebugMode) {
      print("🟡 didChangeDependencies() -> Tema actual");
    }
  }

  /// build()
  /// CUÁNDO: Se llama cada vez que Flutter necesita dibujar el widget (al inicio y tras cada setState).
  /// POR QUÉ: Aquí se construye la interfaz de usuario.
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("🔵 build() -> Construyendo la pantalla");
    }

    return BaseView(
      title: "Ciclo de Vida de en flutter",
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(texto, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: actualizarTexto,
              child: const Text("Actualizar"),
            ),
          ],
        ),
      ),
    );
  }

  //actualiza el texto y lo muestra en la pantalla
  /// setState()
  /// CUÁNDO: Se llama cuando necesitas actualizar el estado del widget y reflejar cambios en la interfaz.
  /// POR QUÉ: Notifica a Flutter que el estado interno cambió y debe reconstruir el widget llamando a build().
  void actualizarTexto() {
    setState(() {
      texto = "Texto actualizado 🟠";
      // setState() indica a Flutter que debe reconstruir el widget con el nuevo estado.
    });
  }

  /// dispose()
  /// CUÁNDO: Se llama **una sola vez** cuando el widget se elimina del árbol de widgets.
  /// POR QUÉ: Aquí se liberan recursos, como controladores o listeners.
  @override
  void dispose() {
    if (kDebugMode) {
      print("🔴 dispose() -> La pantalla se ha destruido");
    }
    super.dispose();
  }
}