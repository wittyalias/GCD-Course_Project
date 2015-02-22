
# This code assumes that the data from the UCI Human Activity Recognition using Smartphone Data Set has been unzipped and is in the current working directory

library(dplyr)

wd <- getwd()
dr <- paste(wd, "/UCI HAR Dataset/", sep="")
drTest <- paste(wd,"/UCI HAR Dataset/test/", sep="")
drTrain <- paste(wd, "/UCI HAR Dataset/train/", sep = "")

# activity_labels.txt is a small table that provides labels for the various activities recorded 1-6
activities <- read.table(paste(dr,"activity_labels.txt", sep=""))

# feature_labels.txt provides variable names for the variables observed in the x_ files
features <- read.table(paste(dr, "features.txt",sep=""))

# The subject files contain identifying numbers for individual participants
subTrain <- read.table(paste(drTrain, "subject_train.txt",sep=""))
subTest <- read.table(paste(drTest, "subject_test.txt",sep=""))

# The x_ files contain the actual (summarised) observations
xTrain <- read.table(paste(drTrain, "X_train.txt",sep=""))
xTest <- read.table(paste(drTest, "X_test.txt",sep=""))

#the y_ files contain the different activities that correspond to the observations in the x_ files
yTrain <- read.table(paste(drTrain, "y_train.txt",sep=""))
yTest <- read.table(paste(drTest, "y_test.txt",sep=""))

# Give column names to the x tables
colnames(xTest) <- as.character(features$V2)
colnames(xTrain) <- as.character(features$V2)

# Merge the activities (y tables) to the measurements (x tables)
test <- cbind(yTest, xTest)
train <- cbind(yTrain, xTrain)

# Merge the subject identifiers with the measurement data
test <- cbind(subTest, test)
train <- cbind(subTrain, train)

# Merge the training and test data sets
merged <- rbind(test,train)
colnames(merged)[1] <- "subject_id"
colnames(merged)[2] <- "activity_code"

# The original data contains a number of duplicated variable names, none of which are relevant to the assigned work
merged <- merged[,which(!duplicated(names(merged)))]

# Get all of the column names
mergedNames <- colnames(merged)

# Get the names that relate to the mean or standard deviation
stdevNamesInd <- grep("std()",mergedNames, ignore.case = TRUE)
meanNamesInd <- grep("mean", mergedNames, ignore.case = TRUE)

# Extract only those variables that are the mean or standard deviation
merged <- merged[,c(1,2,stdevNamesInd, meanNamesInd)]

# Replace activity labels with descriptors and then drop unnecessary V1 variable
merged<-merge(activities, merged, by.x="V1", by.y="activity_code")
merged$V1 <- NULL
colnames(merged)[1] <- "activity_code"

# Final task
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy <- group_by(merged, activity_code, subject_id)
tidy <- tidy %>% summarise_each(funs(mean))

# Write the tidy data to a text file. 
write.table(tidy, file = "tidyData.txt", row.name = FALSE)
