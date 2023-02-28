# Load the required library
library(dplyr)

# Read the dataset
student_data <- read.csv("/Users/bhashithajagarlamudi/Desktop/Data1/rawdata/StudentsPerformance.csv")

# Remove any missing values
student_data <- na.omit(student_data)

# Rename the columns to make them more readable
colnames(student_data) <- c("Gender", "Race_Ethnicity", "Parent_Education", "Lunch", "Test_Preparation", "Math_Score", "Reading_Score", "Writing_Score")

# Remove any white spaces from the columns
student_data$Gender <- trimws(student_data$Gender)
student_data$Parent_Education <- trimws(student_data$Parent_Education)
student_data$Race_Ethnicity <- trimws(student_data$Race_Ethnicity)
student_data$Lunch <- trimws(student_data$Lunch)
student_data$Test_Preparation <- trimws(student_data$Test_Preparation)

# Convert the Race/Ethnicity column to factor variable
student_data$Race_Ethnicity <- as.factor(student_data$Race_Ethnicity)

# Save the clean data to a CSV file
write.csv(student_data, "/Users/bhashithajagarlamudi/Desktop/Data1/cleandata/clean_data.csv", row.names = FALSE)


library(ggplot2)
student_data <- read.csv("/Users/bhashithajagarlamudi/Desktop/Data1/rawdata/StudentsPerformance.csv")
head(student_data)

ggplot(student_data, aes(x = writing.score, y = reading.score)) +
  geom_point(aes(color = gender)) +
  labs(x = "writing score", y = "Reading Score", color = "Gender") +
  ggtitle("writing Score vs Reading Score by Gender")
ggsave("/Users/bhashithajagarlamudi/Desktop/Data1/results/graph.png")

ggplot(student_data, aes(x = race.ethnicity, y = reading.score)) +
  geom_boxplot(aes(fill = race.ethnicity)) +
  labs(x = "Race/Ethnicity", y = "Reading Score", fill = "Race/Ethnicity") +
  ggtitle("Reading Score by Race/Ethnicity")
ggsave("/Users/bhashithajagarlamudi/Desktop/Data1/results/graph1.png")

ggplot(student_data, aes(x = parental.level.of.education, fill = test.preparation.course)) +
  geom_bar(position = "dodge") +
  labs(x = "Parental Level of Education", y = "Count", fill = "Test Preparation Course") +
  ggtitle("Test Preparation Course by Parental Level of Education")
ggsave("/Users/bhashithajagarlamudi/Desktop/Data1/results/graph2.png")

ggplot(student_data, aes(x = math.score)) +
  geom_density(aes(color = gender)) +
  labs(x = "Math Score", y = "Density", color = "Gender") +
  ggtitle("Density of Math Scores by Gender")
ggsave("/Users/bhashithajagarlamudi/Desktop/Data1/results/graph3.png")

ggplot(student_data, aes(x = gender, fill = factor(lunch))) +
  geom_bar() +
  labs(x = "gender", y = "Count", fill = "Lunch") +
  ggtitle("Lunch by Gender")
ggsave("/Users/bhashithajagarlamudi/Desktop/Data1/results/graph4.png")
