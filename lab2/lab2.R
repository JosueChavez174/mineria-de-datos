# ==========================================
# EJERCICIO 1: DATOS CUALITATIVOS
# ==========================================

# Datos nominales: colores favoritos
colores <- factor(c("rojo", "azul", "verde", "azul", "rojo", "verde", "amarillo"))[cite: 1]


# Datos ordinales: calificaciones con orden establecido
calificaciones <- factor(c("bueno", "excelente", "regular", "muy bueno", "bueno", "regular"),[cite: 1]

                         levels = c("regular", "bueno", "muy bueno", "excelente"),[cite: 1]
                         ordered = TRUE)[cite: 1]

# Tabla de frecuencias nominales
tabla_colores <- table(colores)[cite: 1]
print(tabla_colores)[cite: 1]

# Tabla de frecuencias ordinales
tabla_calificaciones <- table(calificaciones)[cite: 1]
print(tabla_calificaciones)[cite: 1]

# Gráfico de barras para datos nominales
barplot(tabla_colores, main = "Frecuencia de colores favoritos",[cite: 1]
        col = rainbow(length(tabla_colores)),[cite: 1]
        ylab = "Frecuencia", xlab = "Colores")[cite: 1]

# Gráfico de barras para datos ordinales
barplot(tabla_calificaciones, main = "Frecuencia de calificaciones",[cite: 1]
        col = heat.colors(length(tabla_calificaciones)),[cite: 1]
        ylab = "Frecuencia", xlab = "Calificaciones")[cite: 1]

# Gráfico de barras ordenado para ordinales (por orden definido)
library(ggplot2)[cite: 1]
df_calificaciones <- data.frame(calificaciones)[cite: 1]
ggplot(df_calificaciones, aes(x = calificaciones)) +[cite: 1]
  geom_bar(fill = "steelblue") +[cite: 1]
  ggtitle("Frecuencia de calificaciones ordinales") +[cite: 1]
  xlab("Calificaciones") + ylab("Frecuencia")[cite: 1]

# ==========================================
# EJERCICIO 2: DATOS CUANTITATIVOS
# ==========================================

# Cargar librería ggplot2 para gráficos avanzados
library(ggplot2)[cite: 1]

# Datos cuantitativos discretos: número de hijos por familia
hijos <- c(1, 2, 0, 3, 2, 1, 4, 0, 1, 2)[cite: 1]

# Datos cuantitativos continuos: estaturas en cm
estaturas <- c(170.5, 165.2, 180.3, 175.0, 169.8, 173.4, 182.1, 160.0, 168.5, 177.8)[cite: 1]

# Visualización para datos discretos
# Tabla de frecuencias
tabla_hijos <- table(hijos)[cite: 1]
print(tabla_hijos)[cite: 1]

# Gráfico de barras para datos discretos
barplot(tabla_hijos,[cite: 1]
        main = "Número de hijos por familia",[cite: 1]
        xlab = "Número de hijos",[cite: 1]
        ylab = "Frecuencia",[cite: 1]
        col = "lightblue")[cite: 1]

# Usando ggplot2 para barras (discretos)
df_hijos <- data.frame(hijos = factor(hijos))[cite: 1]
ggplot(df_hijos, aes(x = hijos)) +[cite: 1]
  geom_bar(fill = "skyblue") +[cite: 1]
  ggtitle("Frecuencia de número de hijos") +[cite: 1]
  xlab("Número de hijos") + ylab("Conteo")[cite: 1]

# Visualización para datos continuos
# Histograma
hist(estaturas,[cite: 1]
     main = "Histograma de estaturas",[cite: 1]
     xlab = "Estaturas (cm)",[cite: 1]
     col = "lightgreen",[cite: 1]
     border = "black",[cite: 1]
     breaks = 5)[cite: 1]

# Boxplot para datos continuos
boxplot(estaturas,[cite: 1]
        main = "Diagrama de caja de estaturas",[cite: 1]
        ylab = "Estatura (cm)",[cite: 1]
        col = "lightgreen")[cite: 1]