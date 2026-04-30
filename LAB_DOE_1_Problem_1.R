datos <- read.csv("LAB_DOE_1_Data_Set_1.csv")
x <- datos$Capacitancia
mu0 <- 650
sigma <- 25
n <- length(x)
Z <- (mean(x) - mu0) / (sigma / sqrt(n))
p_value <- 2 * (1 - pnorm(abs(z)))
Z
p_value
