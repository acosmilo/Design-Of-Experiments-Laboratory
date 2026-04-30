
before <- c(230, 234, 235, 236, 245, 243)
after <- c(248, 246, 250, 251, 253, 255)

print(t.test(before, after, paired = TRUE, alternative = "two.sided"))