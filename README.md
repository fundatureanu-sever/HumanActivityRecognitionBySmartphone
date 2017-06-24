---
title: "Readme.md"
author: "Sever Fundatureanu"
date: "June 22, 2017"
output: html_document
---

## Steps

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