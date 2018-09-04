merge_train <- function(){

	source("understanding_data.R")
	install.packages("dplyr")
	library(dplyr)
	
	format_lower <- tolower(variable_name_df())

	df_names <- NULL
	dup_names <- NULL
	dup_vector <- NULL
	dup_vector_length <- NULL
	sub_test_df <- NULL
	sub_test_1 <- NULL
	sub_test_2 <- NULL
	dup_names_1 <- NULL
	dup_names_2 <- NULL
	k <- 1

	for (i in 1:length(format_lower)){	

		df_names[i] <- gsub("\\.","",format_lower[i])
	}

	for (i in 1:length(df_names)){	

		df_names[i] <- gsub("\\(","",df_names[i])
	}

	for (i in 1:length(df_names)){	

		df_names[i] <- gsub("\\)","",df_names[i])
	}

	for (i in 1:length(df_names)){	

		df_names[i] <- gsub(",","",df_names[i])
	}
	for (i in 1:length(df_names)){	

		df_names[i] <- gsub("-","",df_names[i])
	}
	
	merge_test_df <- test_data_df()
	merge_train_df <- train_data_df()

	for (j in 1:length(df_names)){

		dup_names <- which(df_names == df_names[j])

		if(length(dup_names) > 1 ){
			dup_vector <- c(dup_vector,dup_names[-1])
			
		}
	}

	unique_names <- unique(dup_vector)
	
	sub_test_df <- merge_test_df[-unique_names]
	names(sub_test_df) <- df_names[-unique_names]

	sub_train_df <- merge_train_df[-unique_names]
	names(sub_train_df) <- df_names[-unique_names]


	dup_names_1 <- seq(1,length(unique_names),by=2)
	dup_names_2 <- seq(2,length(unique_names),by=2)

	sorted_unique_names <- sort(df_names[unique_names])
	
	sub_train_1 <- merge_train_df[unique_names[dup_names_1]]
	names(sub_train_1) <- df_names[unique_names[dup_names_1]]

	sub_train_2 <- merge_train_df[unique_names[dup_names_2]]
	names(sub_train_2) <- df_names[unique_names[dup_names_2]]

	sub_train_df <- merge(sub_train_df,sub_train_1,all=TRUE)
	sub_train_df <- merge(sub_train_df,sub_train_2,all=TRUE)

	sub_train_df

}