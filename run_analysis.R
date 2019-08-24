setwd("~./Course 3 project")
filename <- "Coursera_Project.zip"
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename)
} 
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}
library(dplyr);library(tidyr);
features <- read.table("UCI HAR Dataset/features.txt",col.names = c("n", "features"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt",col.names =  c("code","activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "subject")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$features)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$features)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

bind_rows(x_train,x_test)
bind_rows(y_train,y_test)
bind_rows(subject_test,subject_train)
Merged<- bind_cols(bind_rows(subject_test,subject_train),bind_rows(y_train,y_test),bind_rows(x_train,x_test))
Merged<-tbl_df(Merged)

Merged2<- Merged %>%
        select(subject,code,contains("mean"),contains("std"))
Merged2$code <- activities[Merged2$code,2]

Merged2<-Merged2 %>% 
        rename(activity = code)
names(Merged2)<-gsub("Acc", "Accelerometer", names(Merged2))
names(Merged2)<-gsub("Gyro", "Gyroscope", names(Merged2))
names(Merged2)<-gsub("Mag", "Magnitude", names(Merged2))
names(Merged2)<-gsub("^t", "Time", names(Merged2))
names(Merged2)<-gsub("BodyBody", "Body", names(Merged2))
names(Merged2)<-gsub("^f", "Frequency", names(Merged2))
names(Merged2)<-gsub("-mean()", "Mean", names(Merged2), ignore.case = TRUE)
names(Merged2)<-gsub("-std()", "STD", names(Merged2), ignore.case = TRUE)
names(Merged2)<-gsub("-freq()", "Frequency", names(Merged2), ignore.case = TRUE)
names(Merged2)<-gsub("angle", "Angle", names(Merged2))
names(Merged2)<-gsub("gravity", "Gravity", names(Merged2))

Final<- Merged2 %>%
        group_by(activity,subject)%>%
        summarize_all(funs(min))












