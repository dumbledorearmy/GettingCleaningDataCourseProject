run_analysis <- function(){
#Assuming this file is kept in the same folder of the unzipped data of project
#This should be .\UCI HAR Dataset    
#Code tested on Windows, the backslash operator for file opening may be different in Linux/Unix
#Library reshape2 for the melt and dcast function    
    library(reshape2)
    
#Read the training and test data and combine them    
    train <- read.table(".//train//X_train.txt")
    test <- read.table(".//test//X_test.txt")
    merge <- rbind(train,test)

#Read the features file to get the column names/feature names and name them in merged dataset
    features <- read.table("features.txt")
    colnames(merge) <- features[,2]
    
#Extract all columns which contain the word mean and std - for Mean and Standard Deviation
    meanstdcols <- grep(".*mean\\(\\)|.*std\\(\\)",colnames(merge),value =TRUE)
    mergemeanstd <- merge[,meanstdcols]

#Remove other temporary columns except "mergemeanstd" for better memory usage
    remove(train,test,merge,features)

#Renaming columns - removing () & - in column names and capitalizing m & s in mean & std respectively 
    colnames <- colnames(mergemeanstd)
    colnames <- gsub("\\(|\\)|\\-","",colnames)
    colnames <- gsub("mean","Mean",colnames)
    colnames <- gsub("std","Std",colnames)
    colnames(mergemeanstd) <- colnames

#Read activity ID by combining training and test datasets
    activity_train <- read.table(".//train//y_train.txt")
    activity_test <- read.table(".//test//y_test.txt")
    activityID <- rbind(activity_train,activity_test)
    mergemeanstd$ActivityID <- activityID[,1]

#Read Subject ID information and add as a separate column
    subject_train <- read.table(".//train//subject_train.txt")
    subject_test <- read.table(".//test//subject_test.txt")
    subject <- rbind(subject_train,subject_test)
    mergemeanstd$Subject <- subject[,1]

#Read activity labels legends and merge them by the ActivityID in our merged dataset 
    activitylabels <- read.table(".//activity_labels.txt")
    colnames(activitylabels) <- c("ActivityID","ActivityLabel")
    mergemeanstd <- merge(mergemeanstd,activitylabels,by.x ="ActivityID",by.y="ActivityID",sort = F)

#Remove temporary datasets again to free up memory
    remove(activity_train,activity_test,activityID,activitylabels,subject_train,subject_test,subject)

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
    outputvars <- c("ActivityID","ActivityLabel","Subject")
    tidymelt <- melt(mergemeanstd,id.vars = outputvars)
    tidyData <- dcast(tidymelt, ActivityID + ActivityLabel + Subject ~ variable,mean)

#Writes the output in your working directory as the filename "tidyoutput.txt" 
    write.table(tidyData,"tidyoutput.txt",row.names = FALSE)
}
