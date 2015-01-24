# Coursera: Getting and Cleaning Data - Course Project

## Raw Data
subject_test.txt and subject_train.txt contain the id of the subject for each observation.
features.txt contains the feature names (i.e. variable names) for each of the 561 features.
y_test.txt and y_train.txt contain the Activity as an integer from 1 to 6.
activity_labels.txt contains the Activity names
X_test.txt and X_train.txt contain the observations

## The script
The script assumes your working directory contains the extracted "UCI HAR Dataset" folder.
run_analysis.R merges the testing and training datasets.
Variables regarding mean and standard deviation are kept; all others are discarded.
The data is summarized to give the mean of each feature within each subject/activity pairing,
and this dataset is outputted as tidyDataset.txt.

## Code book
CodeBook.md is included to describe variables, data and transformations performed to clean the data.