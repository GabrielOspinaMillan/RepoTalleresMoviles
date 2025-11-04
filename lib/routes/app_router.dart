import 'package:taller1/views/home/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:taller1/views/paso_parametros/paso_parametros_screen.dart';
import 'package:taller1/views/ciclo_vida/ciclo_vida_screen.dart';
import 'package:taller1/views/paso_parametros/detalle_screen.dart';
import 'package:taller1/views/paso_parametros/detalle_screen_home.dart';
import 'package:taller1/views/home/info_tab_grid.dart';
import 'package:taller1/views/home/config.dart';
import 'package:taller1/views/home/asincronia.dart';
import 'package:taller1/views/home/cronometro.dart';
import 'package:taller1/views/home/isolate.dart';
import 'package:taller1/views/home/categorias_api.dart';
import 'package:taller1/views/home/detail_screen.dart';
import 'package:taller1/views/auth/login_screen.dart';
import 'package:taller1/views/auth/session_screen.dart';
import 'package:taller1/views/auth/register_screen.dart';
import 'package:taller1/views/universidades/universidades_screen.dart';
import 'package:taller1/views/universidades/list_universidad_screen.dart';
import 'package:taller1/views/universidades/add_universidad_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(), // Usa HomeView
    ),
    // Rutas para el paso de parámetros
    GoRoute(
      path: '/paso_parametros',
      builder: (context, state) => const PasoParametrosScreen(),
    ),

    // !Ruta para el detalle con parámetros
    GoRoute(
      path:
          '/detalle/:parametro/:metodo', //la ruta recibe dos parametros los " : " indican que son parametros
      builder: (context, state) {
        //*se capturan los parametros recibidos
        // declarando las variables parametro y metodo
        // es final porque no se van a modificar
        final parametro = state.pathParameters['parametro']!;
        final metodo = state.pathParameters['metodo']!;
        return DetalleScreen(parametro: parametro, metodoNavegacion: metodo);
      },
    ),
    GoRoute(
      path:
          '/detalleHome/:parametro/:metodo', //la ruta recibe dos parametros los " : " indican que son parametros
      builder: (context, state) {
        //*se capturan los parametros recibidos
        // declarando las variables parametro y metodo
        // es final porque no se van a modificar
        final parametro = state.pathParameters['parametro']!;
        final metodo = state.pathParameters['metodo']!;
        return DetalleScreenHome(parametro: parametro, metodoNavegacion: metodo);
      },
    ),
    //!Ruta para el ciclo de vida
    GoRoute(
      path: '/ciclo_vida',
      name: 'ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
    //!Ruta para el tabbar y gridview de información
    GoRoute(
      path: '/info_tab_grid',
      name: 'InfoTabGrid',
      builder: (context, state) => const InfoTabGrid(),
    ),
    //!Ruta para la configuración
    GoRoute(
      path: '/settings',
      builder: (context, state) => const ConfigScreen(), // Placeholder
    ),
    GoRoute(
      path: '/asincronia',
      name: 'Asincronia',
      builder: (context, state) => const AsincroniaScreen(),
    ),
    GoRoute(
      path: '/cronometro',
      name: 'Cronometro',
      builder: (context, state) => const CronometroScreen(),
    ),
    GoRoute(
      path: '/isolate',
      name: 'Isolate',
      builder: (context, state) => const IsolateScreen(),
    ),
    GoRoute(
      path: '/categorias_api',
      name: 'CategoriasAPI',
      builder: (context, state) => const CategoriesScreen(),
    ), 
    GoRoute(
      path: '/categoria_detalle',
      name: 'CategoriaDetalle',
      builder: (context, state) {
        // recuperamos los datos que enviamos con 'extra'
        final data = state.extra as Map<String, dynamic>;
        return CategoriaDetalleScreen(
          id: data['id'],
          nombre: data['nombre'],
          imagen: data['imagen'],
          descripcion: data['descripcion'],
        );
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/session',
      builder: (context, state) => const SessionScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/universidades',
      builder: (context, state) => const UniversidadesScreen(),
    ),
    GoRoute(
      path: '/universidad_create',
      builder: (context, state) => const AddUniversidadScreen(),
    ),
    GoRoute(
      path: '/universidades_list',
      builder: (context, state) => const ListUniversidadScreen(),
    ),
  ],
);