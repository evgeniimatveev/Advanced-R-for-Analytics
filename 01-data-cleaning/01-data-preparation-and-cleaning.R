# ===============================================
# 🎓 Lecture-Script: Data Preparation and Cleaning in R
# ===============================================

# --- 🛠 Step 1: Setting Your Working Directory
# The working directory is where your files are stored.
# Let's set and verify the working directory. 📂

getwd()  # 🕵️ Check the current working directory
# Working directory: open Advanced-R-for-Analytics.Rproj so paths are relative to the repo root
getwd()  # ✅ Verify the updated working directory

# --- 🔎 Why Set the Working Directory?
# It ensures R can easily locate and save files without typing long paths repeatedly.

# ===============================================
# 🛠 Step 2: Importing Data
# Importing a CSV file into R using `read.csv()` 📥

fin <- read.csv("data/future-500.csv")  # Load the dataset
fin  # 👀 View the entire dataset

# Preview the data quickly
head(fin)       # 🔎 View the first few rows of the dataset
tail(fin, 10)   # 🔎 View the last 10 rows of the dataset
summary(fin)    # 📊 Summarize the data (mean, median, counts, etc.)

# --- 🔎 What Does `summary()` Do?
# - Numeric Columns: Provides statistics like min, max, mean, median, and quartiles.
# - Factor Columns: Shows unique levels and their frequencies.

# ===============================================
# 🛠 Step 3: Converting Non-Factors to Factors
# Factors are used for categorical variables like IDs or years. 
# Let's convert some numeric columns to factors. 🔄

# Example 1: Convert "ID" column to a factor
fin$ID <- factor(fin$ID)   # 🪄 Transform "ID" into a factor
str(fin)                   # 🔎 Check the updated structure of the dataset

# Example 2: Convert "Inception" column to a factor
fin$Inception <- factor(fin$Inception)  
str(fin)  # 🔧 Verify the changes

# --- 🔎 Why Use Factors?
# - Factors are efficient for handling categorical data.
# - Useful for grouping, analysis, and plotting.

# ===============================================
# 🛠 Step 4: Exploring the Structure of the Data
# Let’s explore the data structure and identify column types.

str(fin)        # 🛠 Displays column types (numeric, character, factor)
levels(fin$ID)  # 🗂️ Check the unique categories (levels) of the "ID" column

# --- 🔑 Key Notes:
# - `str()` is great for inspecting datasets quickly.
# - Use `levels()` to see unique values in a factor column.

# ===============================================
# 🛠 Step 5: Handling Missing Data
# Missing data (NAs) can cause errors and must be handled. 🛑

# Step 1: Count missing values
sum(is.na(fin))        # 🔍 Total number of missing values
colSums(is.na(fin))    # 📊 Missing values per column

# Step 2: Remove rows with missing values
fin_clean <- na.omit(fin)  # 🧹 Remove all rows with NAs
summary(fin_clean)         # ✅ Check the clean dataset

# --- 🔎 Why Remove Missing Data?
# - NAs can distort analysis results.
# - `na.omit()` quickly removes rows with any missing values.

# ===============================================
# 🛠 Step 6: Adding and Modifying Columns
# Let’s add a new column and modify an existing one. 🛠️

# Add a new "Profit" column (Example: Employees * 2)
fin_clean$Profit <- fin_clean$Employees * 2
head(fin_clean)  # 👀 Verify the new column

# Modify the "Revenue" column (Convert to 'thousands')
# (added: Revenue is still text such as "$9,684,527" here, so convert it to numbers first)
fin_clean$Revenue <- as.numeric(gsub("[$,]", "", fin_clean$Revenue))
fin_clean$Revenue <- fin_clean$Revenue / 1000  
head(fin_clean)  # ✅ Check the modified column

# ===============================================
# 🛠 Step 7: Filtering and Subsetting Data
# Filtering allows us to focus on specific rows of interest. 🔍

# Example 1: Filter companies founded in the year 2000
fin_2000 <- fin_clean[fin_clean$Inception == 2000, ]
head(fin_2000)

# Example 2: Filter companies with more than 500 employees
large_companies <- fin_clean[fin_clean$Employees > 500, ]
head(large_companies)

# Example 3: Filter companies with Profit > 1000
high_profit <- fin_clean[fin_clean$Profit > 1000, ]
head(high_profit)

# --- 🔎 Why Filter Data?
# Filtering helps analyze subsets of data based on specific conditions.

# ===============================================
# 🛠 Step 8: Sorting Data
# Use `order()` to sort datasets based on specific columns. 🔽🔼

# Sort by "Employees" in descending order
fin_sorted <- fin_clean[order(-fin_clean$Employees), ]
head(fin_sorted)

# Sort by "Inception" and "Revenue"
fin_sorted2 <- fin_clean[order(fin_clean$Inception, -fin_clean$Revenue), ]
head(fin_sorted2)

# --- 🔑 Key Notes:
# - Use `order()` for sorting.
# - Adding `-` before a column sorts it in descending order.

# ===============================================
# 🛠 Step 9: Saving the Cleaned Data
# Save your cleaned dataset to a new CSV file. 📤

write.csv(fin_clean, "Cleaned_Future_500.csv", row.names = FALSE)
print("Cleaned dataset saved successfully! 🎉")  # 🎉 Completion message

# ===============================================
# 🛠 Step 10: Final Review
# Double-check the clean dataset before further analysis. 🔎

str(fin_clean)   # 🛠 Final structure check
summary(fin_clean)  # 📊 Final summary statistics

# --- End of Script 🚀 ---
# ===============================================