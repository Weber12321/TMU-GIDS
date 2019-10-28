norm <- function(q1, q2, m, sd){
  # left
  a1 <- pnorm(q1, m, sd)
  # right
  a2 <- 1 - pnorm(q1, m, sd)
  # 面積反推
  a3 <- qnorm(q2, m, sd)
  # 標準化面積反推
  a4 <- qnorm(q2, 0, 1)
  
  return(c(a1, a2, a3, a4))
}


