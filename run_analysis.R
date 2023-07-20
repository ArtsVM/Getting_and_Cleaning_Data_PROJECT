## This R Script, developed in version 4.3.1, accomplishes the Getting and 
## Cleaning Data Project for John Hopkins. 
## The script implements a series of data cleaning steps as follows:
##        
## 1. Combines the training and test datasets to form a unified dataset.
## 2. Retains only the measurements related to the mean and standard deviation 
##    for each measurement.
## 3. Utilizes descriptive activity names to label the activities in the dataset.
## 4. Appropriately assigns descriptive variable names to the dataset.
## 5. Generates a separate and organized tidy dataset by calculating the average
##    of each variable for each activity and subject from the dataset obtained 
##    in step 4.

## STEP 1.
## Load necessary packages
library("data.table")
library("reshape2")

## Set up a temporary directory for data download
workingDir <- getwd()
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## Download and extract data
download.file(dataUrl, file.path(workingDir, "dataFiles.zip"))
unzip(zipfile = file.path(workingDir, "dataFiles.zip"), exdir = workingDir)

## STEP 2.
## Load activity labels and features - fread() in data.tables R package.
activityData <- fread(file.path(workingDir, "UCI HAR Dataset/activity_labels.txt"),
                      col.names = c("activityCode", "activityName"))
featuresData <- fread(file.path(workingDir, "UCI HAR Dataset/features.txt"),
                      col.names = c("featureIndex", "featureName"))
selectedFeatures <- grep("(mean|std)\\(\\)", featuresData[, featureName])
selectedMeasurements <- featuresData[selectedFeatures, featureName]

## Removing parentheses (both open and close) from the selectedMeasurements vector.
selectedMeasurements <- gsub('[()]', '', selectedMeasurements)

## STEP 3.
# Load training datasets
trainData <- fread(file.path(workingDir, "UCI HAR Dataset/train/X_train.txt"))[, selectedFeatures, with = FALSE]
data.table::setnames(trainData, colnames(trainData), selectedMeasurements)
trainActivities <- fread(file.path(workingDir, "UCI HAR Dataset/train/Y_train.txt"),
                         col.names = c("Activity"))
trainSubjects <- fread(file.path(workingDir, "UCI HAR Dataset/train/subject_train.txt"),
                       col.names = c("SubjectNum"))
trainData <- cbind(trainSubjects, trainActivities, trainData)

## STEP 4.
# Load test datasets
testData <- fread(file.path(workingDir, "UCI HAR Dataset/test/X_test.txt"))[, selectedFeatures, with = FALSE]
data.table::setnames(testData, colnames(testData), selectedMeasurements)
testActivities <- fread(file.path(workingDir, "UCI HAR Dataset/test/Y_test.txt"),
                        col.names = c("Activity"))
testSubjects <- fread(file.path(workingDir, "UCI HAR Dataset/test/subject_test.txt"),
                      col.names = c("SubjectNum"))
testData <- cbind(testSubjects, testActivities, testData)

## STEP 5.
# Merge datasets
combinedData <- rbind(trainData, testData)

# Convert Activity column to factors
combinedData[, Activity := factor(Activity, levels = activityData[["activityCode"]], labels = activityData[["activityName"]])]

# Convert SubjectNum column to factors
combinedData[, SubjectNum := as.factor(SubjectNum)]

# Calculate the average of each variable for each activity and subject
tidyData <- combinedData[, lapply(.SD, mean), by = .(SubjectNum, Activity)]

# Write the tidy data to a file
data.table::fwrite(x = tidyData, file = "tidyData.txt", quote = FALSE)
