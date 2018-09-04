install.packages("plyr")
library(plyr)

download_files <- function(){
	download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip")
}

unzip_files <- function(filename = NULL){
	filename <- "Dataset.zip"
	unzip_files <- unzip(filename)
}