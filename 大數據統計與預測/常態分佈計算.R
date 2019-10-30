# 普瓦松


# 常態分布
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

pois <- function(q, p, lambda){
  a1 <- ppois(q, lambda, lower.tail = TRUE)
  a2 <- ppois(q, lambda, lower.tail = FALSE)
  a3 <- qpois(p, lambda, lower.tail = TRUE)
  a4 <- qpois(p, lambda, lower.tail = FALSE)
}


