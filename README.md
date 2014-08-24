Getting and Cleaning Data - Course Project Readme
================================

Course Project for the Coursera Course - Getting and Cleaning Data 
      
      (getdata-006)

Full description of the dataset was obtained from the following link:-
    
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data was downloaded from the following link:-

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Running Script
================================
cloning my repository
    
    git clone https://github.com/dumbledorearmy/GettingCleaningDataCourseProject.git

Alternatively download "run_analysis.R" from my repository to the folder where UCI HAR Dataset is unzipped

It should be in the folder .\UCI HAR Dataset or it will not work

Then run the following commands
    
    source("run_analysis.R")
    
    run_analysis()

The second command runs the function which generates 

    "tidyoutput.txt" 
as the required output file in the working directory

Please see 

      "CodeBook.md" 

for description of 

      "tidyoutput.txt"
