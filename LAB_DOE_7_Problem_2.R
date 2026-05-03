#IMPORTAR libreria

#Libreria para leer Excels
library(readxl)

# Para la prueba de AD
library(nortest)

# Para la prueba de igualdad de varianzas de Levenne
library(car)

#Libreria para Transformación Box-Cox
library(MASS)

#Libreria para el Fisher
library(agricolae)

#Libreria para agrupar Tukey
library(multcompView)

#Leer los datos

datos <- read_excel("LAB_DOE_7_Problem_1.xlsx")

# NOMBRE BASE AUTOMÁTICO
############################################################

base_name <- "LAB_DOE_7"


datos$Block <- as.factor(datos$Block)
datos$Treatment <- as.factor(datos$Treatment)
design_factor <- datos$Treatment

anova_model <- aov(Respuesta ~ Treatment + Block, data = datos)

res <- residuals(anova_model)
fit <- fitted(anova_model)

r2 <- summary.lm(anova_model)$r.squared
r2_adj <- summary.lm(anova_model)$adj.r.squared

############################################################
# 1. FOUR-IN-ONE
############################################################

png(paste0(base_name, "_1_FOUR_IN_ONE.png"),
    width = 1200, height = 1200, res = 150)

par(mfrow = c(2,2))

qqnorm(res, main = "Normal Probability Plot")
qqline(res)

plot(fit, res,
     main = "Residuals vs Fitted",
     xlab = "Fitted Values",
     ylab = "Residuals")
abline(h = 0, col = "red")

hist(res,
     main = "Histogram of Residuals",
     xlab = "Residuals")

plot(res,
     main = "Residuals vs Order",
     xlab = "Observation Order",
     ylab = "Residuals",
     type = "b")
abline(h = 0, col = "red")

dev.off()

############################################################
# 2. Supuesto de Normlidad
############################################################

png(paste0(base_name, "_2_AD.png"), width = 400, height = 300, res = 100) 
plot.new() 
norm_txt <- capture.output(ad.test(res)) 
text(0, 1, 
paste("Supuesto de Normlidad\n\n", 
paste(norm_txt, collapse = "\n")), 
adj = c(0,1), family = "mono", cex = 0.8) 
dev.off()


############################################################
# 3. Supuesto de Homocedasticidad
############################################################

png(paste0(base_name, "_3_Homocedasticidad.png"),
    width = 700, height = 300, res = 100)

plot.new()

homo_txt <- capture.output(leveneTest(res ~ design_factor))

text(0, 1,
     paste("Supuesto de Homocedasticidad\n\n", paste(homo_txt, collapse = "\n")),
     adj = c(0,1),
     family = "mono",
     cex = 0.8)

dev.off()


############################################################
# 4. ACF
############################################################

png(paste0(base_name, "_4_ACF.png"),
    width = 800, height = 600, res = 150)

acf(res, main = "ACF of Residuals")

dev.off()


############################################################
# 00 Transformación BoxCox
############################################################

png(paste0(base_name, "_00_Box_Cox.png"),
    width = 800, height = 600, res = 120)

bc <- boxcox(anova_model, lambda = seq(-2, 2, 0.01))

title("Box-Cox Transformation")

# λ óptimo
lambda <- bc$x[which.max(bc$y)]

# línea vertical
abline(v = lambda, col = "red", lwd = 2)

# imprimir texto en la gráfica
text(lambda, max(bc$y),
     labels = paste("lambda =", round(lambda, 3)),
     pos = 4, col = "red", cex = 1.2)

dev.off()


if (abs(lambda) < 1e-6) {
  datos$Y_trans <- log(datos$Respuesta)
} else {
  datos$Y_trans <- (datos$Respuesta^lambda - 1) / lambda
}
############################################################
#De nuevo Todo
############################################################

anova_model <- aov(Y_trans ~ Treatment + Block, data = datos)

res <- residuals(anova_model)
fit <- fitted(anova_model)

r2 <- summary.lm(anova_model)$r.squared
r2_adj <- summary.lm(anova_model)$adj.r.squared



############################################################
# 10. FOUR-IN-ONE
############################################################

png(paste0(base_name, "_10_FOUR_IN_ONE.png"),
    width = 1200, height = 1200, res = 150)

par(mfrow = c(2,2))

qqnorm(res, main = "Normal Probability Plot")
qqline(res)

plot(fit, res,
     main = "Residuals vs Fitted",
     xlab = "Fitted Values",
     ylab = "Residuals")
abline(h = 0, col = "red")

hist(res,
     main = "Histogram of Residuals",
     xlab = "Residuals")

plot(res,
     main = "Residuals vs Order",
     xlab = "Observation Order",
     ylab = "Residuals",
     type = "b")
abline(h = 0, col = "red")

dev.off()

############################################################
# 20. Supuesto de Normlidad
############################################################

png(paste0(base_name, "_20_AD.png"), width = 400, height = 300, res = 100) 
plot.new() 
norm_txt <- capture.output(ad.test(res)) 
text(0, 1, 
paste("Supuesto de Normlidad\n\n", 
paste(norm_txt, collapse = "\n")), 
adj = c(0,1), family = "mono", cex = 0.8) 
dev.off()


############################################################
# 30. Supuesto de Homocedasticidad
############################################################

png(paste0(base_name, "_30_Homocedasticidad.png"),
    width = 700, height = 300, res = 100)

plot.new()

homo_txt <- capture.output(leveneTest(res ~ design_factor))

text(0, 1,
     paste("Supuesto de Homocedasticidad\n\n", paste(homo_txt, collapse = "\n")),
     adj = c(0,1),
     family = "mono",
     cex = 0.8)

dev.off()


############################################################
# 40. ACF
############################################################

png(paste0(base_name, "_40_ACF.png"),
    width = 800, height = 600, res = 150)

acf(res, main = "ACF of Residuals")

dev.off()



############################################################
# 5. ANOVA
############################################################

png(paste0(base_name, "_5_ANOVA.png"),
    width = 800, height = 300, res = 100)

plot.new()

anova_txt <- capture.output(summary(anova_model))

text(0, 1,
     paste("ANOVA\n\n", paste(anova_txt, collapse = "\n")),
     adj = c(0,1),
     family = "mono",
     cex = 0.8)

dev.off()

############################################################
# 6. R cuadrado
############################################################
png(paste0(base_name, "_6_R2.png"),
    width = 400, height = 250, res = 110)

plot.new()

text(0, 1,
     paste(
        "\n", "R^2 =", round(r2, 5), "\n",
       "R^2 ajustado =", round(r2_adj, 5)
     ),
     adj = c(0,1),
     family = "mono",
     cex = 0.8)

dev.off()

############################################################
# 7. Post ANOVA Tukey HSD
############################################################

# Tukey HSD
tukey <- TukeyHSD(anova_model, "Treatment")

# Extraer p-values ajustados
tukey_p <- tukey$Treatment[, "p adj"]

# Convertir a letras de grupos (CLD)
tukey_groups <- multcompLetters(tukey_p)$Letters

# Mostrar resultados

png(paste0(base_name, "_7_Tukey.png"),
    width = 300, height = 300, res = 100)

plot.new()

tukey_txt <- capture.output(tukey_groups)

text(0, 1,
     paste("Tukey\n\n", paste(tukey_txt, collapse = "\n")),
     adj = c(0,1),
     family = "mono",
     cex = 0.8)

dev.off()
############################################################
# 8. Post ANOVA Fisher LSD
############################################################

#Print Fisher
lsd <- LSD.test(anova_model, "Treatment", p.adj = "none")


png(paste0(base_name, "_8_Fisher.png"),
    width = 300, height = 300, res = 100)

plot.new()

fisher_txt <- capture.output(lsd$groups)

text(0, 1,
     paste("Fisher\n\n", paste(fisher_txt, collapse = "\n")),
     adj = c(0,1),
     family = "mono",
     cex = 0.8)

dev.off()

