library(reshape2)
library(data.table)
# Load activity labels and features files
setwd("E:/Shubham/R/Getting & Cleaning Data/Project/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

activity_labels <- fread("activity_labels.txt",col.names = c("S_NO","Activity_Name"))

features <- fread("features.txt",col.names = c("S_NO","Feature_Name"))

# featuresRequired contain only the mean & std observations
featuresRequired <- grep("(mean|std)\\(\\)",features[,Feature_Name])

measurements <- features[featuresRequired,Feature_Name]

# replacing the () with "" (a white space)
measurements <- gsub('[()]', '', measurements)

# Loading the train data sets
X_train <- fread("X_train.txt")[, featuresRequired, with = FALSE]

data.table::setnames(X_train, colnames(X_train), measurements)

Y_train <- fread("y_train.txt",col.names = "ActivityNO")

Subject_train <- fread("subject_train.txt",col.names = "SubjectNo")

Training_Data <- cbind(Subject_train,Y_train,X_train)

# Loading the test data sets
X_test <- fread("X_test.txt")[,featuresRequired, with = FALSE]
data.table::setnames(X_test, colnames(X_test), measurements)

Y_test <- fread("y_test.txt",col.names = "ActivityNO")

Subject_test <- fread("subject_test.txt",col.names = "SubjectNo")

Testing_Data <- cbind(Subject_test,Y_test,X_test)

# Merging the data sets
combinedData <- rbind(Training_Data,Testing_Data)

# Convert the classLabels to activityNames
combinedData[["ActivityNO"]] <- factor(combinedData[, ActivityNO]
                                 , levels = activity_labels[["S_NO"]]
                                 , labels = activity_labels[["Activity_Name"]])

combinedData[["SubjectNo"]] <- as.factor(combinedData[, SubjectNo])
combinedData <- reshape2::melt(data = combinedData, id = c("SubjectNo", "ActivityNO"))
combinedData <- reshape2::dcast(data = combinedData, SubjectNo + ActivityNO ~ variable, fun.aggregate = mean)

# Tidy Data set
data.table::fwrite(x = combinedData, file = "tidyData.txt", quote = FALSE)
