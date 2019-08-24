# Code Book
## variables 
* features <- features.txt : 
The features selected for this database.
* activities <- activity_labels.txt : 
List of activities performed when the corresponding measurements.
*subject_test <- test/subject_test.txt : 
contains test data of test subjects being observed
* x_test <- test/X_test.txt : 
contains recorded features test data
* y_test <- test/y_test.txt : 
contains test data of activities’code labels
* subject_train <- test/subject_train.txt : 
contains train data of subjects being observed
* x_train <- test/X_train.txt : 
contains recorded features train data
* y_train <- test/y_train.txt : 
contains train data of activities’code labels

## Merges the training and the test sets to create one data set.
* using bind_rows() function to bind x_train with x_test, y_train with y_test and subject_train with subject_test  respectively
* using bind_cols() function to merge three binded tables together and formed a table called Merged

## Extracts only the measurements on the mean and standard deviation for each measurement.
* using select() function from dplyr package to select columns which contain "mean" and "std"

## Uses descriptive activity names to name the activities in the data set
* matching the code with names that provided in activity table

## Appropriately labels the data set with descriptive variable names.
* using gsub() function to replecate following names:
* "Acc", "Accelerometer"; "Mag", "Magnitude"; "^t", "Time";"BodyBody", "Body";"Gyro", "Gyroscope";
* "^f", "Frequency" ; "-mean()", "Mean"; "-std()", "STD";"gravity", "Gravity"; "angle", "Angle"; "-freq()", "Frequency"

## Find average of each variable for each activity and each subject.
* using group_by() function from dplyr package wo group up activity and subject
* using summarize_all() function from dplyr and func(mean) to find mean

## Export final data
* using write.table() function to do it.
