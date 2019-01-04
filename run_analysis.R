#Import Libraries required
library(dplyr)
library(reshape2)

#Read Activity Labels and Features data
labels <- read.table("~/RStudio/datasciencecoursera/UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("~/RStudio/datasciencecoursera/UCI HAR Dataset/features.txt", header = FALSE)
features = subset.data.frame(features, select = V2)

#Read Test Data
Xtest <- read.table("~/RStudio/datasciencecoursera/UCI HAR Dataset/test/X_test.txt", header = FALSE)
Ytest <- read.table("~/RStudio/datasciencecoursera/UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("~/RStudio/datasciencecoursera/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

#Read Train Data
Xtrain <- read.table("~/RStudio/datasciencecoursera/UCI HAR Dataset/train/X_train.txt", header = FALSE)
Ytrain <- read.table("~/RStudio/datasciencecoursera/UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("~/RStudio/datasciencecoursera/UCI HAR Dataset/train/subject_train.txt", header = FALSE)

#To convert the factor to string type
features %>% mutate_if(is.factor, as.character) -> features

#Transpose the features vector
features <- t(features) 

#Step 1: Merges the training and the test sets to create one data set.
#Bind Training and Testing Data
Xdata <- rbind(Xtrain,Xtest)
names(Xdata) <- features

#Bind Training and Testing Labels
Ydata <- rbind(Ytrain,Ytest)

#Bind Subject data
Subdata <- rbind(subject_train,subject_test)

#Step 2
#Extracts only the measurements on the mean and standard deviation for each measurement.
indices_features <- grep("-mean\\(\\)|-std\\(\\)" , features)
Xdata <- Xdata[,indices_features]
names(Xdata) <- gsub("\\(|\\)", "", names(Xdata))
names(Xdata) <- tolower(names(Xdata))
names(Xdata) <- gsub("mean", "Mean", names(Xdata)) 
names(Xdata) <- gsub("std", "Std", names(Xdata)) 



#Step 3
#Uses descriptive activity names to name the activities in the data set
Ylabels <- labels[Ydata[, 1], 2]
labels[,2] <- toupper(gsub("_", "", labels[,2]))
Ydata[, 1] <- Ylabels
names(Ydata) <- "The_Activity"


#Step 4
#Appropriately labels the data set with descriptive variable names.
names(Subdata) <- "The_Subject"
totaldata <- cbind(Subdata, Ydata, Xdata)

#Write the cleaned data to a new file 
write.table(totaldata, "totaldata_cleaned.txt")

#Step 5
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
totaldata$The_Subject <- as.factor(totaldata$The_Subject)
totaldata$The_Activity <- as.factor(totaldata$The_Activity)
totaldata.melted <- melt(totaldata, id = c('The_Subject', 'The_Activity'))
totaldata.mean <- dcast(totaldata.melted, The_Subject + The_Activity ~ variable, mean)

#Write to file
write.table(totaldata.mean, "mean_totaldata.txt", row.names = FALSE, quote = FALSE)



















