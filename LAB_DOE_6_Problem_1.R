############################################################
# RANDOMIZATION OF A FACTORIAL EXPERIMENT WITH BLOCKS
# 5 treatments (A–E), 6 replicates each = 30 runs
# Structured into blocks with within-block randomization
############################################################


#Importaciones
library(writexl)


########################
# 1. DEFINE FACTOR LEVELS
########################

levels <- c("A", "B", "C", "D", "E")
replicates <- 6

treatment <- rep(levels, each = replicates)

########################
# 2. DEFINE BLOCK STRUCTURE
########################
# Example: 3 blocks, each with 10 runs (balanced design)

blocks <- rep(c("Block1", "Block2", "Block3"), each = 10)

design <- data.frame(
  Block = blocks,
  Treatment = treatment
)

########################
# 3. RANDOMIZATION WITHIN EACH BLOCK
########################

set.seed(123)  # reproducibility

design_randomized <- do.call(rbind,
  lapply(split(design, design$Block), function(df) {
    df[sample(nrow(df)), ]
  })
)

# Reassign global run order after blocking randomization
design_randomized$Run <- 1:nrow(design_randomized)

########################
# 4. RESULT
########################

design_randomized


write_xlsx(design_randomized, "LAB_DOE_6_Problem_1.xlsx")


############################################################
# NOTES
############################################################
# - Randomization is restricted within each block
# - Each block gets its own independent shuffle
# - This preserves block structure while avoiding bias
############################################################