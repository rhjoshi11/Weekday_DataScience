#R Training Kelly HW 1 Group 5
install.packages("ggplot2")
library(ggplot2)
getwd()
setwd("C:/Users/rajan/Desktop/R Training/HW1")
MBA_Salaries = read.csv("MBA Starting Salaries Data.csv", header = T)

#variable structure and discription
summary(MBA_Salaries)
ls(MBA_Salaries)
str(MBA_Salaries$age)
str(MBA_Salaries$gmat_tot)
str(MBA_Salaries$work_yrs)
str(MBA_Salaries$salary)

#all variable above are numeric datatypes

#age
avg_age = mean(MBA_Salaries$age)
var_age = var(MBA_Salaries$age)
std_dev_age = sqrt(var_age)
#the std deviation is age is
print("The standard deviation is age is") 
std_dev_age

#very important...when drawing a histogram you have to get the frequency table before using barplot()
hist(MBA_Salaries$age) # left-skewed graph because mean < median
boxplot(MBA_Salaries$age) #we see some outliers in age being greater thatn Q3
boxplot(MBA_Salaries$age)

#can't get the line graph a.k.a. polygon freq graph to display!!!!!!!!!!!!!
plot(table(MBA_Salaries$age))

#got it
plot(table(MBA_Salaries$age), type = "l", col="red", xlab = "age", ylab="frequency")

#wrong method to get the frequency histogram
barplot(MBA_Salaries$age)
#right method
table(MBA_Salaries$age)
barplot(table(MBA_Salaries$age))


#gmat_tot
#seems close to a normal dist.
avg_gmat_tot = mean(MBA_Salaries$gmat_tot)
avg_gmat_tot
var_gmat_tot = var(MBA_Salaries$gmat_tot)
std_dev_gmat_tot = sqrt(var_gmat_tot)
std_dev_gmat_tot

table(MBA_Salaries$gmat_tot)
plot(table(MBA_Salaries$gmat_tot), type = "l")
barplot(table(MBA_Salaries$gmat_tot))

#avg_work_yrs
#left skewed mean<median
avg_work_yrs = mean(MBA_Salaries$work_yrs)
avg_work_yrs
var_work_yrs = var(MBA_Salaries$work_yrs)
std_dev_work_yrs = sqrt(var_work_yrs)
std_dev_work_yrs

table(MBA_Salaries$work_yrs)
plot(table(MBA_Salaries$work_yrs), type = "l")
barplot(table(MBA_Salaries$work_yrs))

#all the steps above had the full dataframe

#salary
#remove the bad data in salary variable
#what about all the 0's should I not consider them in the summary statistics since the 0 will skew the data. 
# I believe getting a true representation of salary is getting the salary of those individuals who currently are in the workforce so salary>0
# Salaries of 0 are unemployed and seeking employment

#salary without removing the 0, 998, 999
skewed_salary_mean = mean(MBA_Salaries$salary)
skewed_salary_mean

#remove the salary rows with 0, 998, 999
df1 = subset(MBA_Salaries, salary != 999)
df2 = subset(df1, salary != 998)
df3 = subset(df2, salary != 0)

salary_mean
real_avg_salary = mean(df3$salary)
real_avg_salary
var_salary = var(df3$salary)
std_dev_salary = sqrt(var(df3$salary))

#hist and barplots
boxplot(df3$salary) #with box and whisker plot easily see the outliers falling outside Q1 and Q3
barplot(table(df3$salary))
plot(table(df3$salary), type = "l")


#fit = lm(df3$salary ~ df3$gmat_tot)
#summary(fit)

