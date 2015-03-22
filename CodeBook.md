---
title: "CodeBook.md"
author: "Zhuoyi Zhang"
date: "Sunday, March 22, 2015"
output: html_document
---

For each record it is provided:
======================================

- A 79-feature vector with mean() or Std on the original time and frequency domain variables.
- Its activity label.  
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
- Its activity Id.   from 1 to 6
- An identifier of the subject who carried out the experiment. from 1 to 30



Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

The reason of the feature reduction:
======================================
The original set has 561-feature vector caculated from Triaxial acceleration and Triaxial Angular velocity data.
Now only 79 features remain because we only extract the measurements on the mean and standard deviation for each measurement. 



Explanation of the columns in tidydata.txt:
======================================
The column names are self explanatory

For instance, column 7 is tGravityAcc-std()-X, it can be split into tGravityAcc,  std() and X

This measurement is the average of standard deviation over tGravityAcc signal in X direction for
a subject and an activity.

All the rest of columns are calculated in the same way.


> colnames(result)
 [1] "activity"                        "activity_name"                   "subject"                        
 [4] "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
 [7] "tGravityAcc-std()-X"             "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
[10] "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
[13] "tBodyGyro-std()-X"               "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
[16] "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
[19] "tBodyAccMag-std()"               "tGravityAccMag-std()"            "tBodyAccJerkMag-std()"          
[22] "tBodyGyroMag-std()"              "tBodyGyroJerkMag-std()"          "fBodyAcc-std()-X"               
[25] "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"                "fBodyAccJerk-std()-X"           
[28] "fBodyAccJerk-std()-Y"            "fBodyAccJerk-std()-Z"            "fBodyGyro-std()-X"              
[31] "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"               "fBodyAccMag-std()"              
[34] "fBodyBodyAccJerkMag-std()"       "fBodyBodyGyroMag-std()"          "fBodyBodyGyroJerkMag-std()"     
[37] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"               "tBodyAcc-mean()-Z"              
[40] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"           
[43] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"           "tBodyAccJerk-mean()-Z"          
[46] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
[49] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"          "tBodyGyroJerk-mean()-Z"         
[52] "tBodyAccMag-mean()"              "tGravityAccMag-mean()"           "tBodyAccJerkMag-mean()"         
[55] "tBodyGyroMag-mean()"             "tBodyGyroJerkMag-mean()"         "fBodyAcc-mean()-X"              
[58] "fBodyAcc-mean()-Y"               "fBodyAcc-mean()-Z"               "fBodyAcc-meanFreq()-X"          
[61] "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"          
[64] "fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-meanFreq()-X"      
[67] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"       "fBodyGyro-mean()-X"             
[70] "fBodyGyro-mean()-Y"              "fBodyGyro-mean()-Z"              "fBodyGyro-meanFreq()-X"         
[73] "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"             
[76] "fBodyAccMag-meanFreq()"          "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-meanFreq()" 
[79] "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-meanFreq()"     "fBodyBodyGyroJerkMag-mean()"    
[82] "fBodyBodyGyroJerkMag-meanFreq()"




