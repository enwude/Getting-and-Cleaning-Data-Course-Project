---
title: "**CODE BOOK**"
author: "Ejike Nwude"
date: "Saturday, July 25, 2015"
output: html_document
---

# CODE BOOK FOR HUMAN ACTIVITY RECOGNITION USING SMARTPHONES DATA SET

## Data Set Information

This is a code book that describes the variables, the data, and any transformations or work that have been performed to clean up the original dataset. 
Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

*A full description of that dataset can be obtained at the following website:* 
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

`The dataset includes the following files:`

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

`The following files are available for the train and test data. Their descriptions are equivalent:` 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## Variables

The variables for the smartphones tidy dataset are as follows:

* Subject
* Activity
* timeBodyAccelerometer-mean()-XYZ
* timeBodyAccelerometer-std()-XYZ
* timeGravityAccelerometer-mean()-XYZ
* timeGravityAccelerometer-std()-XYZ
* timeBodyAccelerometerJerk-mean()-XYZ
* timeBodyAccelerometerJerk-std()-XYZ
* timeBodyGyroscope-mean()-XYZ
* timeBodyGyroscope-std()-XYZ
* timeBodyGyroscopeJerk-mean()-XYZ
* timeBodyGyroscopeJerk-std()-XYZ
* timeBodyAccelerometerMagnitude-mean()
* timeBodyAccelerometerMagnitude-std()
* timeGravityAccelerometerMagnitude-mean()
* timeGravityAccelerometerMagnitude-std()
* timeBodyAccelerometerJerkMagnitude-mean()
* timeBodyAccelerometerJerkMagnitude-std()
* timeBodyGyroscopeMagnitude-mean()
* timeBodyGyroscopeMagnitude-std()
* timeBodyGyroscopeJerkMagnitude-mean()
* timeBodyGyroscopeJerkMagnitude-std()
* frequencyBodyAccelerometer-mean()-XYZ
* frequencyBodyAccelerometer-std()-XYZ
* frequencyBodyAccelerometerJerk-mean()-XYZ
* frequencyBodyAccelerometerJerk-std()-XYZ
* frequencyBodyGyroscope-mean()-XYZ
* frequencyBodyGyroscope-std()-XYZ
* frequencyBodyAccelerometerMagnitude-mean()
* frequencyBodyAccelerometerMagnitude-std()
* frequencyBodyAccelerometerJerkMagnitude-mean()
* frequencyBodyAccelerometerJerkMagnitude-std()
* frequencyBodyGyroscopeMagnitude-mean()
* frequencyBodyGyroscopeMagnitude-std()
* frequencyBodyGyroscopeJerkMagnitude-mean()
* frequencyBodyGyroscopeJerkMagnitude-std()

*Note: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.*

        The following set of variables were extracted for each measurement:
        
                Mean() - Mean of each measurement
                Std() - Standard Deviation of each measurement
                

## Data Transformations

The following transformations were carried out on the original data set to clean up the data:

* Dataset was read converted to a data frame and wrapped in a data frame tbl using tbl_df
* Training and Test Data were row bound together using bind_rows to create single Subjects, Activities and Features
* Variables were renamed with descriptive names to improve readability
* Subjects, Activities and Features were merged into one dataset using bind_cols to bind the respective columns
* Measurements on the mean and standard deviation for each measurement were extracted to create a new dataset
* Activities were renamed to with descriptive names to show the corresponding activities undertaken by each subject
* The features variables were renamed to provide more descriptive names
* A new independent tidy dataset was created as a txt file using write.table

