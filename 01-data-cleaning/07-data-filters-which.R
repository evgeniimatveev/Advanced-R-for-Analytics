# ===============================================
# 🎓 Lecture-Script: Data Filters: `which()` for Non-Missing Data
# ===============================================

# --- 🛠 Step 1: Setting Up the Environment
# Start by setting your working directory and importing the dataset.

# Working directory: open Advanced-R-for-Analytics.Rproj so paths are relative to the repo root
getwd()  # ✅ Verify the working directory

# Import the dataset
fin <- read.csv("data/future-500.csv")  # 📥 Load dataset
head(fin, 24)  # 👀 View the first 24 rows to get a sense of the data structure

# --- 🔑 Key Notes:
# Always inspect your dataset before applying filters to understand its structure and identify relevant columns.

# ===============================================
# 🛠 Step 2: Using `which()` for Data Filtering
# The `which()` function identifies the indices of TRUE values in a logical vector.

# --- Example 1: Finding Specific Values in a Column
# Find rows where "Revenue" equals 9746272
indices_revenue <- which(fin$Revenue == 9746272)
indices_revenue  # View the indices

# Extract rows with this value
fin_filtered_revenue <- fin[indices_revenue, ]
fin_filtered_revenue  # View the filtered data

# --- Example 2: Filter Based on "Employees" Column
# Find rows where "Employees" equals 45
indices_employees <- which(fin$Employees == 45)
indices_employees  # View the indices

# Extract rows where "Employees" equals 45
fin_filtered_employees <- fin[indices_employees, ]
fin_filtered_employees  # View the filtered data

# ===============================================
# 🛠 Step 3: Combining `which()` with Logical Operators
# You can combine `which()` with logical conditions for more advanced filtering.

# --- Example: Filter Rows with Specific Conditions
# Find rows where Revenue > 10,000,000 AND Growth > 20
indices_complex <- which(fin$Revenue > 10000000 & fin$Growth > 20)
indices_complex  # View the indices

# Extract the rows satisfying the conditions
fin_filtered_complex <- fin[indices_complex, ]
fin_filtered_complex  # View the filtered data

# --- 🔎 Key Notes:
# Combining `which()` with conditions allows precise filtering for analysis.

# ===============================================
# 🛠 Step 4: Identifying Non-Missing Data with `which()`
# Use `which()` to find rows with non-missing values in specific columns.

# Example: Find rows where "Revenue" is not missing
indices_non_missing_revenue <- which(!is.na(fin$Revenue))
indices_non_missing_revenue  # View the indices

# Extract rows where "Revenue" is not missing
fin_non_missing_revenue <- fin[indices_non_missing_revenue, ]
fin_non_missing_revenue  # View the filtered data

# ===============================================
# 🛠 Step 5: Practice Tasks with `which()`
# Practice combining `which()` with logical conditions and other functions.

# --- Practice 1: Filter Rows with Missing Values in "Expenses"
indices_missing_expenses <- which(is.na(fin$Expenses))
fin_missing_expenses <- fin[indices_missing_expenses, ]
fin_missing_expenses  # View rows where "Expenses" is missing

# --- Practice 2: Filter Rows with High Revenue and Non-Missing Growth
indices_revenue_growth <- which(fin$Revenue > 15000000 & !is.na(fin$Growth))
fin_revenue_growth <- fin[indices_revenue_growth, ]
fin_revenue_growth  # View filtered rows

# --- Practice 3: Combine `which()` with Sorting
indices_sorted <- which(fin$Revenue > 10000000)
fin_sorted <- fin[indices_sorted, ]
fin_sorted <- fin_sorted[order(fin_sorted$Revenue, decreasing = TRUE), ]
fin_sorted  # View rows sorted by Revenue in descending order

# ===============================================
# 🔑 Summary of `which()` Key Concepts
# 1. **What is `which()`?**
#    - Finds the indices of TRUE values in a logical vector.
#    - Returns a numeric vector of indices.
# 2. **Common Use Cases**:
#    - Filtering rows based on conditions.
#    - Identifying non-missing or missing values.
# 3. **Combining with Logical Operators**:
#    - Combine `which()` with conditions like `>`, `<`, `==`, and logical operators `&`, `|` for advanced filtering.

# --- 🚀 End of Script ---
# ===============================================