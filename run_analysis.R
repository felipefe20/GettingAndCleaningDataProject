library(plyr)  

#Train Data
  Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  # Test Data
  Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  # Activity labels
  activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
  #subjects 
  subject_tests <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  #merging rows
  SubjectData<-rbind(subject_train,subject_tests)
  ActivityData<-rbind(Y_train, Y_test)
  XData<-rbind(X_train,X_test)
  
  # Name variables
  
  names(SubjectData)<-c("subject")
  names(ActivityData)<-c("activity")
  
  
  #Load features info
  
  features<-read.table("./UCI HAR Dataset/features.txt")
  names(XData)<-features$V2
  
  
  #Combine Data
  CombinedData<-cbind(SubjectData,ActivityData)
  Data<-cbind(CombinedData,XData)
  
  #Subset Names
  subdatanames<-features$V2[grep("mean\\(\\)|std\\(\\)",features$V2)]
  selectedNames<-c("subject","activity",as.character(subdatanames))
  Data<-subset(Data,select=selectedNames)
  Data$activity<-factor(Data$activity,levels=activity_labels[,1],labels=activity_labels[,2])

  
  # Descriptive names
  
  names(Data)<-gsub("^t", "time", names(Data))
  names(Data)<-gsub("^f", "frequency", names(Data))
  names(Data)<-gsub("Acc", "Accelerometer", names(Data))
  names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
  names(Data)<-gsub("Mag", "Magnitude", names(Data))

  
  #New Table

  Data2<-aggregate(. ~subject + activity, Data, mean)
  Data2<-Data2[order(Data2$subject,Data2$activity),]
  write.table(Data2, file = "tidydata.txt",row.name=FALSE)  
  