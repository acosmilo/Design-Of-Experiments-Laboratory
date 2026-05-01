
# ONE-WAY ANOVA (3 GROUPS) + RESIDUALS IN R

# Three groups (same size)
group1 <- c(12, 14, 15, 13, 16)
group2 <- c(10, 11, 14, 12, 13)
group3 <- c(18, 17, 19, 20, 16)

# Combine into a single vector
values <- c(group1, group2, group3)

# Create a factor indicating group membership
group <- factor(rep(c("G1", "G2", "G3"), each = 5))


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

