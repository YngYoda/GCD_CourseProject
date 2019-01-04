# CODEBOOK 

# This is a Markdown file describing the entire process of getting and cleaning the data.

==================================================================

##The Link to the Dataset obtained is in the ReadMe.md file

The goal of the Project is to get and clean the dataset provided.

This codebook explains all the processes that went in from intially getting all the required data files
to finally getting a cleaned and tidy data file

The data contains various text files, each filled with sensor measurements.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


The first 2 columns are the data identifiers which describe
1.The Subject - The subject Identification
2.The Activity - The type of activity being performed by the subject

##The Measurements include mean and standard deviation of accelerometer and gyro measurements
##for various movements. They are totally 66 selected cases namely:

tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tGravityAccStdX
tGravityAccStdY
tGravityAccStdZ
tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyAccJerkStdX
tBodyAccJerkStdY
tBodyAccJerkStdZ
tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroStdX
tBodyGyroStdY
tBodyGyroStdZ
tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyGyroJerkStdX
tBodyGyroJerkStdY
tBodyGyroJerkStdZ
tBodyAccMagMean
tBodyAccMagStd
tGravityAccMagMean
tGravityAccMagStd
tBodyAccJerkMagMean
tBodyAccJerkMagStd
tBodyGyroMagMean
tBodyGyroMagStd
tBodyGyroJerkMagMean
tBodyGyroJerkMagStd
fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccStdX
fBodyAccStdY
fBodyAccStdZ
fBodyAccMeanFreqX
fBodyAccMeanFreqY
fBodyAccMeanFreqZ
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyAccJerkStdX
fBodyAccJerkStdY
fBodyAccJerkStdZ
fBodyAccJerkMeanFreqX
fBodyAccJerkMeanFreqY
fBodyAccJerkMeanFreqZ
fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyGyroStdX
fBodyGyroStdY
fBodyGyroStdZ
fBodyGyroMeanFreqX
fBodyGyroMeanFreqY
fBodyGyroMeanFreqZ
fBodyAccMagMean
fBodyAccMagStd
fBodyAccMagMeanFreq
fBodyBodyAccJerkMagMean
fBodyBodyAccJerkMagStd
fBodyBodyAccJerkMagMeanFreq
fBodyBodyGyroMagMean
fBodyBodyGyroMagStd
fBodyBodyGyroMagMeanFreq
fBodyBodyGyroJerkMagMean
fBodyBodyGyroJerkMagStd
fBodyBodyGyroJerkMagMeanFreq

##The Activity Labels are:

1.WALKING: subject was walking during the test
2.WALKINGUPSTAIRS: subject was walking up a staircase during the test
3.WALKINGDOWNSTAIRS: subject was walking down a staircase during the test
4.SITTING: subject was sitting during the test
5.STANDING: subject was standing during the test
6.LAYING: subject was laying down during the test


==================================================================
#The Work done to clean the data includes:

##Step 1:
First we import the necessary libraries required. I used dplyr and reshape2 for efficient filtering 
##Step 2:
Next, we read the data files containing the training and testing data and the activity labels
##Step 3:
We merge the training and testing data, the labels & the subject datasets
##Step 4:
-For extracting the Mean & Standard Deviation of each measurement, we first use the "grep"
 fucntion to extract the names containg mean and std from the features file
-Then we get the indices of the columns containing the required features and extract only 
 those columns from the merged dataset(of step 3)
-we change any spacing and convert the headers to lower case while keeping the first letter of 
 the mean and std uppercase
##Step 5:
Next we name the activities of the dataset using the numbers 1-6 as reference and name the 
activities with their descriptive names.
##Step 6:
Next we add the subject variables to the data and bind the data.This gives us the total cleaned 
data stored in totaldata_cleaned.txt
##Step 7:
We convert the header strings to factors
Now we use reshape to melt and recast the data frame such that the mean is calculated for each measurement
This new data set is written to mean_totaldata.txt.
















