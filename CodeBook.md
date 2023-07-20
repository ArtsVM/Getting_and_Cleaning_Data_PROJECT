# CodeBook

## Dataset Information

The dataset used in this analysis is the Human Activity Recognition Using Smartphones (HAR) dataset. This dataset contains measurements from wearable smartphones sensors during different activities performed by subjects. The goal is to clean the data, extract only the relevant measurements, and generate a tidy dataset with the average of each variable for each activity and each subject.

## Data Source

The data is downloaded from the following URL:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Data Cleaning Steps

1. Merged the training and test datasets to form a unified dataset.

2. Retained only the measurements related to the mean and standard deviation for each measurement.

3. Utilized descriptive activity names to label the activities in the dataset.

4. Appropriately assigned descriptive variable names to the dataset.

5. Generated a separate and organized tidy dataset by calculating the average of each variable for each activity and each subject from the dataset obtained in step 4.

## Variables Description

The variables in the tidy dataset are as follows:

- `SubjectNum`: An identifier of the subject who performed the activity. It is of the `factor` data type.

- `Activity`: The type of activity performed by the subject. It is of the `factor` data type with descriptive activity names.

The remaining columns represent the average of each variable for each activity and each subject. The variable names are self-explanatory and follow the naming conventions described in the original HAR dataset documentation.

## Transformations

1. Loaded the required packages: `data.table` and `reshape2`.

2. Downloaded and extracted the HAR dataset from the provided URL.

3. Merged the training and test datasets.

4. Extracted only the relevant measurements related to the mean and standard deviation.

5. Assigned descriptive activity names to the dataset.

6. Generated a tidy dataset with the average of each variable for each activity and each subject.

7. Exported the tidy dataset as a text file named "tidyData.txt" using the `data.table::fwrite()` function.

## Acknowledgements

The original data and more information about the Human Activity Recognition Using Smartphones (HAR) dataset can be found at:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

This data was provided by the UCI Machine Learning Repository and was collected for the paper:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Jorge L. Reyes-Ortiz. "A Public Domain Dataset for Human Activity Recognition Using Smartphones." 21st European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning. ESANN, 2013.