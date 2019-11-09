input_list <- function(num) {
  l = c()
  for (i in range(num)) {
    question <- as.integer(readline(prompt="Enter number as numerical list: "))
    l <- append(l, question)
  
  return(l)
}



# numerical list to percent
list2percent <- function(list){
  output = 100*list/sum(list)
  cum = 100*cumsum(list)/sum(list)
  cat('Percentage :',output, '\n')
  cat('Cumulative percentage :',cum)
}
