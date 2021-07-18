random_digits <- sample(12345678:17345678, 20, replace=FALSE) # 8digits random numberws
random_digits2 <- sample(34567:44567, 20, replace=FALSE) # 5 digit numbers 
random_digits2 <- paste0("000",random_digits2) #adding trailing zeros
total_digits = c(random_digits,random_digits2) #combining lists
total_digits <- sample(total_digits) #randomize
indices <- seq(1,length(total_digits),1) #extract indices
combine <- rbind(total_digits,indices)
data <- data.frame(indices,total_digits)