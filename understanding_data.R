variable_name_df <- function(){
	variable_df <- read.table("UCI HAR Dataset/features.txt")
	variable_df[,2]
}

train_data_df <- function(){
	data_train <- read.table("UCI HAR Dataset/train/X_train.txt")	
	data_train
}

train_subject_df <- function(){
	subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
	names(subject_train) <- "subject"
	subject_train
}

test_data_df <- function(){
	data_test <- read.table("UCI HAR Dataset/test/X_test.txt")
	data_test
}

test_subject_df <- function(){
	subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
	names(subject_test) <- "subject"
	subject_test
}

train_labels_df <- function(){
	labels_train <- read.table("UCI HAR Dataset/train/y_train.txt")
	names(labels_train) <- "label"
	labels_train
}

test_labels_df <- function(){
	labels_test <- read.table("UCI HAR Dataset/test/y_test.txt")
	names(labels_test) <- "label"
	labels_test
}
