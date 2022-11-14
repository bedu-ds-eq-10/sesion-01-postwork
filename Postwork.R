# Postwork Sesión 1.

# Importa los datos a R como un Dataframe.
sp1 <- read.csv("data/SP1.csv")

# Extraer las columnas que contienen los números de goles anotados por los 
# equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que
# jugaron como visitante (FTAG); guardar en vectores separados
(fthg = sp1["FTHG"])
(ftag  = sp1["FTAG"])

# Consulta cómo funciona la función `table` en `R`.

# Parece que la función table requiere que los datos estén en una sola estructura 
# (¿para qué usamos vectores separados?)
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
