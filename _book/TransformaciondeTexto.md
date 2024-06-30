# Transformación de Texto

<style>
  .figure {
    text-align: center;
  }
  .figure .caption {
    text-align: center;
  }
</style>

<div class="justificar-texto">

## Introducción a la Transformación de Texto

Ahora aprenderemos sobre aplicaciones de transformación de texto y cómo la ingeniería de prompts efectiva las facilita. Como su nombre lo indica, la transformación de texto implica hacer cambios a lo largo de un texto dado para crear un nuevo texto mientras se mantiene la misma información. Tiene varias aplicaciones interesantes, incluyendo la traducción de idiomas, el ajuste de tono y la mejora de la escritura. Todas ellas se pueden hacer con LLMs utilizando prompts efectivos.

## Traducción de Idiomas

La primera aplicación que cubriremos es la traducción de texto de un idioma a otro. Al pedirle al LLM que traduzca un texto, debemos especificar los idiomas de entrada y salida en el prompt. Supongamos que tenemos la siguiente descripción de un producto para un scooter eléctrico escrita en inglés que describe su diseño. Pedimos al modelo que la traduzca del inglés al francés. Ver Figura  \@ref(fig:CURSO-45).


<div class="figure" style="text-align: center">
<img src="FIG45.jpg" alt="Traducción de un texto del inglés al francés." width="60%" />
<p class="caption">(\#fig:CURSO-45)Traducción de un texto del inglés al francés.</p>
</div>

Pero, ¿qué pasa si no se conoce el idioma del texto de entrada? En este caso, podemos pedir al modelo con un prompt delimitado y nombrará el idioma. En este ejemplo, el texto está escrito en alemán y tal y como se ve en la Figura \@ref(fig:CURSO-46) detecta el idioma. 


<div class="figure" style="text-align: center">
<img src="FIG46.jpg" alt="Detección del lenguaje del texto." width="60%" />
<p class="caption">(\#fig:CURSO-46)Detección del lenguaje del texto.</p>
</div>

Podemos traducir texto de un idioma a varios idiomas simultáneamente. Aquí pedimos al modelo que traduzca una reseña de producto en inglés al francés, español y alemán. El modelo genera una traducción en cada uno de los idiomas especificados. Las empresas pueden usar LLMS para proporcionar traducciones iniciales, pero deben verificar su corrección, particularmente si involucran a clientes. Ver Figura \@ref(fig:CURSO-47).

<div class="figure" style="text-align: center">
<img src="FIG47.jpg" alt="Resumen de un texto especificando que sea en una sola frase." width="60%" />
<p class="caption">(\#fig:CURSO-47)Resumen de un texto especificando que sea en una sola frase.</p>
</div>


## Ajuste de Tono

Otra aplicación de la transformación de texto es el ajuste de tono, que nos permite reescribir texto con un tono diferente para satisfacer diversas necesidades comerciales. Por ejemplo, una empresa de marketing puede tener un mensaje promocional sobre sus ventas de verano escrito de manera informal. Podemos pedir al modelo que lo reformule en un tono formal y persuasivo para resonar mejor con la audiencia, especificando esto en el prompt delimitado. Aquí podemos observar cómo el texto se ha transformado en uno profesional que invita a los clientes a explorar las notables ventas de verano, destacando sus beneficios únicos. El tono ha cambiado y la estructura también es más profesional (Figura \@ref(fig:CURSO-48)). 



<div class="figure" style="text-align: center">
<img src="FIG48.jpg" alt="Ajuste del tono de casual a formal." width="60%" />
<p class="caption">(\#fig:CURSO-48)Ajuste del tono de casual a formal.</p>
</div>

Para adaptar el tono de un texto dado, podemos especificar la audiencia objetivo, una estrategia crucial en la comunicación efectiva. Por ejemplo, consideremos una descripción de producto escrita con jerga técnica, como detalles sobre microprocesadores y algoritmos complejos. Al instruir al modelo que lo reformule para una audiencia no técnica, podemos hacerlo más accesible para los clientes que no tienen un trasfondo técnico. En consecuencia, podemos observar en la Figura \@ref(fig:CURSO-49) cómo el estilo de escritura se adapta para incluir un vocabulario menos complejo.

<div class="figure" style="text-align: center">
<img src="FIG49.jpg" alt="Ajuste del tono de técnico a no-técnico." width="60%" />
<p class="caption">(\#fig:CURSO-49)Ajuste del tono de técnico a no-técnico.</p>
</div>


## Mejora de la Escritura


Otros ejemplos comunes de transformación de texto incluyen mejoras gramaticales y de escritura. Si necesitamos que el modelo corrija errores de ortografía, gramática y puntuación sin modificar otros aspectos, debemos pedirle que revise nuestro texto mientras mantiene intacta la estructura. Para un texto que invita a discutir una posible oportunidad de colaboración, el modelo corrigió los acentos sin alterar nada relacionado con el estilo o la estructura del texto tal y como se ve en la Figura \@ref(fig:CURSO-50).



<div class="figure" style="text-align: center">
<img src="FIG50.jpg" alt="Corrección de los acentos de una frase." width="60%" />
<p class="caption">(\#fig:CURSO-50)Corrección de los acentos de una frase.</p>
</div>


Sin embargo, si queremos que el modelo mejore la claridad de nuestro texto modificando su estructura mientras mantiene el mismo significado, debemos pedirle que revise y reestructure el texto para mejorar la legibilidad, el flujo y la coherencia. En este caso, utilizando el mismo texto con los errores tipográficos, observamos cómo la estructura se vuelve más legible y bien escrita en la Figura \@ref(fig:CURSO-51).


<div class="figure" style="text-align: center">
<img src="FIG51.jpg" alt="Pasar de un texto escrito en Whatsapp a un formato legible, fluido y coherente." width="60%" />
<p class="caption">(\#fig:CURSO-51)Pasar de un texto escrito en Whatsapp a un formato legible, fluido y coherente.</p>
</div>



## Transformaciones Múltiples

Finalmente, podemos realizar múltiples transformaciones a la vez utilizando prompts de varios pasos. Supongamos que tenemos el siguiente texto para una reseña de producto escrita de manera informal con muchos errores.

`“XDIOS, ¡no puedo creer lo awesome que es este producto! ¡Es the best que existe! Ay que probarlo!”`

Pedimos al modelo que lo revise primero y luego lo reescriba en un tono profesional. El modelo pasa por las transformaciones solicitadas una por una, corrigiendo el texto en el paso uno, luego reescribiéndolo profesionalmente en el paso dos (Figura \@ref(fig:CURSO-52)).


<div class="figure" style="text-align: center">
<img src="FIG52.jpg" alt="Pasar de un texto escrito con muchos errores a un formato legible y profesional." width="60%" />
<p class="caption">(\#fig:CURSO-52)Pasar de un texto escrito con muchos errores a un formato legible y profesional.</p>
</div>




<div style="text-align: center;">
<h3 style="font-weight: bold; text-align: center;">Video Tutorial: Transformación de Texto</h3>
  <iframe width="500" height="400" src="https://www.youtube-nocookie.com/embed/yi5iHNITiaI?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>


</div>

