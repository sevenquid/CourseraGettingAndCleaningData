# Code Book

## Origin of data
The data comes from "Human Activity Recognition Using Smartphones Data Set" 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables and Transformations
* xTrain, yTrain, subjectTrain, xTest, yTest, subjectTest, features, activity_labels
These variables are used to read in the raw data. They are removed from memory after use.
* train, test, merged
These variables contain the merged data. train and test are removed from memory after use.
* mean_and_std
This variable contains the merged data (with column names) with all variables removed except means and standard deviations of features, and subject and activity. It is removed from memory at the end of the script.
* tidyDataset
This variable contains the tidy dataset in which the data is summarized to give the mean of each feature within each subject/activity pairing. This dataset is outputted as tidyDataset.txt.