# Human-Activity-Recognition-Using-Smartphones

**Coursera Getting & Cleaning Data Project**

In this project, data is collected from the accelerometer and gyroscope of the Samsung Galaxy S II smartphone, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist

## This repository contains the following files:

* **`README.md`**, this file, which provides an overview of the data set and how it was created.
* **`tidyData.txt`**, which contains the data set.
* **`CodeBook.md`**, the code book, which describes the contents of the data set (data, variables and other relevant information).
* **`run_analysis.R`**, the R script that was used to create the data set (see the Creating the data set section below)

**The training and test sets were merged to create one data set i.e the _`tidyData.txt`_**

## Creating the data set

The R script _`run_analysis.R`_ can be used to create the data set. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps (see the Code book for details, as well as the comments in the script itself):

* [Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip source data if it doesn't exist.
* Read data.
* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement.
* Use descriptive activity names to name the activities in the data set.
* Appropriately label the data set with descriptive variable names.
* Create a second, independent tidy set with the average of each variable for each activity and each subject.
* Write the data set to the tidy_data.txt file.
* The tidyData.txt in this repository was created by running the _`run_analysis.R`_ script 

**Snapshot of the TidyData set in Tableau**

![](Images/TidyData.png)
