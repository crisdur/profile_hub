# Profile Hub

Una aplicación Flutter que consume la API de Reqres.in para gestionar perfiles de usuarios.

## Cómo ejecutar el proyecto

1. **Prerrequisitos**
   - Flutter 3.x
   - Dart SDK

2. **Instalación**
   ```bash
   # Clonar el repositorio
   git clone https://github.com/crisdur/profile_hub
   cd profile_hub

   # Instalar dependencias
   flutter pub get

   # Ejecutar la aplicación
   flutter run
   ```

## Arquitectura

El proyecto sigue una arquitectura limpia (Clean Architecture)

### Capas de la arquitectura

1. **Data**
   - Models: Clases que representan los datos
   - Services: Manejo de llamadas a la API

2. **Presentation**
   - Providers: Gestión del estado con Riverpod
   - Screens: Interfaces de usuario
   - Widgets: Componentes reutilizables

## Decisiones técnicas

1. **Gestión de Estado**
   - Se utilizó Riverpod por su simplicidad y potencia
   - Permite testing sencillo y dependency injection

2. **Networking**
   - Dio para llamadas HTTP
   - Manejo robusto de errores y timeouts

3. **Navegación**
   - GoRouter para manejo de rutas
   - Rutas con parámetros dinámicos
   - Navegación con estado

4. **UI/UX**
   - Material Design 3
   - Color primario: #673AB7
   - Fuente: Lato (Google Fonts)
   - Animaciones personalizadas en navegación

5. **Características implementadas**
   - ✅ Listado paginado de usuarios
   - ✅ Vista detallada de usuario
   - ✅ Creación de usuarios
   - ✅ Pull-to-refresh
   - ✅ Animaciones de navegación
   - ✅ Manejo de estados de carga
   - ✅ Feedback visual para acciones del usuario

## Screenshots

### iPad Air 5th
![Screenshot 2025-04-10 at 10 41 55 PM](https://github.com/user-attachments/assets/2184be61-18d4-4674-9ba9-10a35111aac6)

### iPhone 16
![Screenshot 2025-04-10 at 10 42 07 PM](https://github.com/user-attachments/assets/3dd6c1d5-9b35-4c51-aa3a-6be2370568ef)

### iPhone SE (3rd)
![Screenshot 2025-04-10 at 10 42 01 PM](https://github.com/user-attachments/assets/d290fc1a-9806-40f4-bb7f-33d26614888c)


