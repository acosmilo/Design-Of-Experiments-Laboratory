
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

# - sample() randomly permutes the runs
# - set.seed() ensures you get the same randomization again
# - "Run" is the execution order after randomization
