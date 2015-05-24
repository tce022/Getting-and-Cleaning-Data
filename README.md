#Repository contents and running scripts

This repository contains below files:
1. README.md - describes the contents of various files in the project
2. CodeBook.md - describes the data set generated and information regarding each variable
3. run_analysis.R - Script for generating data

##Getting data and script file
1. Download the data from link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Extract the data and place it in the folder "dataset"
3. place "run_analysis.R" in the same folder as "dataset" folder

##Running the script
1. Change the working directory to the folder containing dataset and run_analysis.R (cmd: setwd(<folderName>))
2. Install "plyr" package if it is not installed (cmd: install.packages("plyr")
3. type "source("run_analysis.R")" to obtain tidy dataset