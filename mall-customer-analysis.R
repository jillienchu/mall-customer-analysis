install.packages("dplyr")
install.packages("tidyr")
install.packages("magrittr")
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("ggrepel")
install.packages("ggthemes")
install.packages("gmodels")
library(dplyr)
library(tidyr)
library(magrittr)
library(ggplot2)
library(tidyverse)
library(ggrepel)
library(ggthemes)
library(gmodels)
print("Week 1")
ds <- read.csv("/Users/jillienchu/Desktop/ALY6010/Week 1/Mall_Customers.csv", header = T, sep = ',')
ds
head(ds)
summary(ds)
str(ds)
ds$CustomerID <- NULL
df <- ds %>%
  rename(Annual_Income_in_thousands = Annual.Income..k.., Spending_Score_1to100 = Spending.Score..1.100.)
df
df$Gender = gsub('Male', 'M', df$Gender)
df$Gender = gsub('Female', 'F', df$Gender)
df$Gender = as.character(df$Gender)
fem <- subset(df, df$Gender == "F")
head(fem)
male <- subset(df, df$Gender == "M")
head(male)
df$Gender <- as.factor(df$Gender)
class(df$Gender)
data_gender <- table(df$Gender)
data_gender
plot1 = barplot(data_gender, xlab = "Gender", ylab = "Count", main = "Plot 1: Gender Plot for Mall Customers", col = "red", ylim = c(0,150)) #Plot for gender mall customers
box(col = "grey") 
age = table(df$Age)
age = as.data.frame(age)
fre = age$Freq
fre
names(age)[1] <- "Age"
names(age)[2] <- "Frequency"
age
income = table(df$Annual_Income_in_thousands)
income = as.data.frame(income)
names(income)[1] <- "Annual_Income_in_thousands"
names(income)[2] <- "Frequency"
income
class(income)
#To check the frequency table difference if the Annual Income was of character instead of integer
df$Annual_Income_in_thousands = as.character(df$Annual_Income_in_thousands)
income2 = table(df$Annual_Income_in_thousands)
income2 = as.data.frame(income2)
names(income2)[1] <- "Annual_Income_in_thousands"
names(income2)[2] <- "Frequency"
income2
df$Annual_Income_in_thousands = as.integer(df$Annual_Income_in_thousands)
ss = table(df$Spending_Score_1to100)
ss = as.data.frame(ss)
names(ss)[1] <- "Spending_Score_1to100"
names(ss)[2] <- "Frequency"
ss
age_score <- table(df$Age, df$Spending_Score_1to100)
age_score = as.data.frame(age_score)
names(age_score)[1] <- "Age"
names(age_score)[2] <- "Spending_Score"
names(age_score)[3] <- "Frequency"
age_score
gender_age <- table(df$Gender, df$Age)
gender_age = as.data.frame(gender_age)
names(gender_age)[1] <- "Gender"
names(gender_age)[2] <- "Age"
names(gender_age)[3] <- "Frequency"
gender_age
gender_income <- table(df$Gender, df$Annual_Income_in_thousands)
gender_income = as.data.frame(gender_income)
names(gender_income)[1] <- "Gender"
names(gender_income)[2] <- "Annual Income in thousands($)"
names(gender_income)[3] <- "Frequency"
gender_income
xtabs( ~ Gender + Age + Annual_Income_in_thousands, data = df)
xtabs( ~ Age + Spending_Score_1to100 + Gender, data = df)
CrossTable(df$Annual_Income_in_thousands, df$Gender)
CrossTable(df$Spending_Score_1to100, df$Gender)
class(df$Age)
plot2 = ggplot(data = df, aes(Age)) + geom_histogram(breaks=seq(0, 80, by=2), col = "green", aes(fill=..count..), alpha = .5) + scale_fill_gradient("Count", low = "red", high = "blue") + labs(title = "Plot 2: Histogram for Age", x="Customer Age", y="Count") + xlim(c(10,80)) + ylim(c(0,15))
plot2
#plot3 = hist(df$Annual_Income_in_thousands, main = "Plot 3: Annual Income of Mall Customers", xlim = c(0, 150), ylim = c(0, 40), xlab  = "Annual Income in Thousands ($)", ylab = "Frequency", col = "cadetblue") #Histogram for Mall Customers' Annual Income
#box(col = "black")
plot3 = ggplot(data = df, aes(Annual_Income_in_thousands)) + geom_histogram(breaks=seq(0, 100, by=2), col = "green", aes(fill=..count..), alpha = .5) + scale_fill_gradient("Count", low = "yellow", high = "blue") + labs(title = "Plot 3: Histogram for Annual Income of Mall Customers", x="Customer Annual Income (in thousands $)", y="Count") + xlim(c(10, 80)) + ylim(c(0, 15))
plot3
plot4 = hist(df$Spending_Score_1to100, main = "Plot 4: Plot for Spending Score", xlim = c(0, 100), ylim = c(0, 50), col = "light blue", xlab = "Spending Score of Customers", ylab = "Frequency")
box(col = "black")
plot5 = plot(df$Annual_Income_in_thousands, df$Spending_Score_1to100, main = "Plot 5: Scatter plot for Annual Income with Spending Scores", xlim = c(0, 90), ylim = c(0, 100), pch=20, col = "cadet blue", xlab="Annual Income (in thousand dollars)", ylab="Spending Score (1 to 100)")


