library(data.table)
#read train data and add subject and activity for train data.
dt_train <- data.table(read.table("UCI HAR Dataset/train/X_train.txt"))
temp<-data.table(read.table("UCI HAR Dataset/train/subject_train.txt"))
temp2<-data.table(read.table("UCI HAR Dataset/train/y_train.txt"))
dt_train <- cbind(temp$V1, temp2$V1,dt_train)
#read test data and add subject and activity for the test data.
dt_test <- data.table(read.table("UCI HAR Dataset/test/X_test.txt"))
temp<-data.table(read.table("UCI HAR Dataset/test/subject_test.txt"))
temp2<-data.table(read.table("UCI HAR Dataset/test/y_test.txt"))
dt_test <- cbind(temp$V1, temp2$V1,dt_test)
#combine train data and test data.
dt<- rbind(dt_train, dt_test)
#import colnames from features.txt and add subject and activity to the colnames.
temp<-data.table(read.table("features.txt"))
colnames <- c("subject", "activity", as.character(temp$V2))
#assign colnames to the combined test & training data
setnames(dt,1:563, colnames)
#subset data to those columns we are interested in, subject, activity and means and stds
dt<-subset(dt, select = c("subject", "activity", colnames[grepl("-(mean|std)\\(\\)",colnames)]))
#change activity numberic value to descriptive text
dt$activity[dt$activity == 1] = "WALKING"
dt$activity[dt$activity == 2] = "WALKING_UPSTAIRS"
dt$activity[dt$activity == 3] = "WALKING_DOWNSTAIRS"
dt$activity[dt$activity == 4] = "SITTING"
dt$activity[dt$activity == 5] = "STANDING"
dt$activity[dt$activity == 6] = "LAYING"
#make a new data.table dt_avg which consists of avg value of the meansurement variables by subject and activity.
dt_avg<-dt[,lapply(.SD, mean), by=c("subject","activity")]
#change the colunmn names for dt_avg (except for subject and activity) by adding avg_ at the beginning of the column name.
newcolnames <- sub("^", "avg_", colnames(b)[c(-1,-2)])
setnames(dt_avg, 3:68, newcolnames)
write.table(dt_avg, file = "dt_avg.txt", row.names = FALSE)
