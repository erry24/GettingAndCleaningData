# Getting And Cleaning Data

**All files must be in the working directory**


The program **run_analysis.R** creates the file: **activity_analysis.txt**

**activity_analysis.txt** can be read with the following command: <br>
**my_data_frame <- read.table('activity_analysis.txt', header=TRUE)**
<br>
<br>
Description of file: activity_analysis.txt <br>
Wide format<br>
88 Variables<br>
subject : 1 - 30<br>
activity_name: 6 activities<br>
the remaining variables are numeric<br>
they were extracted because they contained the string 'mean' or 'std'<br>
<br>
The original files were concatenated:<br>
X_test.txt<br>
X_train.txt <br>

The subject and activity labels were each concatenated and added. <br>

Result: <br>
The mean was calculated on all numeric columns, grouped by subject and activity_name <br>

The result is 88 variables with 180 rows:<br> 30 subjects X 6 activity_names

Write file in working directory: <br> 
**activity_analysis.txt**
<br>
Remove objects except result data frame: **activity_analysis**
