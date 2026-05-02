library(readxl)

datos <- read_excel("LAB_DOE_6_Problem_1.xlsx")

datos$Block <- as.factor(datos$Block)
datos$Treatment <- as.factor(datos$Treatment)

modelo <- aov(Respuesta ~ Treatment + Block, data = datos)
summary(modelo)