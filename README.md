# GCD-Course_Project
Getting and Cleaning Data Course Project

This set of files was created to fulfill the requirements of the Getting and Cleaning Data course on https://www.coursera.org/.

Project instructions:

>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

>Here are the data for the project:

>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


 Per the course project instructions, the R script called run_analysis.R does the following:

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The raw data

The raw data used is composed of two index files (activity_labels.txt and features.txt), three training files and three test files. The test and train files actually contain summarised and transformed data from the original accelerometer and gyroscope readings - which are also contained in the zipped UCI container under the Inertial Signals subfolders. 

### The index files

* **features.txt** -- this file contains the datasets 561 variable names, each corresponding to a variable column in the x_*.txt files. 
* **activity_labels.txt** -- this file contains the six activity names, which correspond to the observations in the y_*.txt files. 

### the test and training files

* **subject_test.txt and subject_train.txt** -- these files identify the subjects associated with each observation in the x_.txt and y_.txt files.
* **x_test.txt and x_train.txt** -- these files contain the collected (summarised) observations of the phone's measurements.
* **y_test.txt and y_train.txt** -- these files contain the activity of each observation in the x_*txt files. 

## How the script works

This script was written in R version 3.1.1 using the dplyr package version 0.4.1 on a Mac running OSX 10.10.2.

The script assumes that the user has unzipped the UCI HAR Dataset, that it is in the current working directory, and that the files and folder structure of the zipped file are intact and unaltered. The script initially loads the files from the train and test subfolders, which contain an observed data file (x_.txt), a file that identifies the activities for each observation (y_.txt) and subject files that identify individual participants. The script also loads the activity_labels.txt file, which gives english descriptors to the activity identifiers, and the features.txt file, which provides variable identifiers for the observed data.  

An important thing to note in the new data file is that it uses the same variable names that are used for the features in the original UCI dataset. This is because the feature names in the original dataset contain a lot of information about the variables and require only a little effort to understand them from the reader. For instance, *tBodyGyro-std()-Y* is readily identified as the standard deviation of the time domain signal of the body from the gyroscope on the y axis. Having this all written would take up much mroe space and would likely make it *less* easily understandable to a reader. Leaving the feature names the same has the additional benefit of being consistent with the original data set for people who are already familiar with it or for those who might want to explore it further. 

After loading the data from the unzipped text files, the script then does the following:

1. Uses the loaded features labels to name the observation data variables;
2. Binds both the activity and subject identifiers to the observation data;
3. Merges the training sets;
4. Removes columns with repeated variable names, they are not related to the required task;
5. Creates vectors of the variable names that are measures of the mean or the standard deviation;
6. Uses those vectors to subset the data, leaving only the identification variables and the mean or standard deviation variables;
7. Creates a new variable with descriptive activity names by mergeing the activity_labels data with the data set; 
8. Summarises the data by grouping it by subject and activity and taking the mean of the observations; and
9. Saves the tidied data set to tidyData.txt in the working directory. 