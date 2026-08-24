install.packages(c("readxl", "ggplot2", "e1071", "gridExtra"))

library(readxl)
library(ggplot2)
library(e1071)
library(gridExtra)

df <- read_excel("student_info.xlsx")
num_cols <- c("math_score", "reading_score", "writing_score", "attendance_rate", "study_hours")

get_mode <- function(v) unique(v)[which.max(tabulate(match(v, unique(v))))]
descriptiva <- data.frame(
  Media = sapply(df[num_cols], mean), Mediana = sapply(df[num_cols], median), Moda = sapply(df[num_cols], get_mode),
  Rango = sapply(df[num_cols], \ (x) max(x) - min(x)), Varianza = sapply(df[num_cols], var),
  Desv_Est = sapply(df[num_cols], sd), IQR = sapply(df[num_cols], IQR)
)
print(round(descriptiva, 2))

# Punto 3: Medidas de posiciónSS
posicion <- t(sapply(df[num_cols], quantile, probs = c(0.10, 0.25, 0.50, 0.75, 0.90, 0.95)))
colnames(posicion) <- c("D1/P10", "Q1/P25", "Q2/P50", "Q3/P75", "D9/P90", "P95")
print(round(posicion, 2))

# Punto 4: Medidas de forma
forma <- data.frame(
  Asimetria = sapply(df[num_cols], skewness),
  Curtosis  = sapply(df[num_cols], kurtosis)
)
print(round(forma, 2))

# Punto 4: Visualizaciones
g1 <- ggplot(df, aes(x = math_score)) +
  geom_histogram(bins = 15, fill = "skyblue", color = "black") +
  labs(title = "Distribución Matemáticas")

g2 <- ggplot(df, aes(x = "Notas", y = math_score)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Boxplot Matemáticas (Cuartiles)")

g3 <- ggplot(df, aes(x = final_result, y = attendance_rate, fill = final_result)) +
  geom_boxplot() +
  labs(title = "Asistencia por Resultado")

g4 <- ggplot(df, aes(x = study_hours, y = math_score)) +
  geom_point(color = "steelblue") +
  labs(title = "Estudio vs Matemáticas")

grid.arrange(g1, g2, g3, g4, ncol = 2)