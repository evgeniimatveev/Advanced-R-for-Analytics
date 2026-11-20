# ===============================================
# 🎓 Lecture-Script: An Elegant Way to Locate Missing Data in R
# ===============================================

# --- 🛠 Step 1: Setting the Working Directory and Importing Data
# Always start by setting your working directory and importing the dataset.

setwd("C:/Users/GAMING/OneDrive/Dokumente/=== ADVANCED R A-Z ===")  # Update your path
getwd()  # ✅ Verify the current working directory

# Import the dataset
fin <- read.csv("Future-500-The-Dataset (S1).csv")  # Load the dataset
head(fin, 24)  # 👀 View the first 24 rows for better understanding

# --- 🔎 Key Notes:
# Always inspect your dataset after importing it to understand its structure and identify potential issues.

# ===============================================
# 🛠 Step 2: Identifying Missing Data with `complete.cases()`
# The `complete.cases()` function helps identify rows with no missing values.

# --- 🔑 How `complete.cases()` Works:
# - Returns `TRUE` for rows with NO missing values.
# - Returns `FALSE` for rows with ANY missing values.

complete_rows <- complete.cases(fin)  # Identify complete rows (TRUE or FALSE for each row)
head(complete_rows, 24)  # View the first 24 rows to inspect completeness

# Count complete and incomplete rows
sum(complete_rows)  # ✅ Number of complete rows
sum(!complete_rows)  # ❌ Number of incomplete rows

# Extract only incomplete rows
incomplete_data <- fin[!complete.cases(fin), ]
incomplete_data  # View rows with missing data

# --- 🔎 Key Notes:
# Use `!complete.cases()` to focus on rows with missing values. It is useful for debugging.

# ===============================================
# 🛠 Step 3: Filtering and Cleaning Data with `complete.cases()`
# Once you've identified incomplete rows, you can choose how to handle them.

# --- Option 1: Removing Rows with Missing Values
fin_cleaned <- fin[complete.cases(fin), ]  # Keep only complete rows
nrow(fin_cleaned)  # Check the number of rows after cleaning

# --- Option 2: Keeping Only Rows with Missing Values
only_incomplete <- fin[!complete.cases(fin), ]
only_incomplete  # View only incomplete rows

# ===============================================
# 🛠 Step 4: Combining `complete.cases()` with Logical Filters
# You can combine `complete.cases()` with additional logical conditions for more advanced filtering.

# Example: Extract complete rows where Revenue > $10,000,000
high_revenue_complete <- fin[complete.cases(fin) & fin$Revenue > 10000000, ]
high_revenue_complete  # View the result

# Example: Extract incomplete rows where "Expenses" are missing
expenses_missing <- fin[!complete.cases(fin) & is.na(fin$Expenses), ]
expenses_missing  # View rows where Expenses are missing

# ===============================================
# 🛠 Step 5: Advanced Practice with `complete.cases()`
# Practice using `complete.cases()` with other functions for better data handling.

# --- Practice 1: Identify Columns with Missing Data
missing_summary <- colSums(is.na(fin))  # Count missing values per column
missing_summary  # View the summary of missing data

# --- Practice 2: Replace Missing Data in a Specific Column
# Replace missing "Employees" with the median
fin$Employees[is.na(fin$Employees)] <- median(fin$Employees, na.rm = TRUE)

# Verify the replacement
summary(fin$Employees)  # Check that missing values are replaced

# --- Practice 3: Save Clean Data to a New File
# Save the cleaned dataset (only complete rows)
write.csv(fin_cleaned, "Future-500-Cleaned.csv", row.names = FALSE)
print("Cleaned dataset saved successfully! 🎉")

# ===============================================
# 🔑 Summary of `complete.cases()` Key Concepts
# 1. **Identify Missing Rows**:
#    - Use `complete.cases()` to find rows with no missing values.
#    - Combine with `!` to locate rows with missing values.
# 2. **Filter Data**:
#    - Keep only complete rows (`[complete.cases(), ]`).
#    - Focus on incomplete rows for further cleaning.
# 3. **Combine with Logical Conditions**:
#    - Combine `complete.cases()` with logical filters for advanced data selection.

# --- 🚀 End of Script ---
# ===============================================
