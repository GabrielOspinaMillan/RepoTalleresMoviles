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

## 👤 Datos
- **Nombre completo:** Gabriel Ospina Millán  
- **Código:** 230221001

