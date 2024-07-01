library(shiny)
library(shinydashboard)
library(httr)
library(stringr)
if(!require(shinyBS)) install.packages("shinyBS")
library(shinyBS)
library(openai)
library(magick)
library(shinyjs)
library(shinyauthr)
library(shinymanager)

# Definir credenciales de usuario
credentials <- data.frame(
  user = c("angel-lopez"), # nombre de usuario
  password = c("ñangel-lopezñ"), # contraseña
  stringsAsFactors = FALSE
)

# Function to create image
create_openai_image <- function(prompt) {
  image_data <- create_image(prompt)
  image_url <- image_data$data$url
  return(image_url)
}

ui <- dashboardPage(
  dashboardHeader(
    title = tags$div(
      tags$h1("TFG UOC", style = "margin: 0; font-size: 24px;"), # Ajusta el tamaño de la fuente según sea necesario
      tags$h4("ÁNGEL LÓPEZ-MUJERIEGO COLLADO", style = "margin: 0; font-weight: normal; font-size: 10px;")
    )
  ),
  dashboardSidebar( 
    sidebarMenu(
      menuItem("Usuario", tabName = "chatgpt2", icon = icon("fas fa-user")),  # Icono para la primera aplicación
      menuItem("Usuario/(Sistema o Asistente)", tabName = "chatgpt1", icon = icon("fas fa-comments")),  # Icono para la segunda aplicación
      menuItem("Crea una imagen", tabName = "app3", icon = icon("fas fa-image")),  # Icono diferente para la aplicación 3
      menuItem("Transcribe un audio", tabName = "app4", icon = icon("fas fa-file-audio")),  # Icono diferente para la aplicación 4
      menuItem("Traduce un audio al inglés", tabName = "app5", icon = icon("fas fa-file-audio")),  # Icono diferente para la aplicación 5
      tags$li(class = "dropdown", 
              tags$a(href = "#", 
                     tags$span(class = "icon", icon("sign-out-alt")), 
                     "Cerrar sesión", id = "logout_button"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "chatgpt1",
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    h3("ChatGPT con Shiny: Sistema y Usuario"),
                    p("Esta aplicación te permite interactuar con el modelo de OpenAI GPT utilizando dos roles: Sistema y Usuario:"),
                    textInput("api_key", "API Key", ""),
                    tags$script(HTML("
                      $(document).ready(function() {
                        $('#api_key').attr('placeholder', 'Introduce tu KEY aquí');
                      });
                    ")),
                    bsTooltip(id = "api_key", title = "Introduce el valor de tu API Key. Una vez acabes de usarla regenérala por seguridad.", placement = "right", trigger = "hover"),
                    tags$p("Encuentra tu OpenAI API:", tags$a(href = "https://platform.openai.com/account/api-keys", target = "_blank", style = "font-size: 10px;", "https://platform.openai.com/account/api-keys")),
                    tags$hr(),
                    selectInput("model_name", "Nombre del modelo", choices = c("gpt-4o", "gpt-4-turbo", "gpt-3.5-turbo"), selected = "gpt-4o"),
                    bsTooltip(id = "model_name", title = "Escoje la versión deseada del modelo.", placement = "right", trigger = "hover"),
                    tags$hr(),
                    sliderInput("temperature", "Temperatura", min = 0, max = 2, value = 0.7, step = 0.1),
                    bsTooltip(id = "temperature", title = "La temperatura controla la aleatoriedad de las respuestas. Un valor bajo genera respuestas más predecibles, mientras que un valor alto produce respuestas más variadas y creativas.", placement = "right", trigger = "hover"),
                    sliderInput("max_length", "Máxima longitud", min = 1, max = 1000, value = 200, step = 1),
                    bsTooltip(id = "max_length", title = "Máxima longitud: Ajusta la longitud máxima permitida para un valor numérico. Utiliza este control deslizante para seleccionar el rango de valores que deseas permitir, desde el valor mínimo hasta el máximo.", placement = "right", trigger = "hover"),
                    tags$hr(),
                    textAreaInput(inputId = "sysprompt", label = "SISTEMA DE PROMPT", height = "200px", placeholder = "Eres un asistente eficiente."),
                    bsTooltip(id = "sysprompt", title = "Ingresa el texto que deseas que el asistente utilice como contexto o guía al generar respuestas. Esto puede incluir preguntas, instrucciones o información relevante que desees que el asistente tenga en cuenta.", placement = "right", trigger = "hover"),
                    tags$hr()
                  ),
                  mainPanel(
                    tags$h3("Historial del chat"),
                    tags$hr(),
                    uiOutput("chat_history"),
                    tags$hr(),
                    textAreaInput(inputId = "user_message", placeholder = "Entra tu mensaje:", label = "PROMPT DEL USUARIO", width = "100%"),
                    bsTooltip(id = "user_message", title = "Entra tu mensaje para poder interactuar con el contenido que has incluido en el Sistema de Prompt", placement = "left", trigger = "hover"),
                    actionButton("send_message", "Enviar", icon = icon("paper-plane"), style = "width: 100%; height: 50px;"),
                    tags$hr(),
                    actionButton("clear_history", "Borrar Historial", icon = icon("trash")),
                    tags$hr(),
                    actionButton("logout_button", "Cerrar sesión", icon = icon("sign-out-alt"))
                  )
                )
              )
      ),
      tabItem(tabName = "chatgpt2",
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    h3("ChatGPT con Shiny"),
                    p("Esta aplicación te permite interactuar con el modelo de OpenAI GPT utilizando el rol de usuario:"),
                    textInput("api_key2", "API Key", ""),
                    tags$script(HTML("
                      $(document).ready(function() {
                        $('#api_key2').attr('placeholder', 'Introduce tu KEY aquí');
                      });
                    ")),
                    bsTooltip(id = "api_key2", title = "Introduce el valor de tu API Key. Una vez acabes de usarla regenérala por seguridad.", placement = "right", trigger = "hover"),
                    tags$p("Encuentra tu OpenAI API:", tags$a(href = "https://platform.openai.com/account/api-keys", target = "_blank", style = "font-size: 10px;", "https://platform.openai.com/account/api-keys")),
                    tags$hr(),
                    selectInput("model_name2", "Nombre del modelo", choices = c("gpt-4o", "gpt-4-turbo", "gpt-3.5-turbo"), selected = "gpt-4o"),
                    bsTooltip(id = "model_name2", title = "Escoje la versión deseada del modelo.", placement = "right", trigger = "hover"),
                    tags$hr(),
                    sliderInput("temperature2", "Temperatura", min = 0, max = 2, value = 0.7, step = 0.1),
                    bsTooltip(id = "temperature2", title = "La temperatura controla la aleatoriedad de las respuestas. Un valor bajo genera respuestas más predecibles, mientras que un valor alto produce respuestas más variadas y creativas.", placement = "right", trigger = "hover"),
                    sliderInput("max_length2", "Máxima longitud", min = 1, max = 1000, value = 200, step = 1),
                    bsTooltip(id = "max_length2", title = "Máxima longitud: Ajusta la longitud máxima permitida para un valor numérico. Utiliza este control deslizante para seleccionar el rango de valores que deseas permitir, desde el valor mínimo hasta el máximo.", placement = "right", trigger = "hover"),
                    tags$hr()
                  ),
                  mainPanel(
                    tags$h3("Historial del chat"),
                    tags$hr(),
                    uiOutput("chat_history2"),
                    tags$hr(),
                    textAreaInput(inputId = "user_message2", placeholder = "Entra tu mensaje:", label = "PROMPT DEL USUARIO", width = "100%"),
                    bsTooltip(id = "user_message2", title = "Ingresa el texto que deseas que el modelo ejecute.", placement = "left", trigger = "hover"),
                    actionButton("send_message2", "Enviar", icon = icon("paper-plane"), style = "width: 100%; height: 50px;"),
                    tags$hr(),
                    actionButton("clear_history2", "Borrar Historial", icon = icon("trash"))
                  )
                )
              )
      ),
      tabItem(tabName = "app3",
              fluidPage(
                sidebarLayout(
                  sidebarPanel(
                    textInput("image_prompt", "Introduce el Prompt de la imagen", ""),
                    tags$script(HTML("
                      $(document).ready(function() {
                        $('#image_prompt').attr('placeholder', 'Un perro travieso');
                      });
                    ")), bsTooltip(id = "image_prompt", title = "Introduce la descripción de tu imágen.", placement = "right", trigger = "hover")),
                  mainPanel(
                    actionButton("generate_image", "Genera Imagen"),
                    tags$br(),  # Adds a line break for visual spacing
                    uiOutput("image_placeholder")  # This will place the image below the button
                  )
                )
              )
      ),
      tabItem(tabName = "app4",
              fluidPage(
                fileInput("audio_file", "Carga archivo MP3/MP4"),
                h4("¡Máximo 3 Megas!"),
                actionButton("transcribe_audio", "Transcribe Audio"),
                hr(),
                h4("Resultado de la transcripción"),
                uiOutput("transcription_result"),
                uiOutput("transcription_progress")
              )
      ),
      tabItem(tabName = "app5",
              fluidPage(
                fileInput("audio_file", "Carga el archivo"),
                h4("¡Máximo 3 Megas!"),
                actionButton("translate_button", "Traduce"),
                hr(),
                h4("Resultado de la traducción"),
                verbatimTextOutput("translation_result")
              )
      )
    )
  )
)

server <- function(input, output, session) {
  chat_data <- reactiveVal(data.frame())
  
  observeEvent(input$send_message, {
    if (input$user_message != "") {
      new_data <- data.frame(source = "user", message = input$user_message, stringsAsFactors = FALSE)
      chat_data(rbind(chat_data(), new_data))
      
      gpt_res <- call_gpt_api(input$api_key, input$user_message, input$model_name, input$temperature, input$max_length, input$sysprompt)
      
      # Set OpenAI API key
      Sys.setenv(OPENAI_API_KEY = input$api_key)
      
      if (!is.null(gpt_res)) {
        gpt_data <- data.frame(source = "Segunda aplicación", message = gpt_res, stringsAsFactors = FALSE)
        chat_data(rbind(chat_data(), gpt_data))
      }
      updateTextInput(session, "user_message", value = "")
    }
  })
  
  observeEvent(input$clear_history, {
    chat_data(data.frame()) # Limpiar historial
  })
  
  call_gpt_api <- function(api_key, prompt, model_name, temperature, max_length, sysprompt) {
    response <- httr::POST(
      url = "https://api.openai.com/v1/chat/completions", 
      add_headers(Authorization = paste("Bearer", api_key)),
      content_type("application/json"),
      encode = "json",
      body = list(
        model = model_name,
        messages = list(
          list(role = "user", content = prompt),
          list(role = "system", content = sysprompt)
        ),
        temperature = temperature,
        max_tokens = max_length
      )
    )
    return(str_trim(content(response)$choices[[1]]$message$content))
  }
  
  output$chat_history <- renderUI({
    if (nrow(chat_data()) > 0) {
      chatBox <- lapply(1:nrow(chat_data()), function(i) {
        tags$div(class = ifelse(chat_data()[i, "source"] == "user", "alert alert-secondary", "alert alert-success"),
                 HTML(paste0("<b>", chat_data()[i, "source"], ":</b> ", chat_data()[i, "message"])))
      })
      do.call(tagList, chatBox)
    } else {
      return(NULL)  # Asegura que no se devuelve nada si no hay datos
    }
  })
  
  chat_data2 <- reactiveVal(data.frame())
  
  observeEvent(input$send_message2, {
    if (input$user_message2 != "") {
      new_data <- data.frame(source = "user", message = input$user_message2, stringsAsFactors = FALSE)
      chat_data2(rbind(chat_data2(), new_data))
      
      gpt_res2 <- call_gpt_api2(input$api_key2, input$user_message2, input$model_name2, input$temperature2, input$max_length2)
      # Set OpenAI API key
      Sys.setenv(OPENAI_API_KEY = input$api_key2)
      if (!is.null(gpt_res2)) {
        gpt_data2 <- data.frame(source = "Primera aplicación", message = gpt_res2, stringsAsFactors = FALSE)
        chat_data2(rbind(chat_data2(), gpt_data2))
      }
      updateTextInput(session, "user_message2", value = "")
    }
  })
  
  observeEvent(input$clear_history2, {
    chat_data2(data.frame()) # Limpiar historial
  })
  
  call_gpt_api2 <- function(api_key2, prompt2, model_name2, temperature2, max_length2) {
    response2 <- httr::POST(
      url = "https://api.openai.com/v1/chat/completions", 
      add_headers(Authorization = paste("Bearer", api_key2)),
      content_type("application/json"),
      encode = "json",
      body = list(
        model = model_name2,
        messages = list(
          list(role = "user", content = prompt2)
        ),
        temperature = temperature2,
        max_tokens = max_length2
      )
    )
    return(str_trim(content(response2)$choices[[1]]$message$content))
  }
  
  output$chat_history2 <- renderUI({
    if (nrow(chat_data2()) > 0) {
      chatBox2 <- lapply(1:nrow(chat_data2()), function(i) {
        tags$div(class = ifelse(chat_data2()[i, "source"] == "user", "alert alert-secondary", "alert alert-success"),
                 HTML(paste0("<b>", chat_data2()[i, "source"], ":</b> ", chat_data2()[i, "message"])))
      })
      do.call(tagList, chatBox2)
    } else {
      return(NULL)  # Asegura que no se devuelve nada si no hay datos
    }
  })
  
  observeEvent(input$generate_image, {
    image_url <- create_openai_image(input$image_prompt)
    output$image_placeholder <- renderUI({
      tags$img(src = image_url, style = "max-width: 500px; max-height: 500px;")
    })
  })
  
  # Function to transcribe audio using OpenAI's create_transcription function
  transcribe_audio <- function(audio_path) {
    # Call OpenAI's create_transcription function to transcribe the audio
    model <- "whisper-1"  # Adjust this according to the model you want to use
    # Call OpenAI's create_transcription function to transcribe the audio
    transcription <- create_transcription(audio_path, model = model)
    return(transcription)
  }
  
  # Render transcription result
  output$transcription_result <- renderUI({
    if (!is.null(input$audio_file)) {
      hr()
      h4("Resultado de la traducción:")
      verbatimTextOutput("transcription_text")
    }
  })
  
  # Perform translation when button is clicked
  
  # Perform transcription when button is clicked
  observeEvent(input$transcribe_audio, {
    req(input$audio_file)
    audio_path <- input$audio_file$datapath
    transcription <- transcribe_audio(audio_path)
    output$transcription_text <- renderText({
      # Limpiar el texto eliminando los caracteres adicionales
      cleaned_text <- gsub("\\[\\d+\\]", "", transcription$text)
      cleaned_text <- gsub("\"", "", cleaned_text)
      # Reemplazar los puntos con puntos seguidos de un salto de línea
      cleaned_text <- gsub("\\. ", ".\n", cleaned_text)
      # Eliminar espacios en blanco al principio y al final
      cleaned_text <- trimws(cleaned_text)
      return(cleaned_text)
    })
  })
  
  translate_audio <- function(audio_path) {
    # Specify the language of the audio
    audio_language <- "es"  # Change this to the appropriate language code if necessary
    
    # Transcribe audio
    transcription <- create_transcription(audio_path, model = "whisper-1")
    
    # Translate transcription to English
    translation <- create_translation(file = audio_path, model = "whisper-1")
    
    return(translation$text)
  }
  
  # Perform translation when button is clicked
  observeEvent(input$translate_button, {
    req(input$audio_file)
    audio_path <- input$audio_file$datapath
    translation <- translate_audio(audio_path)
    output$translation_result <- renderText({
      # Limpiar el texto eliminando los caracteres adicionales
      cleaned_text <- gsub("\\[\\d+\\]", "", translation)
      cleaned_text <- gsub("\"", "", cleaned_text)
      # Reemplazar los puntos con puntos seguidos de un salto de línea
      cleaned_text <- gsub("\\. ", ".\n", cleaned_text)
      # Eliminar espacios en blanco al principio y al final
      cleaned_text <- trimws(cleaned_text)
      return(cleaned_text)
    })
  })
  
  # Agregar autenticación con shinymanager
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )
  
  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })
  
  # Implementar la funcionalidad de logout
  observeEvent(input$logout_button, {
    logout(session = session)
  })
}

# Agregar un título en la página de login
secure_app_ui <- secure_app(
  ui,
  tags_top = tags$div(
    tags$h2("TFG UOC GRADO DE CIENCIA DE DATOS APLICADA", style = "text-align: center;color: blue;"),
    tags$h3("ÁNGEL LÓPEZ-MUJERIEGO COLLADO", style = "text-align: center;color: black;"),
    tags$h4("Por favor, inicia sesión para continuar", style = "text-align: center;color: green;"),
    tags$hr()
  )
)


shinyApp(ui = secure_app_ui, server = server)
