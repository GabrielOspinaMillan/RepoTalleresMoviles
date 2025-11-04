class Universidades {
  final String nit;
  final String nombre;
  final String direccion;
  final String telefono;
  final String paginaweb;

  Universidades({
    required this.nit,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.paginaweb,
  });

  factory Universidades.fromJson(Map<String, dynamic> json) {
    return Universidades(
      nit: json['nit'] as String,
      nombre: json['nombre'] as String,
      direccion: json['direccion'] as String,
      telefono: json['telefono'] as String,
      paginaweb: json['paginaweb'] as String,
    );
  }
}