# ===============================================
# 🎓 Lecture-Script: Data Analysis and Insights in R
# ===============================================

# --- 🛠 Step 1: Set Up the Environment
# Set the working directory and import the dataset

getwd()  # 🕵️ Check the current working directory
# Working directory: open Advanced-R-for-Analytics.Rproj so paths are relative to the repo root
getwd()  # ✅ Confirm the updated directory

# Load the dataset
util <- read.csv("data/machine-utilization.csv")  # 📥 Load data

# Preview the dataset
head(util, 10)  # 👀 Check the first 10 rows
str(util)       # 🔎 Inspect structure (column types and data)
summary(util)   # 📊 Summary of numerical columns (mean, median, etc.)

# --- 🔑 Key Notes:
# - `summary()` gives quick insights like min, max, median, and NA counts.
# - Use `str()` to check data types and ensure correctness.

# ===============================================
# 🛠 Step 2: Data Cleaning and Transformation

# Check for missing values (NA)
cat("\n🔍 Checking for Missing Values:\n")
colSums(is.na(util))  # Total NA values in each column

# Handle missing values (Example: Replace NA in `Percent.Idle` with the mean)
cat("\n🔧 Replacing Missing Values in Percent.Idle with Mean:\n")
mean_idle <- mean(util$Percent.Idle, na.rm = TRUE)  # Calculate mean excluding NA
util$Percent.Idle[is.na(util$Percent.Idle)] <- mean_idle  # Replace NA with mean

# Add a new column: Utilization (1 - Percent.Idle)
util$Utilization <- 1 - util$Percent.Idle

# Preview the updated dataset
cat("\n🔍 Updated Dataset:\n")
head(util, 10)

# --- 🔑 Key Notes:
# - Calculating `Utilization` helps understand how efficiently machines are used.
# - Use `mean()` with `na.rm = TRUE` to exclude NA values from calculations.

# ===============================================
# 🛠 Step 3: Descriptive Statistics

# Calculate key statistics for Utilization
cat("\n📊 Key Statistics for Utilization:\n")
cat("Mean Utilization:", mean(util$Utilization), "\n")
cat("Median Utilization:", median(util$Utilization), "\n")
cat("Standard Deviation:", sd(util$Utilization), "\n")
cat("Maximum Utilization:", max(util$Utilization), "\n")
cat("Minimum Utilization:", min(util$Utilization), "\n")

# Identify underutilized machines (Utilization < 90%)
cat("\n🔍 Underutilized Machines (Utilization < 90%):\n")
underutilized <- util[util$Utilization < 0.9, ]
head(underutilized, 10)

# --- 🔑 Key Notes:
# - Use `mean()`, `median()`, and `sd()` to describe the distribution of data.
# - Filtering (`Utilization < 0.9`) identifies machines needing improvement.

# ===============================================
# 🛠 Step 4: Grouped Analysis by Machine

# Grouped summary: Mean Utilization per Machine
cat("\n📊 Mean Utilization by Machine:\n")
mean_util_by_machine <- aggregate(Utilization ~ Machine, data = util, mean)
print(mean_util_by_machine)

# Machine with the highest average Utilization
best_machine <- mean_util_by_machine[which.max(mean_util_by_machine$Utilization), ]
cat("\n🏆 Machine with Highest Utilization:\n")
print(best_machine)

# --- 🔑 Key Notes:
# - `aggregate()` is used for grouped calculations (e.g., mean by Machine).
# - `which.max()` identifies rows with the maximum value.

# ===============================================
# 🛠 Step 5: Analyzing Trends Over Time

# Check Utilization trends for a specific machine (e.g., RL1)
cat("\n📈 Utilization Trend for Machine RL1:\n")
rl1_data <- util[util$Machine == "RL1", ]  # Filter rows for RL1
rl1_util <- rl1_data[, c("Timestamp", "Utilization")]  # Select relevant columns
head(rl1_util, 10)

# Calculate summary statistics for RL1
cat("\n📊 Summary for Machine RL1:\n")
summary(rl1_util$Utilization)

# --- 🔑 Key Notes:
# - Filtering by Machine helps focus on individual performance.
# - Analyzing trends over time identifies patterns (e.g., peak/off-peak hours).

# ===============================================
# 🛠 Step 6: Advanced Example - Correlation Analysis

# Analyze correlation between Utilization and the hour of the day
# (fixed: this dataset has no "Growth" column, that came from another lecture)
cat("\n🔗 Correlation Between Utilization and Hour of Day:\n")
hour_of_day <- as.integer(format(as.POSIXct(util$Timestamp, format = "%d/%m/%Y %H:%M", tz = "UTC"), "%H"))
correlation <- cor(util$Utilization, hour_of_day, use = "complete.obs")
cat("Correlation:", correlation, "\n")

# --- 🔑 Key Notes:
# - Use `cor()` to check linear relationships between two variables.
# - Strong correlations (close to ±1) indicate significant relationships.

# ===============================================
# 🛠 Step 7: Exporting Results

# Save cleaned dataset to a new CSV file
write.csv(util, "Cleaned_Utilization_Data.csv", row.names = FALSE)  # Save data
cat("\n✅ Cleaned dataset saved as 'Cleaned_Utilization_Data.csv'\n")

# --- 🔑 Key Notes:
# - Always save your cleaned data for reproducibility and further analysis.

# ===============================================
# 🔑 Key Takeaways:
# 1. **Data Cleaning**:
#    - Handle missing values using methods like mean/median imputation.
#    - Add meaningful calculated columns (e.g., Utilization).
#
# 2. **Descriptive Statistics**:
#    - Use summary statistics (mean, median, etc.) to understand your data.
#    - Identify patterns like underutilized machines for actionable insights.
#
# 3. **Grouped Analysis**:
#    - Use `aggregate()` to calculate metrics for groups (e.g., per Machine).
#    - Highlight top-performing or underperforming groups.
#
# 4. **Advanced Analysis**:
#    - Perform correlation analysis to identify relationships.
#    - Focus on specific machines to analyze trends over time.
#
# 5. **Exporting Data**:
#    - Always save cleaned and analyzed data for further use or reporting.

# --- 🚀 Script End ---
# ===============================================