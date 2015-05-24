library(plyr)

##Read training dataset
message("Reading Training data ...")
xTrainingData <- read.table("./dataset/train/X_train.txt")

##Read test dataset
message("Reading Test data ...")
xTestData <- read.table("./dataset/test/X_test.txt")

##Read the features mapping table
feature <- read.table("./dataset/features.txt")

##Merge training and test data
allData <- rbind(xTrainingData, xTestData)

##Extract variable names from features table
colNames <- feature[,2] 

##Extract mean and SD measurements
filteredColNames <- grep("mean\\(\\)|std\\(\\)", feature[,2], value=TRUE)
names(allData) <- colNames
allData <- allData[,filteredColNames]

##Format the variable names to readable
names(allData) <- gsub("-mean\\(\\)-","Mean" ,names(allData))
names(allData) <- gsub("-std\\(\\)-","StandardDevation" ,names(allData))

##Read subject ID for training and test data
subjectTrain <- read.table("./dataset/train/subject_train.txt")
subjectTest <- read.table("./dataset/test/subject_test.txt")

##Merge train and test data, Note that train data should be first always
subject <- rbind(subjectTrain, subjectTest)

##Add Label for Subject data
names(subject) <- c("subject")

##read activity IDs for training and subject data
activityTraining <- read.table("./dataset/train/y_train.txt")
activityTest <- read.table("./dataset/test/y_test.txt")

##Read the activity ID and name mapping table
activityMapping <- read.table("./dataset/activity_labels.txt", stringsAsFactors = FALSE)

##Extract activity names from ID for training data
activityTraining <- activityMapping[activityTraining[1:nrow(activityTraining),],2]

##Extract activity names from ID for training data
activityTest <- activityMapping[activityTest[1:nrow(activityTest),],2]

##Merge train and test data, Note that train data should be first always
activity <- c(activityTraining, activityTest)

##Add subject and activity data to measurements data
allData <- cbind(activity, subject,allData)

##Calculate mean(average) for each variable (from 3rdcolumns) for each activity and subject
meanData <- ddply(allData, .(subject, activity), function(x){colMeans(x[,-c(1:2)])})

##Write data to a file without row names
write.table(meanData, file = "tidydata.txt", row.names = FALSE)

