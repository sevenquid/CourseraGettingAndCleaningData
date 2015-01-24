xTrain <- read.csv("UCI HAR Dataset/train/X_train.txt", 
                   sep="", header=FALSE)
yTrain <- read.csv("UCI HAR Dataset/train/Y_train.txt", 
                   sep="", header=FALSE)
subjectTrain <- read.csv("UCI HAR Dataset/train/subject_train.txt", 
                         sep="", header=FALSE)

xTest <- read.csv("UCI HAR Dataset/test/X_test.txt", 
                  sep="", header=FALSE)
yTest <- read.csv("UCI HAR Dataset/test/Y_test.txt", 
                  sep="", header=FALSE)
subjectTest <- read.csv("UCI HAR Dataset/test/subject_test.txt", 
                        sep="", header=FALSE)

## merge training and test data and clear memory
train <- cbind(xTrain, yTrain, subjectTrain)
test <- cbind(xTest, yTest, subjectTest)
merged <- rbind(train, test)
rm(xTrain, yTrain, subjectTrain, xTest, 
   yTest, subjectTest, train, test)

## label variables
features <- read.csv("UCI HAR Dataset/features.txt", 
                     sep="", header=FALSE, 
                     stringsAsFactors=FALSE)
colnames(merged) <- c(features[, 2], "Activity", "Subject")
rm(features)

## keep mean and std variables only (plus Activity and Subject)
cols <- c(grep("mean", colnames(merged)), 
          grep("std", colnames(merged)), 
          562, 563)
cols <- sort(cols)
mean_and_std <- merged[cols]
rm(merged, cols)

## Apply activity labels
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", 
                            sep="", header=FALSE,
                            stringsAsFactors=FALSE)
activity_labels <- activity_labels[,2]
vector <- c()
for (i in 1:nrow(mean_and_std)) {
    value <- mean_and_std[i, "Activity"]
    activity <- activity_labels[value]
    vector <- c(vector, activity)
}
mean_and_std$Activity <- vector
rm(activity_labels, vector, i, value, activity)

## Apply descriptive variable names
colnames(mean_and_std) = gsub('-mean', 'Mean', colnames(mean_and_std))
colnames(mean_and_std) = gsub('-std', 'Std', colnames(mean_and_std))
colnames(mean_and_std) = gsub('[()-]', '', colnames(mean_and_std))

## create independent tidy data set with the average of each variable 
## for each activity and each subject. Write to text file.
tidyDataset <- aggregate(mean_and_std[,1:79], 
                        by=list(Activity = mean_and_std$Activity, 
                                Subject = mean_and_std$Subject), mean
)
write.table(tidyDataset, file = "UCI HAR Dataset/tidyDataset.txt", row.names = FALSE)
rm(mean_and_std)