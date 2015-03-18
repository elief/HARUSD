run_analysis <- function (){

	# **************** Step 0 ****************
	# ***validate folder and file existance***

	#folder <- "UCI HAR Dataset/"
	if (file.exists("UCI HAR Dataset/test/X_test.txt") 
		& file.exists("UCI HAR Dataset/test/y_test.txt") 
		& file.exists("UCI HAR Dataset/test/X_test.txt") 
		& file.exists("UCI HAR Dataset/test/subject_test.txt") 
		& file.exists("UCI HAR Dataset/train/X_train.txt")
		& file.exists("UCI HAR Dataset/train/y_train.txt")
		& file.exists("UCI HAR Dataset/train/subject_train.txt")
		& file.exists("UCI HAR Dataset/activity_labels.txt")
		& file.exists("UCI HAR Dataset/features.txt")){ 
		# check file existance within folder UCI HAR Dataset/
		x_test_file <- file("UCI HAR Dataset/test/X_test.txt")
		y_test_file <- file("UCI HAR Dataset/test/y_test.txt" )
		subject_test_file <- file("UCI HAR Dataset/test/subject_test.txt")
		x_train_file <- file("UCI HAR Dataset/train/X_train.txt")
		y_train_file <- file("UCI HAR Dataset/train/y_train.txt")
		subject_train_file <- file("UCI HAR Dataset/train/subject_train.txt")
		activity_labels_file <- file("UCI HAR Dataset/activity_labels.txt")
		features_file <- file("UCI HAR Dataset/features.txt")
	}
	else if (file.exists("test/X_test.txt") 
		& file.exists("test/y_test.txt") 
		& file.exists("test/X_test.txt") 
		& file.exists("test/subject_test.txt") 
		& file.exists("train/X_train.txt")
		& file.exists("train/y_train.txt")
		& file.exists("train/subject_train.txt")
		& file.exists("activity_labels.txt")
		& file.exists("features.txt")){
		# check file existance within current folder if UCI HAR Dataset/ does not exists
		x_test_file <- file("test/X_test.txt")
		y_test_file <- file("test/y_test.txt" )
		subject_test_file <- file("test/subject_test.txt")
		x_train_file <- file("train/X_train.txt")
		y_train_file <- file("train/y_train.txt")
		subject_train_file <- file("train/subject_train.txt")
		activity_labels_file <- file("activity_labels.txt")
		features_file <- file("features.txt")
	}
	else if (file.exists("getdata-projectfiles-UCI HAR Dataset.zip")){
		# check file existance of getdata-projectfiles-UCI HAR Dataset.zip if can not find unziped folder
		x_test_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/test/X_test.txt")
		y_test_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/test/y_test.txt" )
		subject_test_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/test/subject_test.txt")
		x_train_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/train/X_train.txt")
		y_train_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/train/y_train.txt")
		subject_train_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/train/subject_train.txt")
		activity_labels_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/activity_labels.txt")
		features_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/features.txt")
	}
	else if (file.exists("UCI HAR Dataset.zip")){
		# check file existance of UCI HAR Dataset.zip if can not find getdata-projectfiles-UCI HAR Dataset.zip
		x_test_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/test/X_test.txt")
		y_test_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/test/y_test.txt" )
		subject_test_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/test/subject_test.txt")
		x_train_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/train/X_train.txt")
		y_train_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/train/y_train.txt")
		subject_train_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/train/subject_train.txt")
		activity_labels_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/activity_labels.txt")
		features_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/features.txt")
	}
	else{ 
		# if can not find data anywhere, prompt to download data
		cat("Unfortunately we can not locate the data, Please choose one of the following options:\n",
		"1 - Download the file based on witch this function is build on from cloudfront.net\n",
		"2 - Download the original data file from archive.ics.uci.edu\n",
		"3 - Quit function without download any files\n")
		file_response <- readline("Please enter your choice:")
		if(file_response == "1"){ 
			# download data from cloudfront.net
			download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","getdata-projectfiles-UCI HAR Dataset.zip",mode = "wb")
			x_test_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/test/X_test.txt")
			y_test_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/test/y_test.txt" )
			subject_test_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/test/subject_test.txt")
			x_train_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/train/X_train.txt")
			y_train_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/train/y_train.txt")
			subject_train_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/train/subject_train.txt")
			activity_labels_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/activity_labels.txt")
			features_file <- unz("getdata-projectfiles-UCI HAR Dataset.zip", "UCI HAR Dataset/features.txt")
		}
		else if (file_response == "2"){
			# download data from archive.ics.uci.edu
			download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip","UCI HAR Dataset.zip",mode = "wb")
			x_test_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/test/X_test.txt")
			y_test_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/test/y_test.txt" )
			subject_test_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/test/subject_test.txt")
			x_train_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/train/X_train.txt")
			y_train_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/train/y_train.txt")
			subject_train_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/train/subject_train.txt")
			activity_labels_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/activity_labels.txt")
			features_file <- unz("UCI HAR Dataset.zip", "UCI HAR Dataset/features.txt")
		}
		else{ 
			# unable to download data, quit function
			stop("Unable to load the data, please manually download the data and try again, Thank you.")
		}
	}

	# **************** Step 1 ****************
	# **Load and merge the test and trainning data set :*

	# ********** Step 1.0 **********
	# *******get Dimenssions:*******
	# get the lable of activities that will later been used to proper lable the activity taken from y_file
	Actiivity_lable <- suppressWarnings(read.table(activity_labels_file))
	names(Actiivity_lable) <- c("Actiivity_id","Actiivity")
	Col_names <- suppressWarnings(read.table(features_file))
	names(Col_names) <- c("Col_index","Col_Name")

	# ********** Step 1.1 **********
	# ****Load test data set:*****

	# Looad Subject for each observation
	subject_test <- suppressWarnings(read.table(subject_test_file))
	# Looad Result for each observation
	x_test <- suppressWarnings(read.table(x_test_file))
	# Looad Activity for each observation
	y_test <- suppressWarnings(read.table(y_test_file))
	# Lable Results with Subject and Activity
	test <- cbind(Group = "test",Subject = subject_test,y_test,x_test)
	names(test) <- c("Group","Subject","Actiivity_id",as.character(Col_names[[2]]))

	# ********** Step 1.2 **********
	# **Load trainning data set:**
	subject_train <- suppressWarnings(read.table(subject_train_file))
	# Looad Result for each observation
	x_train <- suppressWarnings(read.table(x_train_file))
	# Looad Activity for each observation
	y_train <- suppressWarnings(read.table(y_train_file)	)
	# Lable Results with Subject and Activity
	train <- cbind(Group = "train",Subject = subject_train,y_train,x_train)
	names(train) <- c("Group","Subject","Actiivity_id",as.character(Col_names[[2]]))

	# ********** Step 1.3 **********
	# ****Merge two data sets :*****
	Merged <- rbind(test,train)


	# ********** Step 2 **********
	# Extracts only the measurements on the mean and standard deviation for each measurement
	# by filter the results columns only taking columns containnig mean() or std() in the name, keeping lable columns
	Merged_mean_std_only <- Merged[grep("mean\\(\\)|std\\(\\)|Group|Subject|Actiivity_id",names(Merged),value = TRUE)]


	# **************** Step 3 ****************
	# Proper lable the activity with the dimenssion table generated in step 0
	Merged_mean_std_only_labed <- merge(Actiivity_lable,Merged_mean_std_only)[2:ncol(merge(Actiivity_lable,Merged_mean_std_only))]# removing the 1st column Actiivity_id


	# **************** Step 4 ****************
	# Modify the column name to improve readability by 
	# 	1) Add "mean." as pre-fix to indicate the result to be average 
	#	2)remove "()" 
	#	3)replacing "-" with "."

	names(Merged_mean_std_only_labed)<-c(names(Merged_mean_std_only_labed)[1:3],# id Column name unchanged
		paste("mean", # Add mean prfix indicating the result to be average
			gsub("\\(|\\)","", #remove "()"
				gsub("-",".", # replace "-" with "."
					names(Merged_mean_std_only_labed)[4:length(names(Merged_mean_std_only_labed))] # measurement columns
					)),sep = "."))

	# **************** Step 5 ****************
	# **Calculate the average of each variable by Subject by Activity:
	Merged_Mean <- aggregate(Merged_mean_std_only_labed[,4:(ncol(Merged_mean_std_only_labed))],#aggregate measurement columns
						by = list(Subject=Merged_mean_std_only_labed$Subject,Actiivity=Merged_mean_std_only_labed$Actiivity),#by Subject and Activty
						FUN = mean) # calculate the average(mean)

	# Return result
	Merged_Mean
}

HARUSD <- run_analysis()
