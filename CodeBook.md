## Overview

This dataset has been generated using the Human Activity Recognition Using Smartphones Data Set provided by University of California here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .

We merged the training and testing data sets while joining in the subjects and the descriptive name for each activity. For each measurement from the raw data we extracted the mean and standard deviation. We then computed the average for each of these by (subject, activity) groups. 

## Naming convention

We improved the original variable names by removing special characters and using full words for the measurements. We kept the 't' and 'f' prefixes to diferentiate between time and frequency domain signals. We also kept the X,Y,Z suffixes which denote the direction of each variable. For example tBodyAcc-mean()-Y was renamed to tBodyAccelerationMeanY. 

## Processing Steps

The script process.R is running the following steps to transform the data:

1. Clean extra spaces from X_train.txt line by line and write clean lines back to an intermediate csv file
2. Read the intermediate csv file back into the data frame trainingDF  
3. Read subject_train.txt and add to trainingDF a column with subjects
4. Read y_train.txt and activity_labels.txt and join them based on activity indexes
5. Add the column with the explicit activity label to trainingDF
6. Repeat steps 1-5 for the testing dataset, storing result in testingDF
7. Concatenate the dataframes trainingDF and testingDF into one dataframe *allData*
8. Read features.txt and extract the names which represent mean and standard deviations for each variable.
9. Select the columns from *allData* using column indexes obtained in step 8 and generate a new data frame *finalDataSubset*
10. For renaming purposes, create a mapping between old and new variable names
11. Apply the new column names to the *finalDataSubset* dataframe
12. Use dplyr's group_by to create groups based on (activity, subject) combinations
13. Use dplyr's summarize_all to compute the mean for all the groups
14. Write the final dataframe to the output file "humanActivityRecognition.csv"

## Running the script

~~~~
> source("process.R")
> setwd("<root directory with raw data")
> main()
~~~~

## New Data Variables
  
  - "subject":
  An integer value in [1-30] representing one of the 30 volunteers who performed the activity
  - "activity": 
  A string which can take on of the values ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

Corresponding averaged measurements from accelerometer and gyroscope from original dataset:

- Time domain signals

-- Body Acceleration 

  "tBodyAccelerationMeanX"                         
  "tBodyAccelerationMeanY"                         
  "tBodyAccelerationMeanZ"                         
  "tGravityAccelerationMeanX"                      
  "tGravityAccelerationMeanY"                      
  "tGravityAccelerationMeanZ"                      
  "tBodyAccelerationJerkMeanX"                     
  "tBodyAccelerationJerkMeanY"                     
  "tBodyAccelerationJerkMeanZ"  
  "tBodyAccelerationMagnitudeMean"   
  "tBodyAccelerationJerkMagnitudeMean" 
  "tBodyAccelerationStdX"                          
  "tBodyAccelerationStdY"                          
  "tBodyAccelerationStdZ"   
  "tBodyAccelerationJerkStdX"                      
  "tBodyAccelerationJerkStdY"                      
  "tBodyAccelerationJerkStdZ"   
  "tBodyAccelerationMagnitudeStd"  
  "tBodyAccelerationJerkMagnitudeStd"

-- Body Gyroscope

 "tBodyGyroscopeMeanX"                            
 "tBodyGyroscopeMeanY"                            
 "tBodyGyroscopeMeanZ"                            
 "tBodyGyroscopeJerkMeanX"                        
 "tBodyGyroscopeJerkMeanY"                        
 "tBodyGyroscopeJerkMeanZ"                        
 "tBodyGyroscopeMagnitudeMean"                    
 "tBodyGyroscopeJerkMagnitudeMean"    
 "tBodyGyroscopeStdX"                             
 "tBodyGyroscopeStdY"                             
 "tBodyGyroscopeStdZ"                             
 "tBodyGyroscopeJerkStdX"                         
 "tBodyGyroscopeJerkStdY"                         
 "tBodyGyroscopeJerkStdZ"
 "tBodyGyroscopeMagnitudeStd"                     
 "tBodyGyroscopeJerkMagnitudeStd"    
 
-- Gravity Acceleration

 "tGravityAccelerationMagnitudeMean"              
 "tGravityAccelerationStdX"                       
 "tGravityAccelerationStdY"                       
 "tGravityAccelerationStdZ"            
 "tGravityAccelerationMagnitudeStd"  

- Frequency domain signals

-- Body Acceleration 

 "fBodyAccelerationMeanX"                         
 "fBodyAccelerationMeanY"                         
 "fBodyAccelerationMeanZ"                         
 "fBodyAccelerationMeanFrequencyX"                
 "fBodyAccelerationMeanFrequencyY"                
 "fBodyAccelerationMeanFrequencyZ"                
 "fBodyAccelerationJerkMeanX"                     
 "fBodyAccelerationJerkMeanY"                     
 "fBodyAccelerationJerkMeanZ"                     
 "fBodyAccelerationJerkMeanFrequencyX"            
 "fBodyAccelerationJerkMeanFrequencyY"            
 "fBodyAccelerationJerkMeanFrequencyZ"  
 "fBodyAccelerationMagnitudeMean"                 
 "fBodyAccelerationMagnitudeMeanFrequency"        
 "fBodyBodyAccelerationJerkMagnitudeMean"      
 "fBodyBodyAccelerationJerkMagnitudeMeanFrequency"  
 "fBodyAccelerationStdX"                          
 "fBodyAccelerationStdY"                          
 "fBodyAccelerationStdZ"                          
 "fBodyAccelerationJerkStdX"                      
 "fBodyAccelerationJerkStdY"                      
 "fBodyAccelerationJerkStdZ"   
 "fBodyAccelerationMagnitudeStd"                  
 "fBodyBodyAccelerationJerkMagnitudeStd"  

-- Body Gyroscope

 "fBodyGyroscopeMeanX"                            
 "fBodyGyroscopeMeanY"                            
 "fBodyGyroscopeMeanZ"                            
 "fBodyGyroscopeMeanFrequencyX"                   
 "fBodyGyroscopeMeanFrequencyY"                   
 "fBodyGyroscopeMeanFrequencyZ"                   
 "fBodyBodyGyroscopeMagnitudeMean"                
 "fBodyBodyGyroscopeMagnitudeMeanFrequency"       
 "fBodyBodyGyroscopeJerkMagnitudeMean"            
 "fBodyBodyGyroscopeJerkMagnitudeMeanFrequency"
 "fBodyGyroscopeStdX"                             
 "fBodyGyroscopeStdY"                             
 "fBodyGyroscopeStdZ"
 "fBodyBodyGyroscopeMagnitudeStd"                 
 "fBodyBodyGyroscopeJerkMagnitudeStd"             
