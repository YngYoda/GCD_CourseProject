# README

==================================================================

## Set working data was ~/Documents/RStudio/datasciencecoursera/UCI HAR Dataset/
Run the run_analysis.R file in R

## While reading the txt files use read.table(..., header = TRUE)

The DataSet is provided by UCI Machine Learning Repository.
WebLink -> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
DataLink -> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================

# The Work to be done as prescribed:
## 1.
Merges the training and the test sets to create one data set.
## 2.
Extracts only the measurements on the mean and standard deviation for each measurement.
## 3.
Uses descriptive activity names to name the activities in the data set
## 4.
Appropriately labels the data set with descriptive variable names.
## 5.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


==================================================================

# The Work done to clean the data includes:
## Step 1:
First we import the necessary libraries required. I used dplyr and reshape2 for efficient filtering 
## Step 2:
Next, we read the data files containing the training and testing data and the activity labels
## Step 3:
We merge the training and testing data, the labels & the subject datasets
## Step 4:
-For extracting the Mean & Standard Deviation of each measurement, we first use the "grep"
 fucntion to extract the names containg mean and std from the features file
-Then we get the indices of the columns containing the required features and extract only 
 those columns from the merged dataset(of step 3)
-we change any spacing and convert the headers to lower case while keeping the first letter of 
 the mean and std uppercase
## Step 5:
Next we name the activities of the dataset using the numbers 1-6 as reference and name the 
activities with their descriptive names.
## Step 6:
Next we add the subject variables to the data and bind the data.This gives us the total cleaned 
data stored in totaldata_cleaned.txt
## Step 7:
We convert the header strings to factors
Now we use reshape to melt and recast the data frame such that the mean is calculated for each measurement
This new data set is written to mean_totaldata.txt.
