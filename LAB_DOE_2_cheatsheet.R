# PRUEBAS T DE DOS MUESTRAS EN R

# 1. DATOS DE EJEMPLO


# Muestras de igual tamaño
x1 <- c(12, 14, 15, 13, 16)
y1 <- c(10, 11, 14, 12, 13)

# Muestras de diferente tamaño
x2 <- c(12, 14, 15, 13, 16, 18, 17)
y2 <- c(10, 11, 14, 12)
# 2. PRUEBAS NO PAREADAS (INDEPENDIENTES)


# 2.1 Varianzas diferentes (Welch, opción por defecto en R)

# Bilateral (H0: medias iguales)
t.test(x1, y1, var.equal = FALSE, alternative = "two.sided")

# Unilateral derecha (H1: media de x > media de y)
t.test(x1, y1, var.equal = FALSE, alternative = "greater")

# Unilateral izquierda (H1: media de x < media de y)
t.test(x1, y1, var.equal = FALSE, alternative = "less")

# Con muestras de diferente tamaño
t.test(x2, y2, var.equal = FALSE)

# 2.2 Varianzas iguales (t de Student clásico)

# Bilateral
t.test(x1, y1, var.equal = TRUE, alternative = "two.sided")

# Unilateral derecha
t.test(x1, y1, var.equal = TRUE, alternative = "greater")

# Unilateral izquierda
t.test(x1, y1, var.equal = TRUE, alternative = "less")

# Con muestras de diferente tamaño
t.test(x2, y2, var.equal = TRUE)


#PRUEBAS PAREADAS (DEPENDIENTES)

# Bilateral
t.test(x1, y1, paired = TRUE, alternative = "two.sided")

# Unilateral derecha (x > y)
t.test(x1, y1, paired = TRUE, alternative = "greater")

# Unilateral izquierda (x < y)
t.test(x1, y1, paired = TRUE, alternative = "less")


# Para cambiar el intervalo de confianza se usa

# Prueba t con 99% de confianza (en lugar de 95%)
t.test(x, y, conf.level = 0.99)

############################################################
