# Condiciones de Salud - Control de Ingreso

## 1. Descripción del Proyecto
Este proyecto es una aplicación web diseñada para el control de ingreso a una clínica o establecimiento médico. Su propósito principal es evaluar las condiciones de salud y síntomas de los pacientes, visitantes o colaboradores antes de su ingreso, mediante un formulario y un cuestionario estructurado. Dependiendo de las respuestas ingresadas, la aplicación clasifica el nivel de riesgo de contagio y se comunica con un servicio web externo (WCF) para registrar la información suministrada y permitir el acceso de forma segura.

## 2. Pila Tecnológica (Tech Stack)
A partir del análisis del código, el proyecto está construido bajo el siguiente stack tecnológico:
- **Backend / Lenguaje principal:** ASP.NET Web Forms, VB.NET
- **Framework de .NET:** .NET Framework 4.5.2
- **Integraciones de Red:** WCF (Windows Communication Foundation) mediante protocolo SOAP para el registro de los datos de ingreso (`wsCondiciones`).
- **Frontend / UI:** Interfaz web basada en Web Forms, HTML, CSS, con Bootstrap 3.4.1.
- **Scripts:** JavaScript, jQuery 3.4.1, Modernizr 2.8.3.
- **Gestor de Paquetes / Dependencias:** NuGet.

## 3. Instalación Local y Configuración del Entorno

### Requisitos previos
- Un entorno de desarrollo compatible, como **Visual Studio**, que incluya la carga de trabajo de **"Desarrollo de ASP.NET y web"**.
- Tener instalado el **.NET Framework 4.5.2**.

### Instrucciones de Instalación
1. **Clonar el repositorio:**
   Clona el código base a tu máquina local mediante Git o descargándolo directamente.
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   ```

2. **Abrir la solución:**
   Busca el archivo `Condiciones.sln` y ábrelo con Visual Studio.

3. **Restaurar dependencias NuGet:**
   Es probable que al abrir el proyecto debas restaurar los paquetes. Para hacerlo, puedes hacer clic derecho sobre la solución en el *Explorador de soluciones* y seleccionar la opción **"Restaurar paquetes NuGet"**.

4. **Configuración de variables (Web.config):**
   - Abre el archivo `Web.config` que se encuentra en la raíz del repositorio.
   - Ubica la etiqueta `<client>` en la sección `<system.serviceModel>`.
   - Actualmente, la dirección del *endpoint* del servicio de SOAP se encuentra configurada con una IP de prueba. Es **necesario** actualizar este valor por la IP y puerto reales de tu servidor de WCF:
     ```xml
     <client>
       <endpoint address="http://1.1.1.1:0000/wsCondiciones/wsCondiciones.svc"
                 binding="basicHttpBinding" bindingConfiguration="MainBnd"
                 contract="wsCondiciones.IwsCondiciones" name="MainBnd" />
     </client>
     ```

5. **Compilar el proyecto:**
   Dirígete al menú de Visual Studio: **Compilar > Compilar solución** (o su equivalente por línea de comandos usando `msbuild Condiciones.sln`).

6. **Ejecutar el proyecto:**
   Pulsa en **"Iniciar depuración"** para que Visual Studio levante la aplicación utilizando IIS Express y puedas verla localmente en tu navegador web.

## 4. Estructura Principal de Carpetas
La arquitectura se alinea al patrón clásico de una solución de ASP.NET Web Forms:
- `/App_Start/`: Contiene la lógica inicial que arranca junto a la aplicación, como la configuración de rutas y agrupación (bundles) de los archivos CSS y JS.
- `/Connected Services/`: Incluye el código proxy autogenerado para consumir el servicio WCF externo configurado en el proyecto (`wsCondiciones`).
- `/Content/`: Aloja los archivos de hojas de estilo (.css) empleados en la aplicación (por ejemplo, `Site.css` y la librería Bootstrap).
- `/Images/`: Carpeta para recursos visuales estáticos y de iconografía.
- `/My Project/`: Archivos y configuraciones específicas del entorno y del compilador de Visual Basic .NET (Assembly, Settings).
- `/Scripts/`: Contiene las librerías JavaScript necesarias para el funcionamiento del frontend (Bootstrap, jQuery).
- `/packages/`: Directorio donde el manejador NuGet descarga las dependencias.
- Directorio Raíz (`/`): Alberga los archivos y las páginas web principales del proyecto como `Default.aspx`, `Global.asax`, `Site.Master` y `Web.config`.

## 5. Guía Básica de Uso
Una vez ejecutada la aplicación con éxito, estos son los pasos principales de su flujo de trabajo:

1. El sistema arrancará y cargará la vista de inicio del formulario en `Default.aspx`.
2. Opcionalmente, puedes hacer clic en el botón superior **"Nuevo ingreso >>"** en cualquier momento para limpiar todo el formulario y empezar un nuevo registro de cero.
3. **Sección de Identificación**: Completa el tipo de documento, digita la identificación en el campo de texto e indica el tipo de ingreso del usuario.
4. **Cuestionario de Salud**: Responde seleccionando `Sí` o `No` a las tres áreas de preguntas: la presencia de síntomas respiratorios, el contacto reciente en los últimos 15 días, y los antecedentes de pruebas diagnósticas (COVID-19).
5. Haz clic en el botón inferior **"Validar ingreso >>"**.
6. El sistema computará el nivel de riesgo de acuerdo con las respuestas dadas, indicará visualmente si el usuario debe pasar el filtro o retenerse, y enviará silenciosamente los datos ingresados al servicio WCF preconfigurado.