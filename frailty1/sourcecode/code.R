# Load the data into a data frame
data <- read.csv("/Users/bhashithajagarlamudi/Desktop/data/rawdata/raw_frailty_data1.csv")

# Remove any rows with missing values
data <- na.omit(data)

# Convert the Frailty column to a binary indicator variable
data$Frailty <- ifelse(data$Frailty == "Y", 1, 0)

# Scale the numeric variables to have mean 0 and standard deviation 1
#data[, 1:4] <- scale(data[, 1:4])

# View the first few rows of the data frame
head(data)

# Save the preprocessed data to a new CSV file
write.csv(data, "/Users/bhashithajagarlamudi/Desktop/data/cleandata/clean_data.csv", row.names=FALSE)

install.packages("ggplot2")
install.packages("dlpyr")
install.packages("tidyr")

# Load the required libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Load the preprocessed data from the CSV file
data2 <- read.csv("/Users/bhashithajagarlamudi/Desktop/data/cleandata/clean_data.csv")

# Check the summary statistics of the data
summary(data2)

# Create a scatterplot matrix of the numeric variables
ggplot(data2, aes(x = Age, y = Grip.strength)) +
  geom_point(aes(color = factor(Frailty))) +
  facet_grid(~ Frailty) +
  labs(title = "Scatterplot Matrix of Numeric Variables", x = "Age", y = "Grip Strength")
ggsave("/Users/bhashithajagarlamudi/Desktop/data/results/gp_scatterplot.png")

# Create a histogram of the Age variable
ggplot(data2, aes(x = Height..Inches., fill = factor(Frailty))) +
  geom_histogram(binwidth = 0.5, position = "dodge") +
  labs(title = "Histogram of Height", x = "Height(in Inches)", y = "frailty", fill = "Frailty")
ggsave("/Users/bhashithajagarlamudi/Desktop/data/results/gp_histogram.png")

# Create a boxplot of the Grip.strength variable
ggplot(data, aes(x = factor(Frailty), y = Weight..Pounds., fill = factor(Frailty))) +
  geom_boxplot() +
  labs(title = "Boxplot of Weight", x = "Frailty", y = "Weight(in Pounds)", fill = "Frailty")
ggsave("/Users/bhashithajagarlamudi/Desktop/data/results/gp_boxplot.png")

# Create a density plot of the Grip.strength variable
ggplot(data2, aes(x = Grip.strength, fill = factor(Frailty))) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot of Grip Strength", x = "Grip Strength", y = "Density", fill = "Frailty")
ggsave("/Users/bhashithajagarlamudi/Desktop/data/results/gp_densityplot.png")

# Perform a t-test to compare the Grip.strength between the Frailty groups
ttest_results <- t.test(data$Grip.strength ~ data$Frailty)
print(ttest_results)

# Save the test results to a text file
result_text <- capture.output(print(ttest_results))
writeLines(result_text, "/Users/bhashithajagarlamudi/Desktop/data/results/testresults.txt")
