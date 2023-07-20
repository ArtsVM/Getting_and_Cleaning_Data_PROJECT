# Getting and Cleaning Data Project

This repository contains R scripts that accomplish the data cleaning and tidying tasks for the Human Activity Recognition Using Smartphones (HAR) dataset. The goal is to create a tidy dataset that includes the average of each variable for each activity and each subject.

## Dataset

The Human Activity Recognition Using Smartphones (HAR) dataset contains measurements from wearable smartphones sensors during different activities performed by subjects. The data is downloaded and extracted from the following URL:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Scripts

### 1. `download_and_clean_data.R`

This script performs the following steps:

1. Downloads the HAR dataset from the provided URL and extracts it.

2. Combines the training and test datasets to form a unified dataset.

3. Retains only the measurements related to the mean and standard deviation for each measurement.

4. Utilizes descriptive activity names to label the activities in the dataset.

5. Appropriately assigns descriptive variable names to the dataset.

6. Generates a separate and organized tidy dataset by calculating the average of each variable for each activity and each subject from the dataset obtained in step 5.

### 2. `CodeBook.md`

This file serves as a code book that describes the variables, the data, and any transformations or work performed to clean up the data. It provides details on the variables present in the tidy dataset and the steps taken to create it.

## How to Run the Scripts

To run the data cleaning and tidying process, follow these steps:

1. Ensure you have R and RStudio installed on your system (v4.3.1).

2. Clone this repository to your local machine.

3. Open RStudio and set the working directory to the location of the cloned repository.

4. Execute the `download_and_clean_data.R` script. This will download the HAR dataset, clean the data, and generate the tidy dataset as "tidyData.txt" in the working directory.

## Acknowledgements

The original data and more information about the Human Activity Recognition Using Smartphones (HAR) dataset can be found at:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

This data was provided by the UCI Machine Learning Repository and was collected for the paper:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Jorge L. Reyes-Ortiz. "A Public Domain Dataset for Human Activity Recognition Using Smartphones." 21st European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning. ESANN, 2013.
