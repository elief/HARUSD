
Dataset Introduction
====================

The script is analysing the data set from "Human Activity Recognition Using Smartphones"
Conducted by :<br>
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)<br>
1. Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. <br>
2.CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain<br>
activityrecognition '@' smartlab.ws

For more details regarding the data set being used in the script please refer to [this website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
original data set can be downloaded [here](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)

The script is build based on a copy of the original dataset provided by the Coursera Course Getting and Cleaning Data conducted by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
this copy of the data set can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


#####The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

#####The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


#####Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. <br>

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). <br>

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). <br>

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.<br>

-	tBodyAcc-XYZ
-	tGravityAcc-XYZ
-	tBodyAccJerk-XYZ
-	tBodyGyro-XYZ
-	tBodyGyroJerk-XYZ
-	tBodyAccMag
-	tGravityAccMag
-	tBodyAccJerkMag
-	tBodyGyroMag
-	tBodyGyroJerkMag
-	fBodyAcc-XYZ
-	fBodyAccJerk-XYZ
-	fBodyGyro-XYZ
-	fBodyAccMag
-	fBodyAccJerkMag
-	fBodyGyroMag
-	fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation

#####License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

#####Other Related Publications:
[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz.  Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care.   Volume 19, Issue 9. May 2013

[3] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223. 

[4] Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Catal�. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.  

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita and Xavier Parra. November 2013.



Code book
====================

####"run_analysis.R" scripte

The original data provided in the dataset is collected through an experiments with 30 volunteers by measuring the signals when they performing 6 different activities.<br>
The signals are then going through several step of transformation (which already conducted in the previous dataset)<br>
The script does the following:<br>
**Step 1** - Check if the dataset file already exists in the working directory, if no, will prompt to download either the version from cloudfront.net or archive.ics.uci.edu<br>
**Step 2** - Merge the data in subject_,y_,x_ data stored in test and train folder , and lable the variables based on the columne name provided in features.txt<br>
**Step 3** - Combine the test and train folder together into one dataset. and lable the activty based on the lable provided in activity_labels.txt<br>
**Step 4** - Take the Average of Mean and Standard deviation of each measurements by Subject by Activity.<br>
**Step 5** - Return the dataset produced in step 4 in a variable named "HARUSD" (no quotes).<br> 


####The Full dataset (dataset provided in **Step 3**):<br>
It contains all the measurements provided in original dataset measured on Mean and Standard Deviation of each measurements with 3 dimensions:<br>
-	**Group**			character value with "test" or "train" indicating from which subset the data come from<br>
-	**Subject**			numeric, indication the number represents the Volunteer performed the test<br>
-	**Actiivity**		character value with 6 values, indicating the Activity performed for the test as mentioned in "activity_labels.txt" file<br>

The non-dimenssional variables conatained in the dataset (total 66) are based on the feature provided in "features.txt" <br>
Column names are proccessed by: 
-	replacing the '-' with '.'  to improve readability 
-	removing '()' to improve readability <br>
For more detail related to each of these variables, please refer to the **Feature Selection** Section in Dataset Introduction
or "features_info.txt" files included in the dataset<br>


####The tidy dataset (dataset provided in **Step 4**):<br>
It summarize the Average of Mean and Standard deviation of each measurements by Subject by Activity with 2 dimensions:<br>
-	**Subject**			numeric, indication the number represents the Volunteer performed the test<br>
-	**Actiivity**		character value with 6 values, indicating the Activity performed for the test as mentioned in "activity_labels.txt" file<br>


The non-dimenssional variables conatained in the dataset (total 66) are based on the feature provided in "features.txt"<br>
Column names are proccessed by: 
-	replacing the '-' with '.'  to improve readability 
-	removing '()' to improve readability 
-	added "mean." at beginning to indicates it the Average of the variable by dimenssion.<br>
For more detail related to each of these variables, please refer to the **Feature Selection** Section in Dataset Introduction
or "features_info.txt" files included in the dataset<br>
