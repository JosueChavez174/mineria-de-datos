# 1. Instalar la librería para leer archivos de Excel (Solo se ejecuta 1 vez en tu PC)
install.packages("readxl")

# 2. Activar la librería en la sesión actual
library(readxl)

# 3. Cargar el archivo Excel a la variable 'datos'
# (Cambia "E:/data1.xlsx" por la ubicación real de tu archivo si es distinta)
datos <- read_excel("data1.xlsx")

# 4. Muestra las primeras 6 filas en la consola para verificar que se cargó bien
head(datos)

# 1. Instalar la librería de gráficos (Solo se ejecuta 1 vez en tu PC)
install.packages("ggplot2")

# 2. Activar la librería
library(ggplot2)

# 3. Generar el gráfico
ggplot(datos, aes(x = Edad, y = Promedio)) +
  stat_summary(fun = "mean", geom = "bar") +
  labs(
    title = "Promedio por Edad",
    x = "Edad",
    y = "Promedio"
  )

# Gráfico de barras del Promedio por Estudiante
ggplot(datos, aes(x = factor(Promedio), y = Asistencia)) +
  stat_summary(fun = "mean", geom = "bar", fill = "red") +
  labs(
    title = "Asistencia Promedio por Nota",
    x = "Promedio Obtenido",
    y = "Asistencia Media (%)"
  )

# 1. Ordenamos el dataset de menor a mayor Asistencia
datos_ordenados <- datos[order(datos$Asistencia), ]

# 2. Graficamos la tendencia lineal
ggplot(datos_ordenados, aes(x = Asistencia, y = Promedio)) +
  geom_line(color = "darkblue", linewidth = 1) +
  geom_point(color = "red", size = 2) +
  labs(
    title = "Tendencia del Promedio en función de la Asistencia",
    x = "Porcentaje de Asistencia (%)",
    y = "Promedio Final"
  )

# 3. Diagrama de Dispersion
ggplot(datos, aes(x = Asistencia, y = Promedio)) +
  geom_point(color = "darkgreen", size = 3) +
  geom_smooth(method = "lm", color = "orange", se = FALSE) +
  labs(
    title = "Dispersión: Asistencia vs Promedio",
    x = "Asistencia (%)",
    y = "Promedio"
  )

# Dividimos la Asistencia en 3 tramos
datos$Rango_Asistencia <- cut(datos$Asistencia, breaks = 3, labels = c("Baja", "Media", "Alta"))

# Graficamos la torta
ggplot(datos, aes(x = "", y = Promedio, fill = Rango_Asistencia)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  theme_void() +
  labs(title = "Proporción de Promedio Acumulado por Rango de Asistencia")

# 5. Graficos de Diagrama de caja
ggplot(datos, aes(x = Rango_Asistencia, y = Promedio, fill = Rango_Asistencia)) +
  geom_boxplot() +
  labs(
    title = "Distribución del Promedio según Rango de Asistencia",
    x = "Rango de Asistencia",
    y = "Promedio"
  )


# 1. Instalar el paquete (solo se hace 1 vez en tu PC)
install.packages("ggcorrplot")

# 2. Cargar la librería en tu sesión actual (¡ESTA ERA LA LÍNEA QUE FALTABA!)
library(ggcorrplot)

# 3. Filtrar las columnas numéricas
datos_sub <- datos[, c("Asistencia", "Promedio")]

# 4. Calcular matriz de correlación y generar el gráfico
matriz_corr <- cor(datos_sub)
ggcorrplot(matriz_corr, lab = TRUE, title = "Matriz de Correlación: Asistencia vs Promedio")


#Histograma
ggplot(datos) +
  geom_histogram(aes(x = Asistencia, fill = "Asistencia"), binwidth = 10, alpha = 0.5, color = "black") +
  geom_histogram(aes(x = Promedio, fill = "Promedio"), binwidth = 10, alpha = 0.5, color = "black") +
  labs(
    title = "Distribución Comparativa: Asistencia vs Promedio",
    x = "Valor (0 a 100)",
    y = "Frecuencia de Estudiantes",
    fill = "Variable"
  )