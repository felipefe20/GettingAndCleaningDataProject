---
title: "README"
author: "Oscar Felipe Fernandez"
date: "18/7/2020"
output: html_document
---

## Getting and Cleaning Data - Project - Coursera 
* Course project for Getting and Cleaning Data Coursera.Data Science Specialization.
* run_analysis.R script conducts the following once you have downloaded the dataset:
  
1. Read both the train and test datasets and merge them into measurements, activity, subjects.
2. Load the data feature, activity info and extract columns named 'mean' and 'standard'. 
3. Modify column names to descriptive. (t to time, f to frequency, Acc to Accelerometer, Gyro to gyroscope and Mag to Magnitude)
4. Extract data by selected columns, and merge x, y(activity) and subject data. 
5. Replace activity column name to "activity" and factor by classes.
6. Generate 'Tidy Dataset' with the average mean of each variable by subject and activity. 
7. Tidydata file in tidydata.txt.