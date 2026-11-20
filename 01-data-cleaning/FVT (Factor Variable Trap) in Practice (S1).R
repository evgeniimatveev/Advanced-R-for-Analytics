# ===============================================
# 🎓 Lecture-Script: FVT (Factor Variable Trap) in Practice
# ===============================================

getwd()  # 🕵️ Check the current working directory
setwd("C:/Users/GAMING/OneDrive/Dokumente/=== ADVANCED R A-Z ===")  # 🌐 Set your working directory
getwd()  # ✅ Verify the updated working directory

# --- 🔎 Why Set the Working Directory?
# It ensures R can easily locate and save files without typing long paths repeatedly.

# ===============================================
# 🛠  Importing Data
# Importing a CSV file into R using `read.csv()` 📥

fin <- read.csv("Future-500-The-Dataset (S1).csv")  # Load the dataset
fin  # 👀 View the entire dataset

# --- 🛠 Step 1: Inspect the Dataset
# Before converting columns, always inspect the dataset structure
str(fin)        # 🔎 Check the structure of the dataset
summary(fin)    # 📊 View a summary of the dataset

# --- 🔑 Key Notes:
# - Use `str()` to identify factor columns in your dataset.
# - `summary()` is helpful for spotting factor levels and frequencies.

# ===============================================
# 🛠 Step 2: Converting Profit to a Factor
# Let's simulate the Factor Variable Trap (FVT) issue with the "Profit" column.

fin$Profit <- factor(fin$Profit)  # Convert "Profit" to a factor
str(fin)                          # Inspect the structure after conversion
summary(fin)                      # Summarize the data to see factor levels

# --- 🔎 Observation:
# - "Profit" is now stored as a factor.
# - Summary shows the number of occurrences for each level of "Profit."

# ===============================================
# 🛠 Step 3: Incorrect Numeric Conversion (FVT Example)
# Direct conversion of a factor column to numeric leads to incorrect results.

fin$Profit <- as.numeric(fin$Profit)  # ❌ Direct conversion to numeric
str(fin)                              # 🔎 Check the structure again
head(fin$Profit)                      # View the first few rows of "Profit"

# --- 🔴 Problem:
# The numeric values are not the original "Profit" values.
# Instead, they are the **integer codes** representing the factor levels.

# ===============================================
# 🛠 Step 4: Correct Numeric Conversion
# To avoid the FVT issue, always convert factors to character FIRST,
# then convert to numeric.

# Correct conversion process
fin$Profit <- as.numeric(as.character(fin$Profit))  # ✅ Correct conversion
str(fin)                                            # Verify structure
head(fin$Profit)                                    # View the correct values

# --- 🔑 Best Practice:
# Always use `as.character()` before `as.numeric()` when converting factors.

# ===============================================
# 🛠 Step 5: Additional Example - Percent Growth
# Let's work with another column (e.g., "Growth") that contains percentages.

# Example: The "Growth" column has percentages stored as factors
str(fin$Growth)    # Check the structure of "Growth"
head(fin$Growth)   # View the first few rows

# Step 1: Remove the "%" symbol using `gsub()`
fin$Growth <- gsub("%", "", fin$Growth)  # 🧹 Clean the data
head(fin$Growth)                         # Check the cleaned column

# Step 2: Convert "Growth" to numeric
fin$Growth <- as.numeric(fin$Growth)     # Convert cleaned column to numeric
str(fin)                                 # Verify the updated structure
head(fin$Growth)                         # View the first few rows

# --- 🔑 Key Notes:
# - Use `gsub()` to clean unwanted characters like "%" or "$".
# - Always inspect the column before and after cleaning.

# ===============================================
# 🛠 Step 6: Automating Factor-to-Numeric Conversion
# For datasets with multiple factor columns, you can automate the process.

# Function to convert all factor columns to numeric
convert_factors <- function(data) {
  for (col in names(data)) {
    if (is.factor(data[[col]])) {
      data[[col]] <- as.numeric(as.character(data[[col]]))
    }
  }
  return(data)
}

# Apply the function to the dataset
fin <- convert_factors(fin)  # 🪄 Automatically clean all factor columns
str(fin)                     # Verify the updated structure

# ===============================================
# 🛠 Step 7: Practice - Cleaning Multiple Columns
# Let's clean and convert additional columns in the dataset (e.g., Revenue, Expenses).

# Example: Cleaning "Revenue" and "Expenses" columns
# Step 1: Remove unwanted characters
fin$Revenue <- gsub("\\$", "", fin$Revenue)    # Remove "$" symbol
fin$Revenue <- gsub(",", "", fin$Revenue)      # Remove "," for numeric conversion
fin$Expenses <- gsub("\\$", "", fin$Expenses)  # Repeat for "Expenses"
fin$Expenses <- gsub(",", "", fin$Expenses)

# Step 2: Convert to numeric
fin$Revenue <- as.numeric(fin$Revenue)
fin$Expenses <- as.numeric(fin$Expenses)

# Verify the results
str(fin)       # Check the updated structure
head(fin)      # View the cleaned dataset

# ===============================================
# 🛠 Step 8: Calculating New Columns
# Once the data is cleaned, we can create new columns for analysis.

# Example: Calculate Profit Margin
fin$ProfitMargin <- (fin$Profit / fin$Revenue) * 100  # Calculate percentage
head(fin$ProfitMargin)  # View the calculated column

# Example: Calculate Net Growth
fin$NetGrowth <- fin$Growth - 5  # Subtract an arbitrary growth benchmark
head(fin$NetGrowth)             # View the new column

# ===============================================
# 🔑 Summary of FVT Key Concepts
# 1. **What is the FVT Issue?**
#    - Directly converting a factor to numeric results in incorrect values (integer codes).
# 2. **How to Avoid It?**
#    - Always use `as.numeric(as.character(factor_column))` for safe conversion.
# 3. **Best Practices:**
#    - Use `gsub()` to clean non-numeric symbols (e.g., "$", "%").
#    - Automate the conversion process for multiple columns using a function.
# 4. **Next Steps:**
#    - Once cleaned, create new columns for deeper analysis and insights.

# --- End of Script 🚀 ---
# ===============================================