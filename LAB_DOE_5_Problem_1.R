
# RANDOMIZATION OF A ONE-FACTOR EXPERIMENT
# 3 levels, 5 replicates each (15 runs total)

#Importaciones
library(writexl)


levels <- c("A", "B","C")   # factor levels
replicates <- 5

treatment <- rep(levels, each = replicates)

design <- data.frame(
  Run = 1:length(treatment),
  Treatment = treatment
)

#set.seed(123)  # for reproducibility

design_randomized <- design[sample(nrow(design)), ]

design_randomized$Run <- 1:nrow(design_randomized)

print(design_randomized)
write_xlsx(design_randomized, "LAB_DOE_5_Problem_1.xlsx")

############################################################
# NOMBRE BASE AUTOMÁTICO
############################################################

base_name <- "LAB_DOE_5"

############################################################
# Aleatorización
############################################################

png(paste0(base_name, "_0_Design_Randomized.png"),
    width = 300, height = 500, res = 100)

plot.new()

design_randomized_txt <- capture.output(design_randomized)

text(0, 1,
     paste("Design_Randomized\n\n", paste(design_randomized_txt, collapse = "\n")),
     adj = c(0,1),
     family = "mono",
     cex = 0.8)

dev.off()


# - sample() randomly permutes the runs
# - set.seed() ensures you get the same randomization again
# - "Run" is the execution order after randomization
