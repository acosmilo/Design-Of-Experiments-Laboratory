############################################################
# RANDOMIZATION OF A RCBD (RANDOMIZED COMPLETE BLOCK DESIGN)
############################################################

# Importaciones
library(writexl)

########################
# 1. DEFINE FACTOR LEVELS
########################

levels <- c("A", "B", "C", "D", "E")
blocks <- c("Block1", "Block2", "Block3")
replicates <- 6

########################
# 2. CREATE RCBD STRUCTURE (COMPLETO)
########################

# Todas las combinaciones Treatment × Block
design <- expand.grid(
  Treatment = levels,
  Block = blocks
)

# Replicaciones por combinación
design <- design[rep(1:nrow(design), each = replicates), ]

########################
# 3. RANDOMIZATION WITHIN EACH BLOCK
########################

#set.seed(123)  # opcional

design_randomized <- do.call(rbind,
  lapply(split(design, design$Block), function(df) {
    df[sample(nrow(df)), ]
  })
)

# Reordenar corridas
design_randomized$Run <- 1:nrow(design_randomized)

########################
# 4. RESULT
########################

design_randomized

write_xlsx(design_randomized, "LAB_DOE_6_Problem_1.xlsx")

############################################################
# NOMBRE BASE
############################################################

base_name <- "LAB_DOE_6"

############################################################
# VISUALIZACIÓN
############################################################

png(paste0(base_name, "_0_Design_Randomized.png"),
    width = 400, height = 700, res = 80)

plot.new()

design_randomized_txt <- capture.output(design_randomized)

text(0, 1,
     paste("Design_Randomized\n\n", paste(design_randomized_txt, collapse = "\n")),
     adj = c(0,1),
     family = "mono",
     cex = 0.8)

dev.off()
############################################################
# NOTES
############################################################
# - Cada tratamiento aparece en cada bloque (RCBD válido)
# - Se controla la variabilidad entre bloques
# - Permite estimar efectos de Treatment y Block
############################################################