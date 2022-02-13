#README for project

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Notes:
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

The run_analysis.R project is the file  where the code for project is  provided.

#Data for the project
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Project https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
Create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#####Step 1. Merges the training and the test sets to create one data set.
Read the data files and then  merge data from test and train,  X_train.txt and X_test.txt using rbind and create the dataframe mergedata.

Read  and merge data files , subject_train.txt and subject_test.txt . This is more like subject IDs who performed the activity.  Create the mergesubject dataframe by merging data files from both subject_train.txt and subject_test.txt.

Read and merge data files ,  labels_train.txt and labels.test.txt. This is the  label of the activity done. For example: if it says 5 then the activity done by subject ID is STANDING.

Read features.txt and activity_labels.txt too. features.txt includes all the types of measurements recorded.

activity_labels.txt include label names for all activities done.

Get the names of all measurements from features.

######Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
Use grepl to search all measuremets names with "std"(standard deviation)  and "mean"" in the names.


######Step 3.Uses descriptive activity names to name the activities in the data set
Merge labels with  activity names. Now merge the measurements with activity and subject ID.
I have used cbind so that all the data is merged column wise. That way for every subject ID we can view all the measurements & activity with labels.

#######Step 4. Appropriately labels the data set with descriptive variable names.
Add the column names PersonID and  Activity to the first two columns so that  all columns have names.

######Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A new tidy dataset called Final_data is created.




