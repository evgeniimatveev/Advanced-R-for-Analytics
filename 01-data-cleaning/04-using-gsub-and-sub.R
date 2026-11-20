# ===============================================
# 🎓 Lecture-Script: Using `gsub()` and `sub()` for Data Cleaning
# ===============================================

# --- 🛠 Step 1: Setting the Working Directory
# Always set and verify your working directory to ensure smooth data operations. 📂

getwd()  # 🕵️ Check the current working directory
# Working directory: open Advanced-R-for-Analytics.Rproj so paths are relative to the repo root
getwd()  # ✅ Verify the updated working directory

# --- 🔑 Key Notes:
# Setting the working directory ensures R can find your files without typing full paths each time.

# ===============================================
# 🛠 Step 2: Importing and Inspecting the Data
# Importing a dataset and exploring its structure before making changes.

fin <- read.csv("data/future-500.csv")  # 📥 Import the dataset
fin  # 👀 View the dataset

str(fin)      # 🔎 Inspect the structure of the dataset
summary(fin)  # 📊 View a summary (e.g., min, max, mean, levels)
head(fin)     # 🔍 View the first few rows

# --- 🔑 Key Notes:
# Always inspect your data first to understand its structure, column types, and potential issues.

# ===============================================
# 🛠 Step 3: Cleaning Text Data with `gsub()` and `sub()`
# Both `gsub()` and `sub()` replace patterns in text.
# - `gsub()` replaces ALL matches.
# - `sub()` replaces the FIRST match only.

# --- 🔎 Syntax for `gsub()` and `sub()`:
# gsub(pattern, replacement, x)
# sub(pattern, replacement, x)

# Example 1: Cleaning the "Expenses" column
fin$Expenses <- gsub("Dollars", "", fin$Expenses)  # Remove the word "Dollars"
head(fin$Expenses)  # View the cleaned "Expenses" column

fin$Expenses <- gsub(",", "", fin$Expenses)  # Remove commas for numeric conversion
head(fin$Expenses)  # Verify the column after cleaning

# Example 2: Cleaning the "Revenue" column
fin$Revenue <- gsub("\\$", "", fin$Revenue)  # Remove "$" symbol
fin$Revenue <- gsub(",", "", fin$Revenue)    # Remove commas
head(fin$Revenue)  # Check the cleaned "Revenue" column

# Example 3: Cleaning the "Growth" column
fin$Growth <- gsub("%", "", fin$Growth)  # Remove "%" symbol
head(fin$Growth)  # Check the cleaned "Growth" column

# --- 🔑 Key Notes:
# - Use `\\` to escape special characters like `$` or `.`.
# - `gsub()` is ideal for replacing multiple instances of a pattern.

# ===============================================
# 🛠 Step 4: Converting Cleaned Text to Numeric
# Once text data is cleaned, convert it to numeric for analysis.

fin$Expenses <- as.numeric(fin$Expenses)  # Convert "Expenses" to numeric
fin$Revenue <- as.numeric(fin$Revenue)   # Convert "Revenue" to numeric
fin$Growth <- as.numeric(fin$Growth)     # Convert "Growth" to numeric

str(fin)  # Verify the updated structure
summary(fin)  # Check summary statistics for numeric columns

# --- 🔑 Key Notes:
# Converting cleaned text to numeric allows you to perform calculations and statistical analyses.

# ===============================================
# 🛠 Step 5: Practical Example - Profit Margin Analysis
# Let’s create a new column based on cleaned data.

# Calculate Profit Margin (%)
fin$ProfitMargin <- (fin$Profit / fin$Revenue) * 100
head(fin$ProfitMargin)  # View the calculated Profit Margin

# Add a Growth Adjustment (e.g., add 5% to Growth)
fin$AdjustedGrowth <- fin$Growth + 5
head(fin$AdjustedGrowth)  # View the adjusted Growth column

# ===============================================
# 🛠 Step 6: Automating Text Cleaning with a Function
# Automate the cleaning process for multiple columns.

clean_text <- function(column, patterns, replacements) {
  for (i in seq_along(patterns)) {
    column <- gsub(patterns[i], replacements[i], column)
  }
  return(as.numeric(column))
}

# Example: Clean and convert "Revenue" and "Expenses" columns
patterns <- c("\\$", ",")  # Patterns to remove
replacements <- c("", "")  # Replacements (empty strings)

fin$Revenue <- clean_text(fin$Revenue, patterns, replacements)
fin$Expenses <- clean_text(fin$Expenses, patterns, replacements)

# Verify results
str(fin)
summary(fin)

# ===============================================
# 🔑 Summary of `gsub()` and `sub()` Key Concepts
# 1. **Differences**:
#    - `gsub()`: Replaces all occurrences of a pattern.
#    - `sub()`: Replaces the first occurrence of a pattern.
# 2. **Common Use Cases**:
#    - Remove symbols (`$`, `%`, etc.) for numeric conversion.
#    - Clean unwanted characters or replace substrings in text.
# 3. **Automation**:
#    - Use functions to clean and convert multiple columns efficiently.

# --- 🚀 End of Script ---
# ===============================================