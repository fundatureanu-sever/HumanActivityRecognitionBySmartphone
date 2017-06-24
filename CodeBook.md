---
title: "Human Activity Recognition Using Smartphones Dataset"
Version: 1.1
author: "Sever Fundatureanu"
date: "June 24, 2017"
output: html_document
---

## Overview

This dataset has been generated using the Human Activity Recognition Using Smartphones Data Set provided by University of California here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .

We merged the training and testing data sets while joining in the subjects and the descriptive name for each activity. For each measurement from the raw data we extracted the mean and standard deviation. We then computed the average for each of these by (subject, activity) groups. 

## Naming convention

We improved the original variable names by removing special characters and using full words for the measurements. We kept the 't' and 'f' prefixes to diferentiate between time and frequency domain signals. We also kept the X,Y,Z suffixes which denote the direction of each variable. For example tBodyAcc-mean()-Y was renamed to tBodyAccelerationMeanY. 

## Data Variables
  
  - "subject"
  An integer value in [1-30] representing one of the 30 volunteers who performed the activity
  - "activity"
  A string which can take on of the values ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

Averaged measurements from original dataset:
  
 [1] "tBodyAccelerationMeanX"                         
 [2] "tBodyAccelerationMeanY"                         
 [3] "tBodyAccelerationMeanZ"                         
 [4] "tGravityAccelerationMeanX"                      
 [5] "tGravityAccelerationMeanY"                      
 [6] "tGravityAccelerationMeanZ"                      
 [7] "tBodyAccelerationJerkMeanX"                     
 [8] "tBodyAccelerationJerkMeanY"                     
 [9] "tBodyAccelerationJerkMeanZ"                     
[10] "tBodyGyroscopeMeanX"                            
[11] "tBodyGyroscopeMeanY"                            
[12] "tBodyGyroscopeMeanZ"                            
[13] "tBodyGyroscopeJerkMeanX"                        
[14] "tBodyGyroscopeJerkMeanY"                        
[15] "tBodyGyroscopeJerkMeanZ"                        
[16] "tBodyAccelerationMagnitudeMean"                 
[17] "tGravityAccelerationMagnitudeMean"              
[18] "tBodyAccelerationJerkMagnitudeMean"             
[19] "tBodyGyroscopeMagnitudeMean"                    
[20] "tBodyGyroscopeJerkMagnitudeMean"                
[21] "fBodyAccelerationMeanX"                         
[22] "fBodyAccelerationMeanY"                         
[23] "fBodyAccelerationMeanZ"                         
[24] "fBodyAccelerationMeanFrequencyX"                
[25] "fBodyAccelerationMeanFrequencyY"                
[26] "fBodyAccelerationMeanFrequencyZ"                
[27] "fBodyAccelerationJerkMeanX"                     
[28] "fBodyAccelerationJerkMeanY"                     
[29] "fBodyAccelerationJerkMeanZ"                     
[30] "fBodyAccelerationJerkMeanFrequencyX"            
[31] "fBodyAccelerationJerkMeanFrequencyY"            
[32] "fBodyAccelerationJerkMeanFrequencyZ"            
[33] "fBodyGyroscopeMeanX"                            
[34] "fBodyGyroscopeMeanY"                            
[35] "fBodyGyroscopeMeanZ"                            
[36] "fBodyGyroscopeMeanFrequencyX"                   
[37] "fBodyGyroscopeMeanFrequencyY"                   
[38] "fBodyGyroscopeMeanFrequencyZ"                   
[39] "fBodyAccelerationMagnitudeMean"                 
[40] "fBodyAccelerationMagnitudeMeanFrequency"        
[41] "fBodyBodyAccelerationJerkMagnitudeMean"         
[42] "fBodyBodyAccelerationJerkMagnitudeMeanFrequency"
[43] "fBodyBodyGyroscopeMagnitudeMean"                
[44] "fBodyBodyGyroscopeMagnitudeMeanFrequency"       
[45] "fBodyBodyGyroscopeJerkMagnitudeMean"            
[46] "fBodyBodyGyroscopeJerkMagnitudeMeanFrequency"   
[47] "tBodyAccelerationStdX"                          
[48] "tBodyAccelerationStdY"                          
[49] "tBodyAccelerationStdZ"                          
[50] "tGravityAccelerationStdX"                       
[51] "tGravityAccelerationStdY"                       
[52] "tGravityAccelerationStdZ"                       
[53] "tBodyAccelerationJerkStdX"                      
[54] "tBodyAccelerationJerkStdY"                      
[55] "tBodyAccelerationJerkStdZ"                      
[56] "tBodyGyroscopeStdX"                             
[57] "tBodyGyroscopeStdY"                             
[58] "tBodyGyroscopeStdZ"                             
[59] "tBodyGyroscopeJerkStdX"                         
[60] "tBodyGyroscopeJerkStdY"                         
[61] "tBodyGyroscopeJerkStdZ"                         
[62] "tBodyAccelerationMagnitudeStd"                  
[63] "tGravityAccelerationMagnitudeStd"               
[64] "tBodyAccelerationJerkMagnitudeStd"              
[65] "tBodyGyroscopeMagnitudeStd"                     
[66] "tBodyGyroscopeJerkMagnitudeStd"                 
[67] "fBodyAccelerationStdX"                          
[68] "fBodyAccelerationStdY"                          
[69] "fBodyAccelerationStdZ"                          
[70] "fBodyAccelerationJerkStdX"                      
[71] "fBodyAccelerationJerkStdY"                      
[72] "fBodyAccelerationJerkStdZ"                      
[73] "fBodyGyroscopeStdX"                             
[74] "fBodyGyroscopeStdY"                             
[75] "fBodyGyroscopeStdZ"                             
[76] "fBodyAccelerationMagnitudeStd"                  
[77] "fBodyBodyAccelerationJerkMagnitudeStd"          
[78] "fBodyBodyGyroscopeMagnitudeStd"                 
[79] "fBodyBodyGyroscopeJerkMagnitudeStd"             
