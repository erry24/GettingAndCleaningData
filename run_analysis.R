# Files must be in your working directory  
# setwd("~/DataScience/Getting and Cleaning Data/Assignment")

library(data.table)
library(dplyr)


# Common data files
features = read.table("features.txt")
activity_labels = read.table("activity_labels.txt")

# Test data files
subject_test = read.table("subject_test.txt")
X_test = read.table("X_test.txt")
y_test = read.table("y_test.txt")

# Train data files
subject_train = read.table("subject_train.txt")
X_train = read.table("X_train.txt")
y_train = read.table("y_train.txt")

# Rename Activity Label numbers with Descriptive names as specified in: activity_labels
y_test_activity_labels <- y_test

y_test_activity_labels$V1[y_test_activity_labels$V1=="1"] <- "WALKING"
y_test_activity_labels$V1[y_test_activity_labels$V1=="2"] <- "WALKING_UPSTAIRS"
y_test_activity_labels$V1[y_test_activity_labels$V1=="3"] <- "WALKING_DOWNSTAIRS"
y_test_activity_labels$V1[y_test_activity_labels$V1=="4"] <- "SITTING"
y_test_activity_labels$V1[y_test_activity_labels$V1=="5"] <- "STANDING"
y_test_activity_labels$V1[y_test_activity_labels$V1=="6"] <- "LAYING"


y_train_activity_labels <- y_train

y_train_activity_labels$V1[y_train_activity_labels$V1=="1"] <- "WALKING"
y_train_activity_labels$V1[y_train_activity_labels$V1=="2"] <- "WALKING_UPSTAIRS"
y_train_activity_labels$V1[y_train_activity_labels$V1=="3"] <- "WALKING_DOWNSTAIRS"
y_train_activity_labels$V1[y_train_activity_labels$V1=="4"] <- "SITTING"
y_train_activity_labels$V1[y_train_activity_labels$V1=="5"] <- "STANDING"
y_train_activity_labels$V1[y_train_activity_labels$V1=="6"] <- "LAYING"

# Union all (concatenate) Test and Training sets 
X_union <- rbind(X_test, X_train)
# Union all (concatenate) Test and Training subjects 
subject_union <- rbind(subject_test, subject_train)
# Union all (concatenate) Test and Training activity labels 
activity_labels_union <- rbind(y_test_activity_labels, y_train_activity_labels)

#Create valid and unique column names from: features 
features_valid <- make.names(as.vector(features$V2), unique=TRUE)
# Rename X_union column names with column names in: features_valid
setnames(X_union, old = names(X_union), new = features_valid)

# Extract the columns containing MEAN and STD (86)
X_union_df <- tbl_df(X_union)
X_union_ms <- X_union_df %>%
  select(contains('Mean'), contains('Std'))

# Add columns (with contents): subject and activity.name         
X_union_ms[, "subject"] <- as.vector(subject_union$V1)         
X_union_ms[, "activity.name"] <- as.vector(activity_labels_union$V1)

# Calculate the mean on all numeric variable and group by subject and activity 
by_X_union_ms <- X_union_ms %>% group_by(subject, activity.name)
activity_analysis <-by_X_union_ms %>% summarise_each(funs(mean(., na.rm = TRUE)))

# Write file in working directory: activity_analysis.txt
write.table(activity_analysis, file = "activity_analysis.txt", row.names = FALSE)

# Clean up, remove objects
rm(activity_labels)                          
rm(features)                           
rm(subject_train)                      
rm(X_union_df)                         
rm(y_test)                             
rm(X_test)                             
rm(y_train_activity_labels) 
rm(activity_labels_union)   
rm(features_valid)          
rm(subject_union)           
rm(X_train)                 
rm(X_union_ms)              
rm(y_test_activity_labels)  
rm(by_X_union_ms) 
rm(subject_test)  
rm(X_union)       
rm(y_train) 


            


         