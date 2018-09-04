##Given Data

## Data
1. The zipped files were downloaded to a folder
2. The train and test subjects were extracted from "subject_train.txt" and "subject_test.txt" respective files
3. The names for the test and train data were extracted from "features.txt" file
4. Data was extrated from X_train.txt and X_test.txt
5. Activities were extracted from y_train.txt and y_test.txt

##Method
1. There were duplicate names in the files so those columns were merged into one column to get tidy data.
2. Means and Standard Deviation were calculated using colMeans and apply function
3. The data was split to get average for each activity and person