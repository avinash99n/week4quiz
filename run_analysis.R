xtrain=read.table(file.path("UCI HAR Dataset","train","X_train.txt"),header=FALSE)
ytrain=read.table(file.path("UCI HAR Dataset","train","Y_train.txt"),header=FALSE)
subjecttrain=read.table(file.path("UCI HAR Dataset","train","subject_train.txt"),header=FALSE)
xtest=read.table(file.path("UCI HAR Dataset","test","X_test.txt"),header=FALSE)
ytest=read.table(file.path("UCI HAR Dataset","test","Y_test.txt"),header=FALSE)
subjecttest=read.table(file.path("UCI HAR Dataset","test","subject_test.txt"),header=FALSE)
features=read.table(file.path("UCI HAR Dataset","features.txt"),header=FALSE)
activitylabels=read.table(file.path("UCI HAR Dataset","activity_labels.txt"),header=FALSE)

colnames(xtrain)=features[,2]
colnames(ytrain)="activityid"
colnames(subjecttrain)="subjectid"

colnames(xtest)=features[,2]
colnames(ytest)="activityid"
colnames(subjecttest)="subjectid"
colnames(activitylabels)<-c('activityid','activitytype')

mrgtrain=cbind(ytrain,subjecttrain,xtrain)
mrgtest=cbind(ytest,subjecttest,xtest)
finaldata=rbind(mrgtrain,mrgtest)

colnames=colnames(finaldata)
mean_std=(grepl("activityid",colnames)|grepl("subjectid",colnames)|grepl("mean..",colnames)|grepl("std..",colnames))
tms<-finaldata[,mean_std==TRUE]
setwithactivitynames=merge(tms,activitylabels,by='activityid',all.x=TRUE)
secondset<-aggregate(.~subjectid+activityid,setwithactivitynames,mean)
secondset<-secondset[order(secondset$subjectid,secondset$activityid),]
write.table(secondset,"secondtidyset.txt",row.name=FALSE)
