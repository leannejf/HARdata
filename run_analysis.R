# This script uses the dplyr package
# First download and unzip data for project
#
#dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(dataset_url, "project_data.zip")
#unzip("project_data.zip", exdir = "project_data")
#
# Read the training and test data sets, label the variables, and combine each with subject identiers and activity labels
library(dplyr)
features <- read.table("project_data/UCI HAR Dataset/features.txt", header = FALSE)
feature_names <- features[, 2]

train <- read.table("project_data/UCI HAR Dataset/train/X_train.txt", header = FALSE, col.names = feature_names)
train_labels <- read.table("project_data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
train_subjects <- read.table("project_data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
trainTotal <- cbind(train_subjects, train_labels, train)

test <- read.table("project_data/UCI HAR Dataset/test/X_test.txt", header = FALSE, col.names = feature_names)
test_labels <- read.table("project_data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_subjects <- read.table("project_data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
testTotal <- cbind(test_subjects, test_labels, test)

# Merge the data tables into one data table
AllData <- rbind.data.frame(trainTotal, testTotal)
colnames(AllData)[1:2] <- c("subject", "activity")
#select only columns with subject, activity, mean and stdev; define activity and subject as factors.
sub1 <- AllData[1:2]
sub2 <- select(AllData, contains('mean'))
sub3 <- select(AllData, contains('std'))
NewData <- cbind.data.frame(sub1, sub2, sub3)
NewData$subject <- as.factor(NewData$subject)
NewData$activity <- as.factor(NewData$activity)
levels(NewData$activity) <- c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying")

# Group the data by activity and subject, then calculatethe mean of each measured variable by activity and subject. 
grouped_data <- group_by(NewData, activity, subject)
HAR_feature_means <- summarize_each(grouped_data, funs(mean))
