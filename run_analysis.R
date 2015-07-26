#Unzip the file if it is being done for the first time
file <- "getdata_projectfiles_UCI HAR Dataset.zip"

if(!file.exists(file)){
    unzip(file, list = FALSE, overwrite = TRUE)
} 

#Obtain the features

ft<-read.table("UCI HAR Dataset/features.txt")
    
#To combine every thing together
#Uses descriptive activity names to name the activities in the data set

train_dt <- read.table("UCI HAR Dataset/train/X_train.txt",col.names=ft$V2)
test_dt <- read.table("UCI HAR Dataset/test/X_test.txt",col.names=ft$V2)
X <- rbind(train_dt, test_dt)


train_dt <- read.table("UCI HAR Dataset/train/y_train.txt",col.names="activity")
test_dt <- read.table("UCI HAR Dataset/test/y_test.txt",col.names="activity")
Y <- rbind(train_dt, test_dt)

train_dt <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names="id")
test_dt <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names="id")
S <- rbind(train_dt, test_dt)

dt<-cbind(S, Y, X)

#Create a combined data set with all the data
write.table(dt, "merged_data.txt",row.name=FALSE)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
dt_ms <- dt[,c(1,2,grep("std", colnames(dt)), grep("mean", colnames(dt)))]

#Appropriately labels the data set with descriptive variable names.
act<-read.table("UCI HAR Dataset/activity_labels.txt")
dt_ms$activity <- factor(dt$activity, levels=act$V1, labels=act$V2)
setDT(dt_ms)

# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
final_dt<-dt_ms[,lapply(.SD, mean),by=list(id, activity)]

write.table(final_dt, "mean_data.txt",row.name=FALSE)
