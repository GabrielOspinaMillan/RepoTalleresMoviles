import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddUniversidadScreen extends StatefulWidget {
  const AddUniversidadScreen({super.key});

  @override
  State<AddUniversidadScreen> createState() => _AddUniversidadScreenState();
}

class _AddUniversidadScreenState extends State<AddUniversidadScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nitCtrl = TextEditingController();
  final _nombreCtrl = TextEditingController();
  final _direccionCtrl = TextEditingController();
  final _telefonoCtrl = TextEditingController();
  final _paginaCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _nitCtrl.dispose();
    _nombreCtrl.dispose();
    _direccionCtrl.dispose();
    _telefonoCtrl.dispose();
    _paginaCtrl.dispose();
    super.dispose();
  }

  String? _notEmpty(String? v) => (v == null || v.trim().isEmpty) ? 'Campo requerido' : null;

  String? _validateUrl(String? v) {
    if (v == null || v.trim().isEmpty) return 'Campo requerido';
    final uri = Uri.tryParse(v.trim());
    if (uri == null || !(uri.isAbsolute && (uri.scheme == 'http' || uri.scheme == 'https'))) {
      return 'URL inválida (http/https)';
    }
    return null;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final nit = _nitCtrl.text.trim();
    final data = {
      'nit': nit,
      'nombre': _nombreCtrl.text.trim(),
      'direccion': _direccionCtrl.text.trim(),
      'telefono': _telefonoCtrl.text.trim(),
      'paginaweb': _paginaCtrl.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    };

    try {
      // Usa el NIT como id para evitar duplicados; si prefieres que Firestore genere id usa .add(data)
      await FirebaseFirestore.instance.collection('universidades').doc(nit).set(data);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Universidad creada')));
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al crear: $e')));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear universidad'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/universidades'), // Botón para regresar
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: _nitCtrl, decoration: const InputDecoration(labelText: 'NIT'), validator: _notEmpty),
              const SizedBox(height: 12),
              TextFormField(controller: _nombreCtrl, decoration: const InputDecoration(labelText: 'Nombre'), validator: _notEmpty),
              const SizedBox(height: 12),
              TextFormField(controller: _direccionCtrl, decoration: const InputDecoration(labelText: 'Dirección'), validator: _notEmpty),
              const SizedBox(height: 12),
              TextFormField(controller: _telefonoCtrl, decoration: const InputDecoration(labelText: 'Teléfono'), validator: _notEmpty, keyboardType: TextInputType.phone),
              const SizedBox(height: 12),
              TextFormField(controller: _paginaCtrl, decoration: const InputDecoration(labelText: 'Página web'), validator: _validateUrl, keyboardType: TextInputType.url),
              const SizedBox(height: 20),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _loading ? null : _save,
                  child: _loading
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}