#import data
features <- read.table("~/J. Hopkins - Data Science/RFiles/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
View(features)
subject_train <- read.table("~/J. Hopkins - Data Science/RFiles/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
X_train <- read.table("~/J. Hopkins - Data Science/RFiles/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
y_train <- read.table("~/J. Hopkins - Data Science/RFiles/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
subject_test <- read.table("~/J. Hopkins - Data Science/RFiles/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
X_test <- read.table("~/J. Hopkins - Data Science/RFiles/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
y_test <- read.table("~/J. Hopkins - Data Science/RFiles/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)

# rename the columns in the train and tets dataset with the features data
names(X_test) <- features$V2
names(X_train) <- features$V2
#add the train label to the train dataset and the test label to the test dataset
test <- cbind(X_test, y_test)
train <- cbind(X_train, y_train)

#combine the train and test dataset; add the test rows to the train rows
dataset <- rbind(train, test)
dim(dataset)

#extract the mean of each measurement
mean_colnames <-grep("mean", ignore.case = TRUE, names(dataset), value = TRUE)
means <- dataset[,mean_colnames]

#extract the standard deviation of each measurement
stdev <- grep("std", ignore.case = TRUE,names(dataset), value = TRUE)
stdevs <- dataset[,stdev]



activity_labels <- read.table("~/J. Hopkins - Data Science/RFiles/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="", stringsAsFactors=FALSE)
# add the definition for the 1:6 variables
df <- merge(dataset, activity_labels, by = "V1")
df$activity <- df$V2
df2 <- df[,-563]
df2$subject <- df2$V1
df3 <- df2[,-1]

#calculate the mean for each measurement
mean_result <- sapply(df3[,-c(562,563)], mean)
#store the result in a dataframe
tbl_mean <- as.data.frame(mean_result)
sapply(df3[,-c(562,563)], sd)
#calculate the mean for each activity
mean_result_activity <- 

setwd("~/J. Hopkins - Data Science/RFiles/data cleaning assignment")
write.table(df3,"tidy.dataset.csv", row.names = FALSE)
