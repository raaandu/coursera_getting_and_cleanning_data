# Getting and Cleaning Data Course Project - Samsung Wearables

Dataset source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files
code_book.md - a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

run_analysis.R - it performs the following steps to process the data
  1.	Read all datasets into data frames and assign columns proper names
  2.	Select only mean and standard deviation measurements
  3.	Give all data frames indexes so we can merge them together
  4.	Drop index after merge
  5.	Give activity descriptive names
  6.	Create the separate tidy table with the average of each variable for each activity and each subject.

final_text.txt - the final text output as described in project requirement.
