# Getting-and-Cleaning-Data

---
title: "README.md"
author: "Zhuoyi Zhang"
date: "Sunday, March 22, 2015"
output: html_document
---

Requirement

dplyr package should be installed in Rstudio



How to run run_analysis.R

1. download raw data from the following link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. unzip it to any local folder
3. copy run_analysis.R to "UCI HAR Dataset" under your chosen local folder
   Note: Make sure run_analysis.R is located in folder "UCI HAR Dataset"
If your type dir() in Rstudio, you should see run_analysis.R are located in UCI HAR Dataset
> dir()
[1] "activity_labels.txt" "features.txt"        "features_info.txt"   "README.md"           "README.txt"         
[6] "run_analysis.R"      "test"                "train"  

4. Open RStudio and set your workspace to \UCI HAR Dataset
        1)in Rstudio
        2)Session>set working directory->choose directory
        3)to folder "UCI HAR Dataset" and click "select folder" button
        you should see "> setwd("<your path>/UCI HAR Dataset")" in the console
5. Open run_analysis.R in Rstudio and compile it
6. Run run_analysis.R in the console by typing 
     run_analysis()   
7. The tidydata file will be generated in "UCI HAR Dataset"
        you will see a message in console like the following.
        [1] "tidydata.txt is successfully generated in  <your path>/UCI HAR Dataset"


What does run_analysis.R does

step 1  --line 24-44
Merges the training and the test sets to create one data set
I merge the following 3 files in folder "Train"
##'train/X_train.txt': Training set.
##'train/y_train.txt': Train Activity code
##'train/subject_train.txt': Each row identifies the subject who performed the activity
##'for each window sample. 

I merge the following 3 files in folder "test"

##'test/X_test.txt': Test set.
##'test/y_test.txt': Test activity code.
##'test/subject_test.txt': Each row identifies the subject who performed the activity
##'for each window sample. 

step 2 --line 48
merge the train set and test set into one data frame


step 3  --line 52-54
load the activity id and activity discription table from activity_labels.txt


step 4  --line 58-60
Extracts only the measurements on the mean and standard deviation for each measurement. 
I search all the column names that contain "mean" or "std"


step 5   --line 61
merge activity name to the one data frame with matching activity id


step 6   --line 71
Summarise all the measurements group by activity id, activity name and subject.
Activity id and activity name are 1 to 1 mapping, so it is correct to include both columns into group by function

step 7   --line 74-75
Write the result data frame into tidydata.txt and print the successful message
















