README - Mobile AQUANOVA
Descripción del Proyecto
Mobile AQUANOVA es una aplicación móvil basada en la aplicación de escritorio AQUANOVA. Este sistema permite el monitoreo y visualización de datos de diferentes sensores en un entorno acuático.

Estado del Desarrollo
Actualmente, la aplicación se encuentra en fase de desarrollo con datos simulados. La conexión con la API aún no ha sido implementada.
Requisitos Previos

Para desarrollar y ejecutar este proyecto, necesitarás:
Android Studio
Flutter SDK
Dart SDK

Configuración del Entorno de Desarrollo

Instala Android Studio desde developer.android.com
Instala Flutter siguiendo las instrucciones en flutter.dev
Verifica que Dart se haya instalado correctamente con Flutter
Configura un dispositivo virtual en Android Studio o conecta un dispositivo físico

Asegurate que flutter y dart esten en tus variables de entorno


Problemas de dependencias:
flutter pub get
flutter clean
flutter pub get

Si no agarra los cambios apaga el debugging y vuelve a iniciarlo

Ejecución del Proyecto
Con emulador: Configura los dispositivos en Android Studio, selecciona el emulador deseado y presiona el botón "Debug"
Con dispositivo físico: Conecta tu celular por USB o configura la depuración inalámbrica vía WiFi
Verifica la consola de depuración para identificar posibles errores

Para conectar un dispositivo android por medio de wifi los pasos estan en el siguiente chat con claude.ai:
https://claude.ai/share/bf66d0bc-c212-47cd-a6c2-8542b558b1b3

Estructura del Proyecto
Directorio Principal

lib/ - Directorio principal del código fuente

main.dart - Punto de entrada de la aplicación

Assets

assets/
    icons/ - Iconos organizados por tipo de sensor en sus respectivas carpetas
    resources/ - Logos y archivo de colores (variables para mantener consistencia)



Componentes Principales

componentes/ - Widgets reutilizables que aparecen en los módulos
    current_value_component.dart - Cards para valores de sensores
    graph_component.dar - Componentes de gráficas
    limits_component.dart - Cards de límites
    table_component - Tablas de historial



Sistema de Autenticación

login/ - Lógica y UI para la autenticación
    login_card.dart - Card de login
    login_get.dart - Lógica de autenticación



Módulos de Sensores

Modules/
    modules.dart - Declaración de rutas
    detail_screen.dart - Devuelve el módulo de la opción seleccionada
    base_module.dart - Estructura base donde se integran los componentes
    [sensor_name]/
        [sensor_name]_module.dart - Crea el módulo específico del sensor
        [sensor_name]_data.dart - Datos utilizados por el sensor


Sistema de Opciones

option/
    option_card.dart - Card general para sensores
    options.dart - Constructor de datos para sensores
    option_factory.dart - Sistema de rutas


Tecnologías Utilizadas
Flutter
Dart
Se usa una libreria para la gráfica


Falta:
Implementar la conexión con la API
Mejorar la interfaz de usuario
Pruebas en diferentes dispositivos

Notas para Desarrolladores
Consulta la consola de depuración para identificar posibles errores
Al añadir nuevos sensores, sigue la estructura establecida en los módulos existentes
Mantén la consistencia de colores utilizando las variables definidas en el archivo de recursos