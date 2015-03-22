##Author Zhuoyi Zhang
##1.    Merges the training and the test sets to create one data set
##'train/X_train.txt': Training set.
##'train/y_train.txt': Training labels.
##'train/subject_train.txt': Each row identifies the subject who performed the activity
##'for each window sample. Its range is from 1 to 30. 

##'test/X_test.txt': Test set.
##'test/y_test.txt': Test labels.
##'test/subject_test.txt': Each row identifies the subject who performed the activity
##'for each window sample. Its range is from 1 to 30. 

run_analysis <- function() {
        
        library(dplyr)
        
        
        ##4.    Appropriately labels the data set with descriptive variable names. 
        ##load 'features.txt'
        var.names<-read.table("features.txt",sep="",header=FALSE,stringsAsFactors=FALSE,allowEscapes = TRUE,fill=TRUE)
        
        ##train data
        
        train<-read.table("train/X_train.txt",sep="",header=FALSE,stringsAsFactors=FALSE,allowEscapes = TRUE,fill=TRUE)
        colnames(train) <-var.names[,2]
        train.label<-read.table("train/y_train.txt",sep="",header=FALSE,stringsAsFactors=FALSE,allowEscapes = TRUE,fill=TRUE)
        train.subject<-read.table("train/subject_train.txt",sep="",header=FALSE,stringsAsFactors=FALSE,allowEscapes = TRUE,fill=TRUE)
        train[,"activity"] <-train.label
        train[,"subject"]<-train.subject
        
        
        ##test data
        
        ##  read.table doesn't round anything
        ##  try options(digits=8) to print all digits
        test<-read.table("test/X_test.txt",sep="",header=FALSE,stringsAsFactors=FALSE,allowEscapes = TRUE,fill=TRUE)
        ## apply var.names[,2] to merge.data
        colnames(test) <-var.names[,2]
        test.label<-read.table("test/y_test.txt",sep="",header=FALSE,stringsAsFactors=FALSE,allowEscapes = TRUE,fill=TRUE)
        test.subject<-read.table("test/subject_test.txt",sep="",header=FALSE,stringsAsFactors=FALSE,allowEscapes = TRUE,fill=TRUE)
        
        ##note that test$activity will not create colname
        test[,"activity"] <-test.label
        test[,"subject"]<-test.subject
        
        
        ##merge
        merge.data<- rbind(train,test)
        
        
        
        ##3.    Uses descriptive activity names to name the activities in the data set
        label.name<-read.table("activity_labels.txt",sep="",header=FALSE,stringsAsFactors=FALSE,allowEscapes = TRUE,fill=TRUE)
        colnames(label.name)<-c("id","activity_name")
        
        
        ##2.    Extracts only the measurements on the mean and standard deviation for each measurement. 
        id<-union(grep("std",colnames(merge.data)),grep("mean",colnames(merge.data)))
        id<-union(id,c(562,563))
        extract<-merge.data[,id]
        with.label<-merge(extract,label.name, by.x="activity", by.y="id")
        
        
        
        ##5.    From the data set in step 4, 
        ##creates a second, independent tidy data set with the average of each variable 
        ##for each activity and each subject.
        
        ##> colnames(with.label[,c(1,81,82)])
        ##[1] "activity"      "subject"       "activity_name"
        result <-with.label %>% group_by(activity,activity_name,subject) %>% summarise_each(funs(mean))
        
        ##write.table
        write.table(result, file="tidydata.txt",  row.name=FALSE, sep=" ")
        print(paste("tidydata.txt is successfully generated in ",getwd(),sep=" "))
        
}
