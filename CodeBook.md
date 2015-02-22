# GCD-Course_Project CodeBook
The purpose of this codebook is to provide information about the variables themselves that could not be included within the data files themselves. It describes the output of the run_analysis.R script created in response to the project requirements for the Getting and Cleaning Data course on https://www.coursera.org/.

## tidyData.txt variables
As required by the project instructions, the variables are all the arithmetic mean of the original test and train variables by subject and activity. Their units are the same as the original data. 

## Breakdown of names
As noted in the readme.txt file, the variable names in this file are the same as those provided in the original UCI data because those names contain a large amount of information with minimal effort needed to understand them. 

The variable names break down into easily identifiable components with the following meanings:

* t or f - time or fourier transformed frequency domain signals
* body or gravity - body or gravity created acceleration signals
* Acc or Gyro - accelerometer or gyroscope signal
* Jerk - signals related to acceleration of acceleration
* Mag - magnitude of the three dimensional signals
* mean() or std() - the mean or standard deviation from the original dataset

## Summary Choices Made
The variables in the tidyData.txt include the angle means and the meanFreq() measurements. 

# Info from UCI
Relevant information from the features_info.txt description of the variables:

>Feature Selection 
>=================
>
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
>
>gravityMean
>tBodyAccMean
>tBodyAccJerkMean
>tBodyGyroMean
>tBodyGyroJerkMean
>
>The complete list of variables of each feature vector is available in 'features.txt'
