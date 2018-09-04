col_means_std <- function(){

	source("merge_test.R")
	source("merge_train.R")

	all_data <- merge(merge_test(),merge_train(),all=TRUE)

	means <- colMeans(all_data,na.rm=TRUE)

	sds <- apply(all_data,2,sd,na.rm=TRUE)
	
	means_and_sds <- data.frame(means,sds)

	means_and_sds
}