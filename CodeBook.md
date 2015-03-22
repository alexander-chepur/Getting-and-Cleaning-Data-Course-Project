CodeBook
====================

This document is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data. 

## Task Details

### Original data was downloaded from:

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Summary of Original Data

```
Refer to README.txt file inside above data source for detailed description,
Human Activity Recognition Using Smartphones Dataset Version 1.0

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIR , SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

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
```

###  Transformations
  **Input**: Read the raw file assuming that UCI HAR Dataset subdirectory already present in working directory. 
  **Output**: Tidy Data File "tidy_data.txt"
  
  **Output Variables**
  *For more information on features refer to features_info.txt that came with the original data*

Variable Name | Description
--------------| --------------
Subject | The Subject
Activity | The Activity Label
**Mean of Features with features name containing mean and std in the original data set.** |
tBodyAcc-mean()-X | 
tBodyAcc-mean()-Y | 
tBodyAcc-mean()-Z | 
tGravityAcc-mean()-X | 
tGravityAcc-mean()-Y | 
tGravityAcc-mean()-Z | 
tBodyAccJerk-mean()-X | 
tBodyAccJerk-mean()-Y | 
tBodyAccJerk-mean()-Z | 
tBodyGyro-mean()-X | 
tBodyGyro-mean()-Y | 
tBodyGyro-mean()-Z | 
tBodyGyroJerk-mean()-X | 
tBodyGyroJerk-mean()-Y | 
tBodyGyroJerk-mean()-Z | 
tBodyAccMag-mean() | 
tGravityAccMag-mean() | 
tBodyAccJerkMag-mean() | 
tBodyGyroMag-mean() | 
tBodyGyroJerkMag-mean() | 
fBodyAcc-mean()-X | 
fBodyAcc-mean()-Y | 
fBodyAcc-mean()-Z | 
fBodyAccJerk-mean()-X | 
fBodyAccJerk-mean()-Y | 
fBodyAccJerk-mean()-Z | 
fBodyGyro-mean()-X | 
fBodyGyro-mean()-Y | 
fBodyGyro-mean()-Z | 
fBodyAccMag-mean() | 
fBodyBodyAccJerkMag-mean() | 
fBodyBodyGyroMag-mean() | 
fBodyBodyGyroJerkMag-mean() | 
tBodyAcc-std()-X | 
tBodyAcc-std()-Y | 
tBodyAcc-std()-Z | 
tGravityAcc-std()-X | 
tGravityAcc-std()-Y | 
tGravityAcc-std()-Z | 
tBodyAccJerk-std()-X | 
tBodyAccJerk-std()-Y | 
tBodyAccJerk-std()-Z | 
tBodyGyro-std()-X | 
tBodyGyro-std()-Y | 
tBodyGyro-std()-Z | 
tBodyGyroJerk-std()-X | 
tBodyGyroJerk-std()-Y | 
tBodyGyroJerk-std()-Z | 
tBodyAccMag-std() | 
tGravityAccMag-std() | 
tBodyAccJerkMag-std() | 
tBodyGyroMag-std() | 
tBodyGyroJerkMag-std() | 
fBodyAcc-std()-X | 
fBodyAcc-std()-Y | 
fBodyAcc-std()-Z | 
fBodyAccJerk-std()-X | 
fBodyAccJerk-std()-Y | 
fBodyAccJerk-std()-Z | 
fBodyGyro-std()-X | 
fBodyGyro-std()-Y | 
fBodyGyro-std()-Z | 
fBodyAccMag-std() | 
fBodyBodyAccJerkMag-std() | 
fBodyBodyGyroMag-std() | 
fBodyBodyGyroJerkMag-std() | 


**Steps for Transformation**

  1.  Read and unzip the file "getdata_projectfiles_UCI HAR Dataset.zip" into the "UCI HAR Dataset" sub directory.
  2.  Read following files into seperate Data Tables:
    - subject_test.txt
    - subject_train.txt
    - X_test.txt
    - X_train.txt
    - Y_test.txt
    - Y_train.txt
    - features.txt
    - activity_labels.txt
  3. Row Bind all the *_test and *_train data into single datatable
  4. Rename X.Train_Test column names with data recieve in features datatable.
  5. Also subset X.Train_Test to contain column name having "mean" and "std" 
  6. Merge data with activity lables.
  7. Save the result tidy data into "tidy_data.txt".