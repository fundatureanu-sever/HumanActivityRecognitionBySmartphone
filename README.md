---
title: "Readme.md"
author: "Sever Fundatureanu"
date: "June 22, 2017"
output: html_document
---

## Steps

1. Clean extra spaces from X_train.txt line by line and split into tokens; validate we have as many tokens as the number of features
2. Add to the data frame trainingDF each clean row from 1 
3. Read subject_train.txt and add to trainingDF a column with subjects
4. Read y_train.txt and activity_labels.txt and join them based on activity indexes
5. Add the column with the explicit activity label to trainingDF
6. Repeat steps 1-5 for the testing dataset, storing result in testingDF
7. Concatenate the dataframes trainingDF and testingDF into one dataframe outputDF
8. Read features.txt and extract the indexes of the columns which represent mean and standard deviations for each variable.
9. Select the columns from outputDF using column indexes obtained in step 8 and generate a new data frame finalOutputDF
10. For renaming purposes, create a mapping between old and new variable names
11. Apply the new column names to the finalOutputDF dataframe
12. Use dplyr's group_by to create groups based on (activity, subject) combinations
13. Use dplyr's summarize to compute the mean for each group
14. Write the final dataframe to the output file "humanActivityRecognition.csv"

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
