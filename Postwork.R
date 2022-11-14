# Postwork Sesión 1.

#### Objetivo

"El Postwork tiene como objetivo que practiques los comandos básicos aprendidos 
durante la sesión, de tal modo que sirvan para reafirmar el conocimiento. Recuerda 
que la programación es como un deporte en el que se debe practicar, habrá caídas, 
pero lo importante es levantarse y seguir adelante. Éxito"

#### Requisitos
#- Concluir los retos
#- Haber estudiado los ejemplos durante la sesión

#### Desarrollo

"El siguiente postwork, te servirá para ir desarrollando habilidades como si se 
tratara de un proyecto que evidencie el progreso del aprendizaje durante el módulo, 
sesión a sesión se irá desarrollando.
A continuación aparecen una serie de objetivos que deberás cumplir, es un ejemplo 
real de aplicación y tiene que ver con datos referentes a equipos de la liga española 
de fútbol (recuerda que los datos provienen siempre de diversas naturalezas), en 
este caso se cuenta con muchos datos que se pueden aprovechar, explotarlos y generar 
análisis interesantes que se pueden aplicar a otras áreas. Siendo así damos paso a las instrucciones:" 
  
#1. Del siguiente enlace, descarga los datos de soccer de la temporada 2019/2020 de la primera división de la liga española:
#   https://www.football-data.co.uk/spainm.php

#2. Importa los datos a R como un Dataframe. NOTA: No olvides cambiar tu dirección de trabajo a la ruta donde descargaste tu archivo
sp1 <- read.csv("data/SP1.csv")

#4. Del dataframe que resulta de importar los datos a `R`, extrae las columnas que contienen los números de goles anotados por los 
#   equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG); guárdalos en vectores
#   separados
(fthg = sp1["FTHG"])
(ftag  = sp1["FTAG"])

#4. Consulta cómo funciona la función `table` en `R`. Para ello, puedes ingresar los comandos `help("table")` o `?table` para leer la
#   documentación.

# Parece que la función table requiere que los datos estén en una sola estructura (¿para qué usamos vectores separados?)
table(cbind(fthg, ftag))

# Pudo haberse hecho:
goals = sp1[c("FTHG", "FTAG")]
table(goals)

#5. Responde a las siguientes preguntas:
# Todas resueltas por inspección visual del resultado de table, después busqué info adicional.
#  a) ¿Cuántos goles tuvo el partido con mayor empate?
#     8 goles (empate 4-4)
teams_goals <- sp1[c("Date", "HomeTeam", "AwayTeam", "FTHG", "FTAG")]
teams_goals[teams_goals["FTHG"]==4 & teams_goals["FTAG"]==4,]
# El 17/ago/19 Villarreal y Granada empataror a 4 goles

#  b) ¿En cuántos partidos ambos equipos empataron 0 a 0?
#     En los siguientes 33 partidos
teams_goals[teams_goals["FTHG"]==0 & teams_goals["FTAG"]==0,]

#  c) ¿En cuántos partidos el equipo local (HG) tuvo la mayor goleada sin dejar que el equipo visitante (AG) metiera un solo gol?
#     En un partido el equipo local ganó 6-0

teams_goals[teams_goals["FTHG"]==6 & teams_goals["FTAG"]==0,]
# El 21/jun/20 el Celta, jugando de local, goleó 6-0 al Alaves.

#  __Notas para los datos de soccer:__ https://www.football-data.co.uk/notes.txt