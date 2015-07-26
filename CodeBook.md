---
title: "Code Book"
author: "Saneesh George"
date: "Monday, July 27, 2015"
output: html_document
---
##run_analysis.R

* Downloads required data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzips the file
* Loads features.txt used for columns
* Loads X_train.txt, y_train.txt, subject_train.txt
* X_train contains the data using the feature data set as columns
* y_train contains the activity labels
* subject_train contains the ids
* Join all these into one single data set
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Appropriately set labels the data set with descriptive variable names from Activity_label.txt.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.