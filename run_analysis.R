setwd("~/coursera/Project")

# First we import all the datasets.

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = F)
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = F)
features_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = F)

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = F)
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = F)
features_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = F)
 
# Next, let's give column names a descriptive name.
# Let's start with subject
names(subject_train) <- "subject"
names(subject_test) <- "subject"

# Move on to activtiy
names(activity_train) <- "activity"
names(activity_test) <- "activity"

# Now we tackle the hard one - apply column names to feature.
features_label <- read.table("UCI HAR Dataset/features.txt", header = F)
colnames(features_train) <- features_label$V2
colnames(features_test) <- features_label$V2

# Now we have the names for all the columns, let's select columns in features that have mean and standard deviation
# We do this before we merge because this will make features significantly smaller first. Easier to merge later.

index1 <-  grep("mean",names(features_train))
index2 <- grep("std", names(features_train))
index_selected <- as.vector(append(index1,index2))
index_selected <- index_selected[!duplicated(index_selected)]
features_train_selected <- features_train[,index_selected]

# The index of the features_test columns would be the same as the ones in features_train
features_test_selected <- features_test[,index_selected]

# Now it's time for us to combine all training datasets together, and all test datasets together
# First let's assign a row id for each row in subject and activity dataset so we can join by that id
# Don't forget to drop that id in the last after merge1 WALKING

subject_train$id <- seq.int(nrow(subject_train)) 
activity_train$id <- seq.int(nrow(activity_train)) 
features_train_selected$id <- seq.int(nrow(features_train_selected))

subject_test$id <- seq.int(nrow(subject_test)) 
activity_test$id <- seq.int(nrow(activity_test)) 
features_test_selected$id <- seq.int(nrow(features_test_selected))

train <- merge(merge(subject_train, activity_train, by.x = "id", by.y = "id"), features_train_selected, by.x = "id", by.y = "id")
test <- merge(merge(subject_test, activity_test, by.x = "id", by.y = "id"), features_test_selected, by.x = "id", by.y = "id")
total <- rbind(train, test)
total <- total[,-1]

# Now, let's give each activity a descriptive name.
total$activity <- sub(1, "Walking", total$activity)
total$activity <- sub(2, "Walking_Upstairs", total$activity)
total$activity <- sub(3, "Walking_Downstairs", total$activity)
total$activity <- sub(4, "Sitting", total$activity)
total$activity <- sub(5, "Standing", total$activity)
total$activity <- sub(6, "Laying", total$activity)

# Last step, create a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
average <- total %>% group_by(activity, subject) %>% summarise_all(funs(mean))

# Write data

write.table(average,"getting_and_clean_data_project.txt", row.names = FALSE)



