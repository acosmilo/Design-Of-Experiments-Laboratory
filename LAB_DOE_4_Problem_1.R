############################################################
# ANDERSON-DARLING NORMALITY TEST ON ANOVA RESIDUALS
############################################################

pdf("LAB_DOE_4_Graphs.pdf")


########################
# 2. 	Anova
########################

# ONE-WAY ANOVA (5 GROUPS) + RESIDUALS IN R

# Five groups (same size)
group1 <- c(7, 7, 15, 11, 9)
group2 <- c(12, 17, 12, 18, 18)
group3 <- c(14, 18, 18, 19, 19)
group4 <- c(19, 25, 22, 19, 23)
group5 <- c(7, 10, 11, 15, 11)


# Combine into a single vector
values <- c(group1, group2, group3, group4, group5)

# Create a factor indicating group membership
group <- factor(rep(c("15", "20", "25", "30", "35"), each = 5))


# Fit ANOVA model
anova_model <- aov(values ~ group)

# Show ANOVA table
print("ANOVA")
print(summary(anova_model))
print("R^2")
print(summary.lm(anova_model)$r.squared)
print("R^2 adj")
print(summary.lm(anova_model)$adj.r.squared)

# Residuals from the model
res <- residuals(anova_model)
fit <- fitted(anova_model)

print("Imprimir residuos")
print(res)


########################
# 4. FOUR-IN-ONE PLOTS (MINITAB STYLE)
########################

# Set layout 2x2
par(mfrow = c(2, 2))

# 1. Normal Probability Plot (Q-Q plot)
qqnorm(res, main = "Normal Probability Plot")
qqline(res)

# 2. Residuals vs Fitted Values
plot(fit, res,
     main = "Residuals vs Fitted",
     xlab = "Fitted Values",
     ylab = "Residuals")
abline(h = 0, col = "red")

# 3. Histogram of Residuals
hist(res,
     main = "Histogram of Residuals",
     xlab = "Residuals")

# 4. Residuals vs Order (observation order)
plot(res,
     main = "Residuals vs Order",
     xlab = "Observation Order",
     ylab = "Residuals",
     type = "b")
abline(h = 0, col = "red")

###############################################
#SUPUESTOS OBJETIVOS

########################
# PRUEBA ANDERSON-DARLING

print("Prueba de Normalidad Anderson Darling")
print(ad.test(res))
# OUTPUT INTERPRETATION

# H0: los datos siguen una distribución normal
# H1: los datos NO son normales
#
# Si p-value > 0.05  -> no se rechaza normalidad
# Si p-value <= 0.05 -> se rechaza normalidad




########################
# 2. PRUEBA DE IGUALDAD DE VARIANZAS PRUEBA DE LEVENE

print("Prueba de Homocedasticidad Levene")

# Usando las mismas variables del ANOVA:
# res = residuos
# group = factor de grupos

print(leveneTest(res ~ group))


# OUTPUT INTERPRETATION

# H0: las varianzas son iguales (homogeneidad)
# H1: las varianzas son diferentes
#
# Si p-value > 0.05  -> no se rechaza H0 (varianzas iguales)
# Si p-value <= 0.05 -> se rechaza H0 (varianzas diferentes)


########################
#PRUEBA DE INDEPENDENCIA ACF

print("Prueba de Independencia")
print(acf(res, main = "ACF of ANOVA Residuals"))

# INTERPRETATION

# - Las barras representan autocorrelación en distintos rezagos (lags)
# - Las líneas punteadas son límites de significancia (~95%)
#
# Si todas las barras (excepto lag 0) están dentro de los límites:
#   -> no hay autocorrelación significativa
#   -> se cumple independencia
#
# Si hay barras fuera de los límites:
#   -> hay autocorrelación
#   -> posible violación del supuesto de independencia

dev.off()
