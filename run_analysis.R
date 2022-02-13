#Main Script for the project

# 1. Merges the training and the test sets to create one data set.

library(dplyr)

#training set
traindata<-read.csv("./train/X_train.txt",sep = "", header = FALSE)
testdata<-read.csv("./test/X_test.txt",sep = "", header = FALSE)
mergedata<-rbind(traindata,testdata)

#Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
subject_train<-read.csv("./train/subject_train.txt",sep = "", header = FALSE)
subject_test<-read.csv("./test/subject_test.txt",sep = "", header = FALSE)
mergesubject<-rbind(subject_train,subject_test)

#training labels
labels_train<-read.csv("./train/y_train.txt",sep = "", header = FALSE)
labels_test<-read.csv("./test/y_test.txt",sep = "", header = FALSE)
mergelabels<-rbind(labels_train,labels_test)

#Features
features <- read.csv("features.txt", sep = "", header = FALSE)[2]

#Activity
activity <- read.csv("activity_labels.txt", sep = "", header = FALSE)

#get the names from features and assign it to merged data
#,1 is used as the names are in the first column
names(mergedata) <- features[,1]

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
mergedata <- mergedata[ grepl("std|mean", names(mergedata), ignore.case = TRUE) ]


#3. Uses descriptive activity names to name the activities in the data set
#Descriptive ActivityName analysis
mergelabels <- merge(mergelabels, activity, by.x = "V1", by.y = "V1")[2]
mergedata <- cbind(mergesubject, mergelabels, mergedata)

#4. Appropriately labels the data set with descriptive variable names.
names(mergedata)[1:2] <- c("SubjectID", "Activity")

#5. From the data set in step 4, creates a second,
#   independent tidy data set with the average of each variable for each activity and each subject.
## Tidying mergedSet
Final_data<-group_by(mergedata, SubjectID, Activity) %>%
  summarise_each(funs(mean))

Final_data
