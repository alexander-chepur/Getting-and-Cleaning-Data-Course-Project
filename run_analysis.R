###
# run_analysis.R -- Getting and Cleaning Data Course Project
#
# This script creates tidy dataset for Human Activity Recognition database 
# built from the recordings of 30 subjects performing activities of daily 
# living (ADL) while carrying a waist-mounted smartphone with embedded inertial 
# sensors. 
#

###
# Libraries used
#

library("reshape2")

###
# Step 1 : Merge training and test data set to create a single data set
#

## Reading test data
cat("Reading test data...")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
cat("Done.")

## Reading train  data
cat("Reading train  data...")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                       header = FALSE)
cat("Done.")

## Reading 6 by 2 dataframe of activity names
activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                           header = FALSE, stringsAsFactors = FALSE)

## Reading names of features and creating features list
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, 
                     stringsAsFactors = FALSE)
features <- features[,2]

## Mereging the two data sets 
cat("Merging the test and train data...")
subjects <- rbind(subj_test, subj_train)
activity <- rbind(y_test, y_train)
merged_1 <- merge(x_test, x_train, all = TRUE, sort = FALSE)
merged <- cbind(subjects, activity, merged_1)
rm(merged_1)
colnames(merged) <- c("Subjects", "Activity", features)
cat("Done.")

###
# Step 2 : Extracting Mean value and Standard deviation
#
cat("Extracting Mean value and Standard deviation...")
meancols <- grep("mean()", colnames(merged), fixed = TRUE)
stdcols <- grep("std()", colnames(merged), fixed = TRUE)

merged_with_mean_std <- merged[, c(1, 2, meancols, stdcols)]

melted <- melt(merged_with_mean_std, id.var = c("Subjects", "Activity"))
means <- dcast(melted , Subjects + Activity ~ variable, mean)

## Uses descriptive activity names to name the activities in the data set
for (i in seq(means[,2])) { 
        means[i,2]<- activity_names[means[i,2],2]   
}

###
# Step 4 : write the tidy ds meansdf in a textfile & cvs file
#
cat("Writing the tidy data to file tidy_data.txt...")
write.table(means, file = "tidy_data.txt", row.names = FALSE, sep=",")
cat("All done.")
