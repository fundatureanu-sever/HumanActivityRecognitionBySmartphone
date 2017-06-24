
library(stringr)
library(dplyr)
#processLine <- function(rowIndex, lineVector, tokenMatrix, validLength) {
#  tokens <- str_split(str_trim(gsub(" +", " ", lineVector[rowIndex])), " ")
  #print(length(tokens[[1]]))
#  if (length(tokens[[1]]) == validLength) {
#    tokenMatrix[rowIndex,] <- as.character(tokens[[1]])
#    print(rowIndex)
#  }
#}

# This function removes extra spaces between tokens and at beginning and end of the line
processLine <- function(rawLine) {
  str_trim(gsub(" +", " ", rawLine))
}

processDataset <- function(inputDirectory, featureList) {
  print(paste0("Loading the ", inputDirectory, " dataset and cleaning spaces"))
  # read in the raw lines from X_*.txt
  X_file <- file(paste0(inputDirectory, "/X_", inputDirectory, ".txt"), "r")
  lines <- readLines(X_file)
  close(X_file)
  
  # Clean lines and write back to an intermediate file
  cleanLines <- sapply(lines, processLine)
  cleanedFileName <- paste0(inputDirectory,"/clean", inputDirectory, ".csv")
  outFile <- file(cleanedFileName, "w")
  writeLines(cleanLines, outFile)
  close(outFile)
  
  # Read intermediate file back into a data frame
  print(paste0("Loading the cleaned ", inputDirectory, " dataset"))
  # (Found this method to be faster than building the data frame row by row)
  outputDF <- read.csv(cleanedFileName, header=FALSE, sep=" ", col.names = featureList)
  
  # add a column with subjects
  subjectFilePath = paste0(inputDirectory, "/subject_", inputDirectory, ".txt")
  subjectDF <- read.csv(subjectFilePath, header=FALSE, col.names="subject")
  outputDF <- cbind(outputDF, subjectDF)
  
  # read y_*.txt file
  yDF <- read.csv(paste0(inputDirectory, "/y_", inputDirectory, ".txt"), 
                        header=FALSE, col.names=c("activityIndex"))
  # read activity_labels.txt
  activityLabelsDF <- read.csv("activity_labels.txt", header=FALSE, sep=" ", 
                               col.names=c("activityIndex", "activity"))
  # join on actitivity index to get the y activity labels
  yActivityLabels <- merge(yDF, activityLabelsDF, sort=FALSE)
  # add column with activity labels to data frame
  outputDF <- cbind(outputDF, activity=yActivityLabels$activity)
  
  # keep only rows with complete cases (only 1 such row was found to have issues in train)
  outputDF[complete.cases(outputDF),]
}

# This function receives as parameters a regex and a list of feature names
# It returns the subset of elements which match the regex
extractColumns <- function(regexPattern, featureList) {
  matches <- sapply(as.character(featureList), 
                    function(featureName) { 
                      ifelse(grepl(regexPattern, featureName), featureName, NA) 
                    })
  matches[!is.na(matches)]
}

# Function used to make column names more explicit
improveColName <- function(colName) {
  newColName <- gsub("Acc", "Acceleration", colName)
  newColName <- gsub("Gyro", "Gyroscope", newColName)
  newColName <- gsub("Mag", "Magnitude", newColName)
  newColName <- gsub("Freq", "Frequency", newColName)
  newColName <- gsub("std", "Std", newColName)
  gsub("mean", "Mean", newColName)
}

main <- function() {
  #### Process the training and testing datasets and binding them together ####
  
  # Read feature names
  featuresDF <- read.csv("features.txt", sep=" ", col.names=c("featureIndex", "featureName"), header=FALSE)
  # remove special characters from feature names
  featureList <- sapply(featuresDF$featureName, function(x) { gsub("[\\(\\),-]+", "", x)} ) 
  
  trainDF <- processDataset("train", featureList)
  testDF <- processDataset("test", featureList)
  print("Merging the train and test datasets ..")
  allData <- rbind(trainDF, testDF)
  
  ######## Select relevant columns ##############

  print("Extracting relevant columns and renaming ..")
  meanColumns <- extractColumns("mean(Freq)?", featureList)
  stdColumns <- extractColumns("std", featureList)
  finalDataSubset <- select(allData, 
                            c(meanColumns, stdColumns, "subject", "activity"))

  ########### Rename columns ####################

  names(finalDataSubset) <- sapply(colnames(finalDataSubset), improveColName)

  ###### Group by (subject, activity) and summarize #####

  print("Summarizing data by (suject,activity) groups and writing to final file")
  summarizedData <- finalDataSubset %>% group_by(subject, activity) %>% summarise_all(mean)
  write.csv(summarizedData, "HumanActivityRecognition.csv", row.names=FALSE)

}