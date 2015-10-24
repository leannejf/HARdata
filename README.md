## About the Data Set 
The data set used in this project was downloaded from the following 
URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
As described on the website (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), 
the data are results of experiments carried out with a group of 30 volunteers between the 
ages of 19 and 48. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on their waist. Through the 
phone’s embedded accelerometer and gyroscope, the investigators captured 3-axial linear acceleration 
and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label 
the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the 
volunteers was selected for generating the training data and 30% the test data. 

Please see the files contained in the original dataset for information about the original data not 
covered here. Files included with the dataset are:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

## About This Project
The project instructions given were as follows:
“You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average 
of each variable for each activity and each subject.”

## My approach and interpretation:
When the original data is downloaded and unzipped into the working R directory, the 
“run_analysis.R” script I created for this project does the following:
Reads the features into a table and extracts the feature names to a vector.
The training and the test data files ('train/X_train.txt' and 'test/X_test.txt') are then 
each read into a table, specifying the feature names to be added as column names. 
The activities coded in the label files (‘train/y_train.txt’ and ‘test/y_test.txt’) and the 
subject identifiers (‘train/subject_train.txt’ and ‘test/subject_test.txt’) are each read 
into data tables and they are added as columns to the training and test tables.
The resulting two tables are then combined (using rbind()) and column names are added to 
the subject and activity columns.
Three subsets of this larger dataset were then created containing: 1) two columns with the 
subjects and activities, 2) a data table with all of the columns that contained ‘mean’ in 
the name, and 3) a data table with all of the columns that contained ‘std’ in the name.
These three data tables were then combined to create a new data set containing only the 
measurements on the mean and standard deviation for each measurement and the subject and 
activity identifiers (88 variables).
Subject and activity were then identified as factors and the activity codes (levels) were 
replaced with the activity names as specified in ‘activty_labels.txt’.
The data table was then grouped, first by activity and then subject, and the means of all 
variables were obtained for each group (for each activity by subject). With six activities 
and 30 subjects, the final table (HAR_feature_means) contains 180 rows.
