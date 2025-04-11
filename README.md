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
