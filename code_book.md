Code Book

This code book will describe the data used in the project included in Getting and Cleaning Data, as well as the processing required to create the resulting tidy data set.

Overview

The datasets used in this project comes from the experiments run on 30 volunteers wearing Samsung smartphones on their waist performing six different kinds of activities.  

Data collection

The following data were collected: 
 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables. 

- Its activity label. 
- An identifier of the subject who carried out the experiment.

It is stored in the following datasets:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Processing Steps

1. Read all datasets into data frames and assign columns proper names
2. Select only mean and standard deviation measurements
3. Give all data frames indexes so we can merge them together
4. Drop index after merge
5. Give activity descriptive names
6. Create the separate tidy table with the average of each variable for each activity and each subject.

Data Not Used

This analysis was performed using only the files above, and did not use the raw signal data. Therefore, the data files in the "Inertial Signals" folders were ignored.


