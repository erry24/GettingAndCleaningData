# Getting And Cleaning Data

**All files must be in the working directory.**


The program **run_analysis.R** creates the file: **activity_analysis.txt**

activity_analysis.txt can be read with the following command: 
my_data_frame <- read.table('activity_analysis.txt', header=TRUE)


Description of file: activity_analysis.txt
Wide format
88 Variables
subject : 1 - 30
activity_name: 6 activities
the remaining variables are numeric
they were extracted because they contained the string 'mean' or 'std'

The original files were concatenated:
X_test.txt
X_train.txt 

The subject and activity labels were each concatenated and added.

The mean was calculated on all numeric columns, grouped by subject and activity_name

The result is 180 rows with 88 variables: 30 subjects X 6 activity_names

Write file in working directory: activity_analysis.txt
Remove objects
