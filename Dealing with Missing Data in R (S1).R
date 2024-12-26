# ===============================================
# 🎓 Lecture-Script: Dealing with Missing Data in R
# ===============================================

# --- 🛠 Step 1: Understanding Missing Data
# Missing data is a common issue in datasets. It can occur due to:
# - Human error during data entry.
# - Issues during data collection.
# - Loss of data during export/import.
#
# In R, missing values are represented as `NA` (Not Available).

# --- 🔑 Key Strategies for Dealing with Missing Data:
# 1. **Predict with high accuracy** (advanced methods like machine learning).
# 2. **Leave the record as is** (if missingness is small and does not impact analysis).
# 3. **Remove records entirely** (useful if missingness is large).
# 4. **Replace with mean/median/mode** (a simple imputation technique).
# 5. **Fill based on correlations** (use related columns to predict missing values).
# 6. **Introduce dummy variables** (to mark missingness for further analysis).

# ===============================================
# 🛠 Step 2: Importing and Exploring the Data
# Let’s import the dataset and identify missing values.

# Set working directory
setwd("C:/Users/GAMING/OneDrive/Dokumente/=== ADVANCED R A-Z ===")  # Update to your path
getwd()  # Verify the working directory

# Import the dataset
fin <- read.csv("Future-500-The-Dataset (S1).csv")  # Load dataset
fin  # View the dataset

# Explore the data structure
str(fin)  # 🔎 Check structure
summary(fin)  # 📊 Summary of columns

# --- 🔍 Finding Missing Data:
# Use `is.na()` to detect missing values
sum(is.na(fin))  # Total count of missing values
colSums(is.na(fin))  # Count of missing values per column
which(is.na(fin), arr.ind = TRUE)  # Find the row/column indices of missing values

# ===============================================
# 🛠 Step 3: Handling Missing Data
# Different approaches to deal with missing data.

# --- Option 1: Remove Rows with Missing Values
fin_cleaned <- na.omit(fin)  # Removes rows with any missing values
nrow(fin_cleaned)  # Compare rows before and after cleaning

# --- Option 2: Replace Missing Values with Mean/Median
# Example: Replace missing values in "Employees" column with the median
fin$Employees[is.na(fin$Employees)] <- median(fin$Employees, na.rm = TRUE)
summary(fin$Employees)  # Verify replacement

# --- Option 3: Replace Missing Values Based on Correlation
# Example: Replace missing "Expenses" with `Revenue - Profit`
fin$Expenses[is.na(fin$Expenses)] <- fin$Revenue[is.na(fin$Expenses)] - fin$Profit[is.na(fin$Expenses)]
summary(fin$Expenses)  # Check if the issue is resolved

# --- Option 4: Create a Dummy Variable for Missingness
fin$Missing_Expenses <- ifelse(is.na(fin$Expenses), 1, 0)  # 1 for missing, 0 otherwise
table(fin$Missing_Expenses)  # Count rows with/without missing values

# ===============================================
# 🛠 Step 4: Automating Missing Data Handling
# Write a function to automate common missing data strategies.

handle_missing <- function(df, strategy = "median", columns = NULL) {
  for (col in columns) {
    if (strategy == "median") {
      df[[col]][is.na(df[[col]])] <- median(df[[col]], na.rm = TRUE)
    } else if (strategy == "mean") {
      df[[col]][is.na(df[[col]])] <- mean(df[[col]], na.rm = TRUE)
    } else if (strategy == "remove") {
      df <- df[!is.na(df[[col]]), ]
    }
  }
  return(df)
}

# Example: Replace missing data in "Employees" and "Growth" columns with median
fin <- handle_missing(fin, strategy = "median", columns = c("Employees", "Growth"))
summary(fin)  # Verify changes

# ===============================================
# 🛠 Step 5: Advanced Techniques
# For datasets with complex missing patterns, advanced imputation methods can be used.

# --- Method 1: K-Nearest Neighbors (KNN) Imputation
# The `DMwR` package can perform KNN imputation based on similar rows.
# install.packages("DMwR")
library(DMwR)
fin_knn <- knnImputation(fin[, !names(fin) %in% "ID"])  # Exclude non-numeric columns
summary(fin_knn)  # Verify imputed values

# --- Method 2: Multiple Imputation
# The `mice` package performs multiple imputations and combines results.
# install.packages("mice")
library(mice)
imputed_data <- mice(fin, m = 5, method = "pmm", maxit = 50, seed = 500)
fin_imputed <- complete(imputed_data, 1)  # Choose the first imputed dataset
summary(fin_imputed)

# ===============================================
# 🔑 Summary of Missing Data Strategies
# 1. **Identify Missing Values**: Use `is.na()` to locate missing data.
# 2. **Basic Approaches**:
#    - Remove rows (`na.omit()`).
#    - Replace with mean/median (`median()` or `mean()`).
# 3. **Advanced Approaches**:
#    - Correlation-based imputation (e.g., `Revenue - Profit`).
#    - Machine learning methods (e.g., KNN, multiple imputation).
# 4. **Create Dummy Variables**: Track missingness for additional insights.

# --- 🚀 End of Script ---
# ===============================================