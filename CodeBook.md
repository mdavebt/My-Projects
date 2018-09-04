##Code Book

##Functions
1. download.R - for downloading the zipped files
	#Variables used
	1. download.file for downloading files
	2. unzip_files for unzipping files
		
2. understanding.R - for collecting data
	#Variables used
	1. variable_df for names variable
	2. train_data_df for train data frame
	3. test_data_df for test data frame
	4. test_subjest_df for test subject data frame
	5. train_subject_df for train subject data frame
	6. train_labels_df for train labels
	7. test_labels_df for test labels

3. merge.R - for merging the data and making it tidy
	#Variables used
	1. df_names for names variables
	2. dup_names for duplicate names
	3. dup_vector for duplicate names vector
	4. dup_vector_length for length of duplicate names vector
	5. sub_test_df for subset of test data
	6. sub_test_1 for subset of test data
	7. sub_test_2 for subset of test data
	8. dup_names_1 for subset of duplicate names
	9. dup_names_2 for subset of duplicate names
	10. unique_names for uniques duplicate names vector
	11. sub_test_df for merge data frame
	12. dup_names_1 for sequence 1
	13. dup_names_2 sequence 2
	14. sorted_unique_names for names sorted vector

4. col_means_std.R for extracting means and standard deviation of columns
	#Variables used
	1. means for means of vector
	2. sds for standard deviation of vector