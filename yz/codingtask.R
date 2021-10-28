library(readr)
ed_notes <- read_delim("R---DSI/Notes/ED_Notes2016_18.txt",n_max=1500000,"!", escape_double = FALSE, trim_ws = TRUE)
cleanFun <- function(htmlString) {return(gsub("<.*?>", "", htmlString))}

cleanFun2 <- function(htmlString) {return(gsub("&nbsp;|&#183;", " ", htmlString))}

cleanFun3 <- function(htmlString) {return(gsub(".*?>|<span*.", "", htmlString))}

ed_notes$clean_text <- cleanFun(ed_notes$`TEXT~`)
ed_notes$clean_text <- cleanFun2(ed_notes$clean_text)
ed_notes$clean_text <- cleanFun3(ed_notes$clean_text)

library(stringr)

#take out special characters
ed_notes$clean_text <- str_replace_all(ed_notes$clean_text, "[^[:alnum:]]", " ")

#convert to lower
ed_notes$clean_text <- tolower(ed_notes$clean_text)

z = ed_notes$clean_text
digits <- str_extract_all(z[0:1500000], "\\d{8}")
str.matches <- gregexpr("[1-9]{8}", digits)
index_8digits <- which(str.matches %in% 1)
list_of_all_8digitnumbers <- digits[index_8digits]