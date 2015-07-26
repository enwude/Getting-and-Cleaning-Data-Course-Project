# Author: Ejike Nwude
# Date: 7/26/2015

#Load relevant libraries
library(dplyr)
library(data.table)

# Create working directory if necessary
if(!file.exists("~/Data/")){
        dir.create("~/Data/")
}

# Download and unzip the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "~/Data/Dataset.zip")
unzip(zipfile = "~/data/Dataset.zip", exdir = "~/data")

# Set working directory
datasetPath <- "~/data/UCI HAR Dataset/"
setwd(datasetPath)

# Read test data
# subjectTest: stores test data for subjects performing the various activities
# xTest: stores data for test sets for the experiments
# yTest: stores data for the test activities undertaken by each subject
subjectTest <- tbl_df(read.table(file.path(datasetPath, "test", "subject_test.txt")))
xTest <- tbl_df(read.table(file.path(datasetPath, "test", "X_test.txt")))
yTest <- tbl_df(read.table(file.path(datasetPath, "test", "y_test.txt")))

# Read train data
# subjectTrain: stores train data for subjects performing the various activities
# xTest: stores data for train sets for the experiments
# yTest: stores data for the train activities undertaken by each subject
subjectTrain <- tbl_df(read.table(file.path(datasetPath, "train", "subject_train.txt")))
xTrain <- tbl_df(read.table(file.path(datasetPath, "train", "X_train.txt")))
yTrain <- tbl_df(read.table(file.path(datasetPath, "train", "y_train.txt")))

# Read features and activity labels
featuresData <- tbl_df(read.table(file.path(datasetPath, "features.txt"), header = FALSE))
activityLabel <- tbl_df(read.table(file.path(datasetPath, "activity_labels.txt")))

# Combine test and train subjects, labels and sets
xData <- bind_rows(xTrain, xTest)
yData <- bind_rows(yTrain, yTest)
subjectData <- bind_rows(subjectTrain, subjectTest)

# Rename variables
names(yData) <- c("Activity")
names(subjectData) <- c("Subject")
names(xData) <- featuresData$V2

# Merge data into one dataset
mergedData <- bind_cols(subjectData, yData, xData)

# Extract Mean and Standard Deviation variable headers
featuresMeanStd <- featuresData[grep("mean\\(\\)|std\\(\\)", featuresData$V2), ]

# Extract Subject, Activity, Mean and Standard Deviation Variables
mean.std.data <- mergedData[, c(1, 2, featuresMeanStd$V1+2)]

# Rename activities in dataset with descriptive names
mean.std.data <- mutate(mean.std.data, Activity = factor(mean.std.data$Activity, labels = activityLabel$V2))

# Rename features variables in dataset with descriptive names
names(mean.std.data) <- gsub("^t", "time", names(mean.std.data))
names(mean.std.data) <- gsub("^f", "frequency", names(mean.std.data))
names(mean.std.data) <- gsub("Acc", "Accelerometer", names(mean.std.data))
names(mean.std.data) <- gsub("Gyro", "Gyroscope", names(mean.std.data))
names(mean.std.data) <- gsub("Mag", "Magnitude", names(mean.std.data))
names(mean.std.data) <- gsub("BodyBody", "Body", names(mean.std.data))

# Create independent tidy data set
write.table(mean.std.data, file = "tidyData.txt",row.name=FALSE)