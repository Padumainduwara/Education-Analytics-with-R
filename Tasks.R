setwd('E:/BA')

data <- read.csv("EduStates_New.csv")

min_spending <- min(data$dollars)
max_spending <- max(data$dollars)
mean_spending <- mean(data$dollars)
median_spending <- median(data$dollars)
mode_spending <- get_mode(data$dollars)

cat("Minimum Spending:",min_spending,"\n")

cat("Maximum Spending:",max_spending,"\n")

cat("Mean Spending:",mean_spending,"\n")

cat("Median Spending:",median_spending,"\n")

cat("Mode Spending:",mode_spending,"\n")

#task 4 
#summary
summary(data$dollars)

#task 5 

meanPercent <- mean(data$percent)
cat("Mean value of graduating high-school students in the
state who took the SAT exam is : ", meanPercent, "\n")

medPercent <- median(data$percent)
cat("Median value of graduating high-school students in the
state who took the SAT exam is : ", medPercent, "\n")

mode = function() {
  return(names(sort(-table(data$percent)))[1])
}

modePercent <- mode()
cat("Mode  value of graduating high-school students in the
state who took the SAT exam is : ", (modePercent), "\n")

#state spending on public education per student

#mean value 
mean_value <- mean(data$dollars)
cat("Mean value : ", mean_value, "\n")

#median value 
median_value <- median(data$dollars)
cat("Median value : ", median_value, "\n")

mode = function() {
  return(names(sort(-table(data$dollars)))[1])
}
cat("Mode value is  : ", mode(), "\n")


#Average teacher's salary in the state 

meanSalary <- mean(data$pay)
print(meanSalary)

medSal <- median(data$pay)
print(medSal)

mode = function() {
  return(names(sort(-table(data$pay)))[1])
}

modeSal <- mode()
print(modeSal)


#population

meanPop <- mean(data$pop)
print(meanPop)

medPop <- median(data$pop)
print(medPop)

mode = function() {
  return(names(sort(-table(data$pop)))[1])
}

modePop <- mode()
print(modePop)



shapiro.test(data$percent)
shapiro.test(data$dollars)
shapiro.test(data$pay)
shapiro.test(data$pop)


library(ggplot2)


#for students who took the SAT exam 
print(bcPercent <- ggplot(data, aes(x = percent)) +
        geom_density(fill = "dodgerblue", alpha = 0.5) +
        ggtitle("Density Plot for % of students who took the SAT exam") +
        xlab("Percentage of students") +
        ylab("Frequency"))


#for state spending
print(bcAmount <- ggplot(data, aes(x = dollars)) +
        geom_density(fill = "red", alpha = 0.5) +
        ggtitle("Density Plot for state spending on public education") +
        xlab("Amont spent ($1000)") +
        ylab("Frequency"))

#for teacher salary
print(bcSal <- ggplot(data, aes(x = pay)) +
        geom_density(fill = "yellow", alpha = 0.5) +
        ggtitle("Density Plot for Average Teacher's Salary in a State") +
        xlab("Teacher's Salary") +
        ylab("Frequency"))

#for population
print(bcPop <- ggplot(data, aes(x = pop)) +
        geom_density(fill = "green1", alpha = 0.5) +
        ggtitle("Density Plot for Population") +
        xlab("Population") +
        ylab("Frequency"))

#Task 6



library(dplyr)

str(data)

# Ensure 'region' is treated as a factor
data$region <- as.factor(data$region)
print(data$region)

# Descriptive statistics
descriptive_stats <- data %>%
  group_by(region) %>%
  summarise(
    count = n(),
    mean = mean(dollars, na.rm = TRUE),
    sd = sd(dollars, na.rm = TRUE),
    median = median(dollars, na.rm = TRUE),
    IQR = IQR(dollars, na.rm = TRUE)
  )

print(descriptive_stats)

# ANOVA test
anova_result <- aov(dollars ~ region, data = data)
summary_anova <- summary(anova_result)
print(summary_anova)

# Post-hoc analysis if ANOVA is significant
if (summary_anova[[1]][["Pr(>F)"]][1] < 0.05) {
  tukey_result <- TukeyHSD(anova_result)
  print(tukey_result)
}

# Histograms

# Histogram for the percentage of students who took the SAT exam
histPercent <- ggplot(data, aes(x = percent)) +
  geom_histogram(binwidth = 10, fill = "dodgerblue", color = "black", alpha = 0.7) +
  ggtitle("Histogram for % of Students Who Took the SAT Exam") +
  xlab("Percentage of Students") +
  ylab("Frequency") +
  theme_minimal()

print(histPercent)

# Histogram for state spending on public education per student
histDollars <- ggplot(data, aes(x = dollars)) +
  geom_histogram(binwidth = 1, fill = "red", color = "black", alpha = 0.7) +
  ggtitle("Histogram for State Spending on Public Education per Student") +
  xlab("Amount Spent ($)") +
  ylab("Frequency") +
  theme_minimal()

print(histDollars)

# Histogram for average teacher's salary in the state
histPay <- ggplot(data, aes(x = pay)) +
  geom_histogram(binwidth = 5, fill = "yellow", color = "black", alpha = 0.7) +
  ggtitle("Histogram for Average Teacher's Salary in a State") +
  xlab("Teacher's Salary ($)") +
  ylab("Frequency") +
  theme_minimal()

print(histPay)

# Histogram for state population
histPop <- ggplot(data, aes(x = pop)) +
  geom_histogram(binwidth = 3000, fill = "green", color = "black", alpha = 0.7) +
  ggtitle("Histogram for Population") +
  xlab("Population") +
  ylab("Frequency") +
  theme_minimal()

print(histPop)

#Task 7 

data$region <- as.factor(data$region)

# Check normality
shapiro_percent <- shapiro.test(data$percent)
shapiro_dollars <- shapiro.test(data$dollars)

print(shapiro_percent)
print(shapiro_dollars)

# Perform Pearson correlation test
cor_test <- cor.test(data$percent, data$dollars, method = "pearson")
print(cor_test)

# Descriptive statistics
summary_percent <- summary(data$percent)
summary_dollars <- summary(data$dollars)

print(summary_percent)
print(summary_dollars)

# Calculate mean, median, and standard deviation
mean_percent <- mean(data$percent)
median_percent <- median(data$percent)
sd_percent <- sd(data$percent)

mean_dollars <- mean(data$dollars)
median_dollars <- median(data$dollars)
sd_dollars <- sd(data$dollars)

cat("Descriptive Statistics for Percentage of Students Who Took the SAT Exam:\n")
cat("Mean:", mean_percent, "\n")
cat("Median:", median_percent, "\n")
cat("Standard Deviation:", sd_percent, "\n\n")

cat("Descriptive Statistics for State Spending on Public Education per Student:\n")
cat("Mean:", mean_dollars, "\n")
cat("Median:", median_dollars, "\n")
cat("Standard Deviation:", sd_dollars, "\n")

# Scatter plot with regression line
scatterPlot <- ggplot(data, aes(x = dollars, y = percent)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  ggtitle("Scatter Plot with Regression Line") +
  xlab("State Spending on Public Education per Student ($)") +
  ylab("Percentage of Graduating High-School Students Who Took the SAT Exam") +
  theme_minimal()

print(scatterPlot)

# Task 8: Relationship between SAT Participation and Average Teacher's Salary


# Check normality
shapiro_percent <- shapiro.test(data$percent)
shapiro_pay <- shapiro.test(data$pay)

print(shapiro_percent)
print(shapiro_pay)

# Determine normality
normality_percent <- shapiro_percent$p.value > 0.05
normality_pay <- shapiro_pay$p.value > 0.05

# Perform correlation analysis based on normality
if (normality_percent && normality_pay) {
  # Pearson correlation
  cor_test <- cor.test(data$percent, data$pay, method = "pearson")
} else {
  # Kendall's Tau correlation
  cor_test <- cor.test(data$percent, data$pay, method = "kendall")
}

print(cor_test)

# Descriptive statistics
summary_percent <- summary(data$percent)
summary_pay <- summary(data$pay)

print(summary_percent)
print(summary_pay)

# Calculate mean, median, and standard deviation
mean_percent <- mean(data$percent)
median_percent <- median(data$percent)
sd_percent <- sd(data$percent)

mean_pay <- mean(data$pay)
median_pay <- median(data$pay)
sd_pay <- sd(data$pay)

cat("Descriptive Statistics for Percentage of Students Who Took the SAT Exam:\n")
cat("Mean:", mean_percent, "\n")
cat("Median:", median_percent, "\n")
cat("Standard Deviation:", sd_percent, "\n\n")

cat("Descriptive Statistics for Average Teacher's Salary in the State:\n")
cat("Mean:", mean_pay, "\n")
cat("Median:", median_pay, "\n")
cat("Standard Deviation:", sd_pay, "\n")

# Scatter plot with regression line
scatterPlot <- ggplot(data, aes(x = pay, y = percent)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  ggtitle("Scatter Plot with Regression Line") +
  xlab("Average Teacher's Salary in the State ($)") +
  ylab("Percentage of Graduating High-School Students Who Took the SAT Exam") +
  theme_minimal()

print(scatterPlot)

# Task 9: Relationship between SAT Participation and Population of States

# Check normality
shapiro_percent <- shapiro.test(data$percent)
shapiro_pop <- shapiro.test(data$pop)

print(shapiro_percent)
print(shapiro_pop)

# Determine normality
normality_percent <- shapiro_percent$p.value > 0.05
normality_pop <- shapiro_pop$p.value > 0.05

# Perform correlation analysis based on normality
if (normality_percent && normality_pop) {
  # Pearson correlation
  cor_test <- cor.test(data$percent, data$pop, method = "pearson")
} else {
  # Kendall's Tau correlation
  cor_test <- cor.test(data$percent, data$pop, method = "kendall")
}

print(cor_test)

# Descriptive statistics
summary_percent <- summary(data$percent)
summary_pop <- summary(data$pop)

print(summary_percent)
print(summary_pop)

# Calculate mean, median, and standard deviation
mean_percent <- mean(data$percent)
median_percent <- median(data$percent)
sd_percent <- sd(data$percent)

mean_pop <- mean(data$pop)
median_pop <- median(data$pop)
sd_pop <- sd(data$pop)

cat("Descriptive Statistics for Percentage of Students Who Took the SAT Exam:\n")
cat("Mean:", mean_percent, "\n")
cat("Median:", median_percent, "\n")
cat("Standard Deviation:", sd_percent, "\n\n")

cat("Descriptive Statistics for Population of States:\n")
cat("Mean:", mean_pop, "\n")
cat("Median:", median_pop, "\n")
cat("Standard Deviation:", sd_pop, "\n")

# Scatter plot with regression line
scatterPlot <- ggplot(data, aes(x = pop, y = percent)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  ggtitle("Scatter Plot with Regression Line") +
  xlab("Population of States") +
  ylab("Percentage of Graduating High-School Students Who Took the SAT Exam") +
  theme_minimal()

print(scatterPlot)
