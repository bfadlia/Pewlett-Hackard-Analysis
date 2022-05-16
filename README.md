# Pewlett-Hackard-Analysis

## **Overview of Project**

The purpose of this project  is to do a Database analysis that prepares Pewlett Hackard for the upcoming Silver Tsunami where a large number of employees will start retiring in the next few years and the company wants to be prepared for filling the the positions that will vacate as well as have the adequate training and mentorship programs ready for a smooth transition.
The focus of the analysis is as follows: 

-	Identify the retiring employees by  title.
-	Identify the employees eligible to be part of the mentorship program.
-	Identify roles that need to be filled grouping them by title and department.
-	Identify qualifiedemployees who can mentor the next generation of employees grouped by title and department.

## Results

 ### 1.1 
 The first part of the first requirement of the project listed retirement eligible employees and their titles.
   The query finds 133776 such employees however there are duplicates due to employees having multiple titles when they get promoted or transfered.
   
  ![IMAGE_DESCRIPTION](/Data/retirement_titles.png)


 ### 1.2
 A second query removes those duplicates using the DISTINCT ON keyword. This reveals there are only 90398 unique emplyees who are retirement eligible
 
 ![IMAGE_DESCRIPTION](/Data/unique_titles.png)
 
 ### 1.3
 A third query retrieves the number of employees by their most recent job title who are about to retire.
 The query reveals that some job titles like senior engineers have thousands of people retiring while other titles like manager only have a handful, so the Silver Tsuname hits differently for different titles.
 ![IMAGE_DESCRIPTION](/Data/retiring_titles.png)
 


## Summary


