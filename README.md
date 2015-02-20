# GCD-Course_Project
Getting and Cleaning Data Course Project

 Per the course project instructions, the R script called run_analysis.R does the following:

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The data

The data is composed of two index files (activity_labels.txt and features.txt), three training files and three test files. 

### The index files

* **features.txt** -- this file contains the datasets 561 variable names, each corresponding to a variable column in the x_*.txt files. 
* **activity_labels.txt** -- this file contains the six activity names, which correspond to the observations in the y_*.txt files. 

### the test and training files

* **subject_test.txt and subject_train.txt** -- these files identify the subjects associated with each observation in the x_*.txt and y_*.txt files.
* **x_test.txt and x_train.txt** -- these files contain the collected (summarised) observations of the phone's measurements.
* **y_test.txt and y_train.txt** -- these files contain the activity of each observation in the x_*txt files. 

## How the script works


## Breakdown of names
* t and f - time and fourier transformed frequency domain signals
* body and gravity - body or gravity created acceleration signals
* Acc and Gyro - accelerometer or gyroscope signal
* Jerk - signals related to acceleration of acceleration
* Mag - magnitude of the three dimensional signals

## Code Book 

### Additional Variable Information

### Summary Choices Made

### Experimental Study Design
