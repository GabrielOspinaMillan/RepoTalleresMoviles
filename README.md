# Taller 1 - Flutter

## 📌 Descripción
Este proyecto corresponde al **Taller 1** de la asignatura de Desarrollo de Aplicaciones Móviles.  
El objetivo es familiarizarse con la estructura básica de un proyecto Flutter y realizar una primera interfaz que incluya:
- título inicial “Hola, Flutter” (usando variable de estado).
- Texto con nombre completo.
- Imágenes desde red y assets.
- Botón que cambia el título con `setState()` y muestra un `SnackBar`.
- Contenedor estilizado (padding, margen, bordes, colores).
- Lista con elementos (`ListView`).
- Funcionamiento de los 2 widgets adicionales.

---

## ▶️ Pasos para ejecutar el proyecto

1. **Clonar el repositorio**  
   Abre una terminal y ejecuta:
   ```bash
   [git clone https://github.com/GabrielOspinaMillan/RepoTalleresMoviles.git
   ```

2. **Verificar instalación de Flutter**  
   Asegúrate de tener Flutter correctamente instalado ejecutando:
   ```bash
   flutter --version
   ```

3. **Instalar dependencias**  
   Dentro de la carpeta del proyecto, descarga todas las librerías necesarias con:
   ```bash
   flutter pub get
   ```

4. **Conectar un dispositivo o emulador**  
   - Si usas Android Studio/VS Code, abre un emulador.  
   - También puedes conectar un celular físico por USB (con la depuración habilitada).  
   Verifica que el dispositivo está detectado con:
   ```bash
   flutter devices
   ```

5. **Ejecutar la aplicación**  
   Corre el proyecto con:
   ```bash
   flutter run
   ```

6. **(Opcional) Ejecutar en modo web**  
   Si deseas correrlo en navegador:
   ```bash
   flutter run -d chrome
   ```

---

## 📸 Capturas de pantalla
Estado inicial de la app.

<img width="415" height="858" alt="image" src="https://github.com/user-attachments/assets/9b3663df-0f8b-42c9-8591-2b0e603dfca3" />

Estado tras presionar el botón (título cambiado + SnackBar).

<img width="397" height="851" alt="image" src="https://github.com/user-attachments/assets/7e0d10aa-0028-4fbe-805f-106d082eca9b" />

Funcionamiento de los 2 widgets adicionales.

EL TEXTO DEL CONTAINER CAMBIA DE COLOR AL SER PRESIONADO

<img width="372" height="828" alt="image" src="https://github.com/user-attachments/assets/e04266e4-3feb-457b-afb9-a524727f53dc" />

Se muestra un mensaje cuando se selecciona una opción

<img width="375" height="822" alt="image" src="https://github.com/user-attachments/assets/0a79128a-1384-4074-b023-32180e76a1dc" />

# Taller 2 - Paso de parametros

## 📸 Capturas de pantalla
Estado inicial de la app.

<img width="380" height="829" alt="image" src="https://github.com/user-attachments/assets/154323e9-2419-4afe-a4c5-46aff4599fba" />

# 📌 Rutas de la aplicación (GoRouter)

| Ruta | Widget | Descripción |
|------|---------|-------------|
| `/` | `HomeScreen` | Pantalla de inicio de la app. |
| `/paso_parametros` | `PasoParametrosScreen` | Pantalla donde el usuario puede ingresar un valor y probar la navegación con **go**, **push** y **replace**. |
| `/detalle/:parametro/:metodo` | `DetalleScreen` | Recibe dos parámetros en la URL:<br>- `parametro`: valor ingresado por el usuario.<br>- `metodo`: método de navegación usado (**go**, **push** o **replace**).<br><br>Se navega a esta ruta desde **PasoParametrosScreen**. |
| `/detalleHome/:parametro/:metodo` | `DetalleScreenHome` | Similar a la ruta anterior, pero pensada para navegar desde **HomeScreen**.<br>También recibe los parámetros `parametro` y `metodo`. |
| `/ciclo_vida` | `CicloVidaScreen` | Muestra y explica el ciclo de vida de un **StatefulWidget**. |
| `/info_tab_grid` | `InfoTabGrid` | Pantalla con pestañas y grids de información. |
| `/settings` | `ConfigScreen` | Pantalla de configuración de la app. |

---

## 📌 Envío de parámetros en rutas

Los parámetros se envían en la **URL** usando los dos puntos `:`.

**Ejemplo:**
```
/detalle/5/push
```
- `5` → parámetro ingresado.  
- `push` → método de navegación usado.  

En el **builder de la ruta**, se recuperan así:  

```dart
final parametro = state.pathParameters['parametro'];
final metodo = state.pathParameters['metodo'];
```

---

# 📌 Widgets usados en la aplicación

## 🗂️ GridView
**Por qué se usó:**  
Para mostrar información en forma de cuadrícula, permitiendo visualizar varios elementos organizados en filas y columnas.  

**En la app:**  
Cada pestaña del **TabBar** muestra un **GridView** con diferentes colores y etiquetas, facilitando la comparación visual y el acceso rápido a varios elementos.  

---

## 📑 TabBar
**Por qué se usó:**  
Para organizar la información en diferentes secciones o categorías, permitiendo al usuario cambiar entre ellas fácilmente.  

**En la app:**  
El **TabBar** permite alternar entre tres grids diferentes, cada uno con su propio contenido, haciendo la interfaz más dinámica y ordenada.  

---

<img width="379" height="831" alt="image" src="https://github.com/user-attachments/assets/9ea550cd-e867-41c7-b750-1c3db35c6dbf" />


## 🎚️ Slider
**Por qué se usó:**  
Para permitir al usuario seleccionar un valor numérico de forma intuitiva y visual, en este caso, el tamaño de la letra.  

**En la app:**  
El **Slider** en la pantalla de configuración permite ajustar el tamaño de la letra, mostrando el valor seleccionado y facilitando la personalización de la experiencia.  

---

<img width="379" height="840" alt="image" src="https://github.com/user-attachments/assets/6da3b42d-d072-4fa3-a3dc-f35d9ec8a298" />


## 📂 Drawer
**Por qué se usó:**  
Para ofrecer un menú lateral de navegación, permitiendo al usuario acceder fácilmente a diferentes secciones de la aplicación.  

**En la app:**  
El **Drawer** contiene accesos rápidos a las principales pantallas como **Home**, **Configuración** y otras rutas, mejorando la usabilidad y la organización de la interfaz.

<img width="386" height="830" alt="image" src="https://github.com/user-attachments/assets/e6ef6944-6f29-4461-8274-0fd23d74cd32" />

   # Taller 3 - Segundo Plano

## 📸 Capturas de pantalla
Estado inicial de la app.

<img width="372" height="820" alt="image" src="https://github.com/user-attachments/assets/bccf9368-9976-4071-9610-838e2502ee8c" />

Este proyecto es una aplicación Flutter que demuestra el uso de diferentes conceptos de programación asíncrona y manejo de tareas pesadas. Incluye ejemplos de `Future`, `async/await`, `Timer` e `Isolate`.

## Cuándo usar:

### 1. **Future**
- **Uso:** Cuando necesitas realizar una operación que puede completarse en el futuro, como una consulta a una API o una operación de lectura/escritura de archivos.
- **Ejemplo:** Consultar datos de un servicio web.

### 2. **async/await**
- **Uso:** Para manejar operaciones asíncronas de manera más legible y evitar el uso de callbacks. `async` se utiliza para marcar una función como asíncrona, y `await` se usa para esperar el resultado de un `Future`.
- **Ejemplo:** Esperar el resultado de una consulta a una API antes de continuar con la ejecución del código.

### 3. **Timer**
- **Uso:** Para ejecutar una función después de un período de tiempo específico o para ejecutar una función repetidamente en intervalos regulares.
- **Ejemplo:** Usar un `Timer` para actualizar un cronómetro cada segundo.

### 4. **Isolate**
- **Uso:** Para ejecutar tareas pesadas que pueden bloquear la interfaz de usuario. Los `Isolates` permiten ejecutar código en un hilo separado, evitando que la UI se congele.
- **Ejemplo:** Realizar cálculos intensivos, como sumar grandes números o procesar datos.

## Diagrama de Pantallas y Flujos

### Pantallas
1. **HomeScreen**
   - Botones para navegar a:
     - Asincronía
     - Cronómetro
     - Isolate Demo

2. **Asincronía**
   - Muestra el estado de carga y el resultado de una operación asíncrona.

3. **Cronómetro**
   - Permite iniciar, pausar, reanudar y reiniciar un cronómetro.

4. **Isolate Demo**
   - Ejecuta una tarea pesada en un Isolate y muestra el resultado.

### Flujos
- **Flujo de Asincronía:**
  1. El usuario presiona el botón "Ir a Asincronía".
  2. Se muestra un indicador de carga mientras se realiza la operación.
  3. Se muestra el resultado o un error.
 
     <img width="260" height="583" alt="image" src="https://github.com/user-attachments/assets/12090fbf-3fc4-46a6-898e-c83d9879e08d" />


- **Flujo de Cronómetro:**
  1. El usuario presiona el botón "Ir al Cronómetro".
  2. Se muestra el tiempo en formato HH:MM:SS.
  3. El usuario puede iniciar, pausar, reanudar o reiniciar el cronómetro.
 
     <img width="221" height="485" alt="image" src="https://github.com/user-attachments/assets/38b49fdb-f08e-4731-bf0b-fd276fef11c2" />


- **Flujo de Isolate:**
  1. El usuario presiona el botón "Ir a Isolate Demo".
  2. Se inicia una tarea pesada en un Isolate.
  3. Se muestra un indicador de carga y, al finalizar, el resultado.
 
     <img width="232" height="515" alt="image" src="https://github.com/user-attachments/assets/58ae1cd0-ef29-4ca0-8b94-7993dbb12f07" />

 # Taller 4 - Consumo de API

## 📸 Capturas de pantalla
Estado inicial de la app.

<img width="365" height="818" alt="image" src="https://github.com/user-attachments/assets/d41c235e-1314-4b95-b9ce-d66a2731d2c8" />

# 🍽️ Consumo de API - Categorías de Comidas (TheMealDB)

Proyecto Flutter que consume la API pública de [TheMealDB](https://www.themealdb.com/api.php) para listar categorías de comidas, mostrar detalles al usuario y gestionar estados de carga, error y éxito.  
Implementa **go_router** para navegación, separación por capas y buenas prácticas en el manejo de peticiones HTTP.

---

## 🚀 Descripción general

La aplicación permite:
- Obtener categorías de comidas desde una API REST.
- Mostrar nombre, imagen y descripción resumida de cada categoría.
- Navegar a una pantalla de detalle con información ampliada.
- Visualizar estados de **cargando**, **éxito** o **error**.
- Mantener una arquitectura modular (models, services, views).

---

## 🌐 API utilizada

 https://www.themealdb.com/api/json/v1/1/categories.php

Ejemplo de respuesta JSON:

**Método:** `GET`

**Ejemplo de respuesta JSON:**
```json
{
  "categories": [
    {
      "idCategory": "1",
      "strCategory": "Beef",
      "strCategoryThumb": "https://www.themealdb.com/images/category/beef.png",
      "strCategoryDescription": "Beef is the culinary name for meat from cattle..."
    },
    {
      "idCategory": "2",
      "strCategory": "Chicken",
      "strCategoryThumb": "https://www.themealdb.com/images/category/chicken.png",
      "strCategoryDescription": "Chicken is a type of poultry..."
    }
  ]
}
```
### El proyecto está organizado de la siguiente manera:

models/
Contiene los modelos de datos. En este caso, el archivo themeal.dart define la estructura de una categoría y el método fromJson para mapear los datos obtenidos de la API.

services/
Contiene la capa de servicios. El archivo api_services.dart se encarga de realizar las peticiones HTTP a la API y manejar los errores o respuestas exitosas.

views/
Incluye las pantallas principales de la aplicación.

categorias_api.dart: muestra el listado de categorías con FutureBuilder y manejo de estados (cargando, éxito, error).

detail_screen.dart: muestra los detalles de una categoría seleccionada, incluyendo la imagen y descripción.

### Rutas definidas con `go_router`

| Ruta                        | Widget                   | Parámetros                         | Descripción                                |
|------------------------------|-------------------------|-----------------------------------|--------------------------------------------|
| `/`                          | `HomeScreen`             | -                                 | Pantalla principal                          |
| `/categorias_api`             | `CategoriesScreen`       | -                                 | Listado de categorías                       |
| `/categoria_detalle`          | `CategoriaDetalleScreen` | `id, nombre, imagen, desc`        | Detalle de categoría (por extra)           |
| `/asincronia`                 | `AsincroniaScreen`       | -                                 | Ejemplo Future / async / await             |
| `/cronometro`                 | `CronometroScreen`       | -                                 | Cronómetro con Timer                        |
| `/isolate`                    | `IsolateScreen`          | -                                 | Ejemplo de Isolate                          |
| `/settings`                   | `ConfigScreen`           | -                                 | Configuración                               |
| `/info_tab_grid`              | `InfoTabGrid`            | -                                 | TabBar y GridView                            |
| `/ciclo_vida`                 | `CicloVidaScreen`        | -                                 | Ciclo de vida de StatefulWidget             |
| `/paso_parametros`            | `PasoParametrosScreen`   | -                                 | Paso de parámetros                           |
| `/detalle/:parametro/:metodo`| `DetalleScreen`          | `parametro, metodo`               | Detalle con parámetros por URL              |
| `/detalleHome/:parametro/:metodo` | `DetalleScreenHome`   | `parametro, metodo`               | Detalle desde Home                           |

**Notas sobre parámetros:**

- En rutas como `/detalle/:parametro/:metodo` se envían parámetros por URL.  
- En `/categoria_detalle` se envían datos usando `extra` (mapa con `id`, `nombre`, `imagen` y `descripción`).

  <img width="377" height="828" alt="image" src="https://github.com/user-attachments/assets/7bf94b5c-53d0-4fc6-ab59-cc1a6ce08ef3" />

  <img width="370" height="825" alt="image" src="https://github.com/user-attachments/assets/c1e699ad-0e81-4e9e-8573-72ae629e6a88" />


<img width="1122" height="207" alt="image" src="https://github.com/user-attachments/assets/b08f5318-098f-4e8e-a6fc-b495ba2b8868" />




## 👤 Datos
- **Nombre completo:** Gabriel Ospina Millán  
- **Código:** 230221001

