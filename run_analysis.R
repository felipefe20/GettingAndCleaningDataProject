  

  Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
  subject_tests <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  #colnames(subject_tests)=c("subject_tests")
  #colnames(subject_train)=c("subject_train")
  #colnames(Y_train)=c("Y_train") 
  #colnames(Y_test)=c("Y_test")
  
  test<-cbind(subject_tests,Y_test,X_test)
  train<-cbind(subject_train,Y_train,X_train)
  data<-rbind(test,train)