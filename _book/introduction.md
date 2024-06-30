# Introducción a la aplicación
<style>
  .figure {
    text-align: center;
  }
  .figure .caption {
    text-align: center;
  }
</style>

## Explicación de la aplicación 


<div class="justificar-texto">
La aplicación se ha realizado con Shiny, específicamente con la flexibilidad que proporciona la librería “shinydashboard” ya que esta permite generar diversas pestañas las cuales cada una de ellas son una aplicación independiente. La aplicación se encuentra disponible en el siguiente enlace:


https://testestestest.shinyapps.io/TFGUOC/

Cuando se hace clic en el enlace aparece la imagen siguiente \@ref(fig:CURSO-1):
</div>

<div class="figure" style="text-align: center">
<img src="FIG2.jpg" alt="Aplicación de Shiny para interactuar con ChatGPT." width="100%" />
<p class="caption">(\#fig:CURSO-1)Aplicación de Shiny para interactuar con ChatGPT.</p>
</div>
<div class="justificar-texto">
Las 5 aplicaciones creadas se pueden ver en la parte superior izquierda tal y como se muestra en la \@ref(fig:CURSO-2).
</div>


<div class="figure" style="text-align: center">
<img src="FIG3.jpg" alt="Cinco aplicaciones independientes creadas." width="100%" />
<p class="caption">(\#fig:CURSO-2)Cinco aplicaciones independientes creadas.</p>
</div>

<div class="justificar-texto">
Tal y como se puede ver en la  \@ref(fig:CURSO-2), las aplicaciones son las siguientes:

1.	Usuario
2.	Usuario/(Sistema o Asistente)
3.	Crea una imagen
4.	Transcribe un audio
5.	Traduce un audio al inglés
</div>

## Aplicación Usuario

<div class="justificar-texto">
Tal y como muestra la \@ref(fig:CURSO-3), esta aplicación permite interactuar con ChatGPT de la que explicaré. 
</div>

<div class="figure" style="text-align: center">
<img src="FIG4.jpg" alt="Primera aplicación llamada Usuario." width="100%" />
<p class="caption">(\#fig:CURSO-3)Primera aplicación llamada Usuario.</p>
</div>

<div class="justificar-texto">
Primero hace falta introducir la API key (\@ref(fig:CURSO-4)) con lo que se debe tener esta llave generada. En el siguiente enlace:

https://platform.openai.com/account/api-keys

se puede acceder a generarla, guardarla y una vez se ha utilizado en una sesión es recomendable generar una nueva y borrar la anterior (\@ref(fig:CURSO-5)).
</div>

<div class="figure" style="text-align: center">
<img src="FIG5.jpg" alt="Introducción de a la API Key en la aplicación." width="60%" />
<p class="caption">(\#fig:CURSO-4)Introducción de a la API Key en la aplicación.</p>
</div>



<div class="figure" style="text-align: center">
<img src="FIG6.jpg" alt="Generación de la API Key en la web oficial de OpenAI. " width="100%" />
<p class="caption">(\#fig:CURSO-5)Generación de la API Key en la web oficial de OpenAI. </p>
</div>

<div class="justificar-texto">
El siguiente paso es escoger el tipo de modelo entrenado por OpenAI y tenemos 3 posibilidades en este caso, el más reciente,  gpt-4o, seguido de gpt-4-turbo y gpt-3.5-turbo tal y como se puede ver en la \@ref(fig:CURSO-6).
</div>

<div class="figure" style="text-align: center">
<img src="FIG7.jpg" alt="Modelos disponibles  de OpenAI en la aplicación." width="60%" />
<p class="caption">(\#fig:CURSO-6)Modelos disponibles  de OpenAI en la aplicación.</p>
</div>

<div class="justificar-texto">
En la \@ref(fig:CURSO-7) se muestran los valores disponibles para la variable Temperatura, siendo 0 un valor faltado de aleatoriedad y más predecible y siendo 1 o más valores que generan texto con mayor variedad y creatividad. Dependiendo de lo que se necesite se va escoger el valor que se crea oportuno.
</div>

<div class="figure" style="text-align: center">
<img src="FIG8.jpg" alt="Valores de la temperatura disponible para el modelo." width="60%" />
<p class="caption">(\#fig:CURSO-7)Valores de la temperatura disponible para el modelo.</p>
</div>

<div class="justificar-texto">
En la \@ref(fig:CURSO-8) se muestra donde se puedes escoger la longitud del texto generado variando desde 1 token a 1000 tokens. 
</div>

<div class="figure" style="text-align: center">
<img src="FIG9.jpg" alt="Número de tokens escogido como longitud de la respuesta de 1 a 1000." width="60%" />
<p class="caption">(\#fig:CURSO-8)Número de tokens escogido como longitud de la respuesta de 1 a 1000.</p>
</div>

<div class="justificar-texto">
En la \@ref(fig:CURSO-9) se encuentra la parte en la que se encuentra el chat con la posibilidad de introducir el texto pregunta, con el botón enviar y el botón borrar historial cuando se desee.
</div>

<div class="figure" style="text-align: center">
<img src="FIG10.jpg" alt="Historial del Chat, introducción del texto, botón de enviar y botón de borrar historial." width="60%" />
<p class="caption">(\#fig:CURSO-9)Historial del Chat, introducción del texto, botón de enviar y botón de borrar historial.</p>
</div>

<div class="justificar-texto">
En la \@ref(fig:CURSO-10) se muestra un ejemplo sencillo en el que se pregunta “¿Cuál es la capital de Cataluña?” y la aplicación responde en el área verde “Claro, la capital de Cataluña es Barcelona. Es una ciudad conocida por su arquitecura, cultura y vibrante vida urbana”. Y debajo aparece de nuevo el pompt del usuario para poder seguir interactuando.
</div>

<div class="figure" style="text-align: center">
<img src="FIG11.jpg" alt="Ejemplo de uso del chat de la aplicación." width="60%" />
<p class="caption">(\#fig:CURSO-10)Ejemplo de uso del chat de la aplicación.</p>
</div>

## Aplicación Usuario/(Sistema o Asistente)

<div class="justificar-texto">
En la \@ref(fig:CURSO-11) se muestra la segunda aplicación llamada Usuario/(Sistema o Asistente) y que es igual que la anterior con la diferencia de que hay un espacio llamado “SISTEMA DE PROMPT” donde el usuario tiene la opción de utilizar dos roles, el de usuario y el de sitema. Ya veremos más adelante como se puede utilizar de forma eficiente.
</div>

<div class="figure" style="text-align: center">
<img src="FIG12.jpg" alt="Aplicación Usuario/(Sistema o Asistente) en la que se añade el sistema de prompt." width="60%" />
<p class="caption">(\#fig:CURSO-11)Aplicación Usuario/(Sistema o Asistente) en la que se añade el sistema de prompt.</p>
</div>

<div class="justificar-texto">
En la \@ref(fig:CURSO-12)  se puede ver como en el sistema de prompt se ha especificado que realice respuestas solo si son de deporte y que de lo contrario indique que solo contesta a este tipo de preguntas. En cambio, cuando se le pregunta ¿Qué es el fútbol? Responde claramente.
</div>


<div class="figure" style="text-align: center">
<img src="FIG13.jpg" alt="Aplicación Usuario/(Sistema o Asistente) en la que se añade el sistema de prompt." width="60%" />
<p class="caption">(\#fig:CURSO-12)Aplicación Usuario/(Sistema o Asistente) en la que se añade el sistema de prompt.</p>
</div>


## Aplicación Crea una imagen

<div class="justificar-texto">
La siguiente aplicación se llama “Crea una imagen” (\@ref(fig:CURSO-13)) y a partir de la introducción de una propuesta en el área correspondiente y despues de clicar en el boton “Genera Imagen” la imagen se genera. Esta aplicación solo se puede ejecutar si previamente se han usado la primera o la segunda, ya que estas útlimas guardan la API Key en el sistema y ya no hace falta introducirla de nuevo.


<div class="figure" style="text-align: center">
<img src="FIG14.jpg" alt="Aplicación Crea una imagen." width="60%" />
<p class="caption">(\#fig:CURSO-13)Aplicación Crea una imagen.</p>
</div>

Se observa en la \@ref(fig:CURSO-14) como se ha generado una puesta de sol tal y como se había pedido. También se observa que las imágenes siempre son fotografías ya existentes, es decir, no está utilizando Dall-E 3, sino que reutiliza imágenes de algún repositorio disponible.
</div>

<div class="figure" style="text-align: center">
<img src="FIG15.jpg" alt="Uso de la Aplicación Crea una imagen para generar una puesta de sol." width="60%" />
<p class="caption">(\#fig:CURSO-14)Uso de la Aplicación Crea una imagen para generar una puesta de sol.</p>
</div>

## Video explicativo de como utilizar la aplicación

Explicación de como utilizar la aplicación: 


<div style="text-align: center;">
<h3 style="font-weight: bold; text-align: center;">Video Tutorial: Introducción a la aplicación 1</h3>
  <iframe width="500" height="400" src="https://www.youtube-nocookie.com/embed/DPsujpxg4u8?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>





<div style="text-align: center;">
<h3 style="font-weight: bold; text-align: center;">Video Tutorial: Introducción a la aplicación 2</h3>
  <iframe width="500" height="400" src="https://www.youtube-nocookie.com/embed/MnB-s7tRaGQ?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>



