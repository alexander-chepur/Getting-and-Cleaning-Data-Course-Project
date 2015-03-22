Getting and Cleaning Data Course Project
========================================

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

R script called run_analysis.R is used to prepare tidy data for future analysis. It does:

1. Read Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. It should be placed in "UCI HAR Dataset" subdirectory in script working directory.

2. Merges the training and the test sets to create one data set.

3. Extracts only the measurements on the mean and standard deviation for each measurement. 

5. Creates a second, independent tidy data set (tidy.txt) with the average of each variable for each activity and each subject.

Note
-------
Script uses data located in "UCI HAR Dataset" subdirectory in script working directory.