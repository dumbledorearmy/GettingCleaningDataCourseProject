Getting and Cleaning Data - Course Project Code Book
================================

Variables
================================

    ActivityID

This is one of the following - 1,2,3,4,5 and 6. 

    ActivityLabel
This is according to the value of ActivityID
1 - WALKING, 2 - WALKING_UPSTAIRS, 3 - WALKING_DOWNSTAIRS, 4 - SITTING, 5 - STANDING, 6 - LAYING

    Subject
This identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
    
    Please note - Variable name starting with "t" denotes time variable and "f" denotes freqency variable.
    Variable name ending or containing "Mean" is the mean value for that variable and ending or containing "Std" 
    is the standard deviation value for that variable.
    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    Body Acceleration Signals
        tBodyAccMean-XYZ
        tBodyAccStd-XYZ
    
    Gravity Acceleration Signals
        tGravityAccMean-XYZ
        tGravityAccStd-XYZ

    Body linear acceleration and angular velocity were derived in time to obtain Jerk signals    
        tBodyAccJerkMean-XYZ
        tBodyAccJerkStd-XYZ
        tBodyGyroMean-XYZ
        tBodyGyroStd-XYZ
        tBodyGyroJerkMean-XYZ
        tBodyGyroJerkStd-XYZ
        
    Magnitude of these three-dimensional signals were calculated using the Euclidean norm
        tBodyAccMagMean
        tBodyAccMagStd
        tGravityAccMagMean
        tGravityAccMagStd
        tBodyAccJerkMagMean
        tBodyAccJerkMagStd
        tBodyGyroMagMean
        tBodyGyroMagStd
        tBodyGyroJerkMagMean
        tBodyGyroJerkMagStd
    
    Fast Fourier Transform (FFT) was applied to signals above producing similar signals in frequency domain
        fBodyAccMean-XYZ
        fBodyAccStd-XYZ
        fBodyAccJerkMean-XYZ
        fBodyAccJerkStd-XYZ
        fBodyGyroMean-XYZ
        fBodyGyroStd-XYZ
        fBodyAccMagMean
        fBodyAccMagStd
        fBodyAccJerkMagMean
        fBodyAccJerkMagStd
        fBodyGyroMagMean
        fBodyGyroMagStd
        fBodyGyroJerkMagMean
        fBodyGyroJerkMagStd

Data
================================
Full description of the dataset was obtained from the following link:-

    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data was downloaded from the following link:-

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Transformations (Also see comments in "run_analysis.R" file for complete understanding
================================
Steps included combining training and test data for features (only mean and standard deviation features), activity ID's, activity labels and subjects. These were all combined into a single dataset and the melt+dcast function was used to summarize information by Activity Label and Subject. Output is a tidy data file as expected - average of each variable for each activity and each subject.
