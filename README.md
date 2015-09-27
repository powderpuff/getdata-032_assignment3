The run_analysis.R script takes the data provided for the assignment and run through a series of steps to create a new data table which contains the average of the mean and the stadard deviation measurements by the subject id and the activity type.

The script performs the following functions:
* Import x_train.txt to a data table, combine with the subject column and activity column.
* Do the same for the test data x_test.txt.
* Combine training data with test data using row combine.
* Add the proper column names to the combined data using the information from features.txt.
* Find the column names that ends in -mean() and -std(). 
* Use the above information to subset the combined data to those columns that contains -mean() and -std() plus subject and activity.
* Substitute the numeric activity values to the descriptive text.
* Create a new data table dt_avg which takes average of the above table by the subject id and the activity.
* Rename the column of dt_avg by prepending "avg" to the old column name to indicate the values represent average of the mean and std measurments except for the subject and activity columns.
* Write dt_avg to a text file.


