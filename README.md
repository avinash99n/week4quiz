# week4quiz
the first 8 lines of the code in the run_analysis.R file about loading the data from the UCI HAR Dataset directory.the respective names to which they are assigned are described in the coodbook.
since the tables dint contain the colnames we have intialize the colnames by using the files given in the directory and for activitylabel we have named it for ourselves.
there are two types of datasets here,train&test,we need to merge them both.but,before that to make train dataset we need to merge xtrain,ytrain,subjecttrain and similarly for the test dataset we need to merge xtest,ytest,subjecttest.
then the above two datasets are merged into one file.
and now for this new data set we find the independent tidy data set with the average of each variable for each activity and each subject.

