# ===============================================
# 🎓 Lecture-Script: Data Filters: `is.na()` for Missing Data
# ===============================================

# --- 🛠 Step 1: Setting Up the Environment
# Always set your working directory and import your dataset.

setwd("C:/Users/GAMING/OneDrive/Dokumente/=== ADVANCED R A-Z ===")  # Update your path
getwd()  # ✅ Verify the working directory

# Import the dataset
fin <- read.csv("Future-500-The-Dataset (S1).csv")  # 📥 Load dataset
head(fin, 24)  # 👀 Preview the first 24 rows

# --- 🔑 Key Notes:
# Before analyzing missing data, always inspect the dataset's structure and summary.

# ===============================================
# 🛠 Step 2: Understanding `is.na()`
# The `is.na()` function identifies missing values in R.

# --- 🔍 Example: Checking for Missing Values
# Let's create a small vector with missing values
a <- c(1, 44, NA, 33, 568, NA)  # Vector with missing values
is.na(a)  # Returns TRUE for missing (NA) and FALSE otherwise

# --- 🔑 Key Notes:
# `is.na()` is a logical function that checks each element and outputs TRUE for NAs.

# ===============================================
# 🛠 Step 3: Using `is.na()` on a Dataset
# Check for missing values in a specific column (e.g., "Expenses")

is.na(fin$Expenses)  # Returns TRUE/FALSE for each value in the "Expenses" column

# --- Example: Extract Rows with Missing Values in "Expenses"
missing_expenses <- fin[is.na(fin$Expenses), ]
missing_expenses  # View rows where "Expenses" is missing

# --- Example: Extract Rows WITHOUT Missing Values in "Expenses"
non_missing_expenses <- fin[!is.na(fin$Expenses), ]
non_missing_expenses  # View rows where "Expenses" is NOT missing

# ===============================================
# 🛠 Step 4: Filtering with `is.na()` and Conditions
# Combine `is.na()` with logical operators for advanced filtering.

# --- Example: Find Rows with Missing "Expenses" but Non-Missing "Revenue"
complex_filter <- fin[is.na(fin$Expenses) & !is.na(fin$Revenue), ]
complex_filter  # View the filtered rows

# --- Example: Count Missing and Non-Missing Values
sum(is.na(fin$Expenses))  # Total missing values in "Expenses"
sum(!is.na(fin$Expenses))  # Total non-missing values in "Expenses"

# ===============================================
# 🛠 Step 5: Replacing Missing Values
# Replace missing values with a specific value (e.g., median, mean, or zero).

# --- Example: Replace Missing "Expenses" with the Median
fin$Expenses[is.na(fin$Expenses)] <- median(fin$Expenses, na.rm = TRUE)

# Verify that missing values are replaced
sum(is.na(fin$Expenses))  # Should now be 0

# --- 🔎 Key Notes:
# Always use `na.rm = TRUE` when calculating statistics (e.g., mean, median) to ignore NAs.

# ===============================================
# 🔑 Summary of `is.na()` Key Concepts
# 1. **What is `is.na()`?**
#    - A function that checks for missing values (NAs) in vectors, matrices, or data frames.
#    - Returns a logical vector (TRUE for NAs, FALSE otherwise).
#
# 2. **Common Use Cases**:
#    - Identify rows or columns with missing data.
#    - Filter rows with or without missing values.
#    - Replace missing values with calculated or constant values.
#
# 3. **Combining with Logical Operators**:
#    - Use `&`, `|`, and `!` to combine `is.na()` with other conditions.

# --- 🚀 End of Script ---
# ===============================================