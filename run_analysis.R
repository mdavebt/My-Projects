run_analysis <- function(n=sub_test_df,m=sub_train_df){
	
	install.packages("reshape2")
	library(reshape2)

	source("merge_test.R")
	source("merge_train.R")

	rows_train_data <- nrow(merge_train())
	rows_test_data <- nrow(merge_test())

	rows_train_subject <- nrow(train_subject_df())
	rows_test_subject <- nrow(test_subject_df())
	
	rows_train_label <- nrow(train_labels_df())
	rows_test_label <- nrow(test_labels_df())

	repeat_train <- rows_train_data/rows_train_subject
	repeat_test <- rows_test_data/rows_test_subject

	rep_train_subject <- rep(train_subject_df()$subject,repeat_train)
	rep_test_subject <- rep(test_subject_df()$subject,repeat_test)


	rep_train_label <- rep(train_labels_df()$label,repeat_train)
	rep_test_label <- rep(test_labels_df()$label,repeat_test)

	new_train_df <- data.frame(subject = rep_train_subject,label=rep_train_label ,merge_train())

	new_test_df <- data.frame(subject = rep_test_subject,label=rep_test_label ,merge_test())

	all_data <- merge(new_train_df,new_test_df,all=TRUE)

	meltdata <- melt(all_data,id.vars = c("subject","label"))

	dcastdata <- dcast(meltdata,subject ~ variable,fun.aggregate=mean,na.rm=TRUE)
	head(dcastdata)
	
}