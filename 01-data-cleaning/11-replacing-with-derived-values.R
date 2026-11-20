# ===============================================
  # 🎓 Lecture-Script: Replacing Missing Data with Derived Values
  # ===============================================

# --- 🛠 Step 1: Setting Up the Environment
# Start by setting your working directory and importing the dataset 📂
# Working directory: open Advanced-R-for-Analytics.Rproj so paths are relative to the repo root
getwd()  # ✅ Verify the working directory

# Import the dataset
fin <- read.csv("data/future-500.csv")  # 📥 Load the dataset
head(fin, 10)  # 👀 Preview the first 10 rows
summary(fin)   # 📊 Summary of the dataset to check for missing values
str(fin)       # 🔍 Inspect the structure of the dataset

# --- 🔑 Key Notes:
# - Derived values are calculated using other columns in the dataset.  
# - For example, if **Profit = Revenue - Expenses**, then we can derive "Profit" if it's missing.  
# - Use this method to ensure the logical relationships in your data are preserved.

# ===============================================
# 🛠 Step 2: Using `cat()` for Logging Messages
# `cat()` is used to print messages to the console for better understanding during analysis.

cat("\n🔹 Using `cat()` to log important updates:\n")
cat("✅ Dataset loaded successfully!\n")
cat("Previewing the structure of the dataset below:\n")
str(fin)  # Log the structure of the dataset

# --- 🔑 What is `cat()`?
# - **`cat()`** (short for "concatenate") prints messages or variables to the console in a clean format.
# - It’s commonly used to **track progress** or log updates during a script's execution.
# - Example:
cat("Hello, this is an example of using `cat()`!\n")
# Output: Hello, this is an example of using `cat()`!

# ===============================================
# 🛠 Step 3: Deriving Missing "Profit" Values

# Step 1: Define the relationship between Revenue, Expenses, and Profit
# Profit = Revenue - Expenses

cat("\n🔹 Deriving missing 'Profit' values:\n")
fin[is.na(fin$Profit), "Profit"] <- fin[is.na(fin$Profit), "Revenue"] - fin[is.na(fin$Profit), "Expenses"]

cat("✅ Missing 'Profit' values derived using Revenue and Expenses.\n")

# Step 2: Validate the result
cat("\n🔍 Checking rows where 'Profit' was derived:\n")
derived_profit_rows <- fin[is.na(fin$Profit), ]
head(derived_profit_rows, 5)  # 👀 Preview rows where Profit was calculated

# --- 🔑 Key Notes:
# - Always ensure that the logic used for derivation is accurate.  
# - In this case, we derived "Profit" using the formula `Profit = Revenue - Expenses`.  

# ===============================================
# 🛠 Step 4: Deriving Missing "Expenses" Values

# Step 1: Define the reverse relationship
# Expenses = Revenue - Profit

cat("\n🔹 Deriving missing 'Expenses' values:\n")
fin[is.na(fin$Expenses), "Expenses"] <- fin[is.na(fin$Expenses), "Revenue"] - fin[is.na(fin$Expenses), "Profit"]

cat("✅ Missing 'Expenses' values derived using Revenue and Profit.\n")

# Step 2: Validate the result
cat("\n🔍 Checking rows where 'Expenses' was derived:\n")
derived_expenses_rows <- fin[is.na(fin$Expenses), ]
head(derived_expenses_rows, 5)  # 👀 Preview rows where Expenses were calculated

# --- 🔑 Key Notes:
# - Deriving "Expenses" assumes Revenue and Profit are both available.  
# - If either is missing, additional steps are needed to handle those cases.

# ===============================================
# 🛠 Step 5: Validation and Final Check

cat("\n📊 Final Validation of Imputed Data:\n")
summary(fin)  # Check summary to ensure no missing values remain in "Profit" or "Expenses"
cat("✅ Validation complete! All derived values have been added.\n")

# --- 🔍 Advanced Validation Example:
# Check if any "Profit" or "Expenses" values are still missing
missing_profit <- sum(is.na(fin$Profit))
missing_expenses <- sum(is.na(fin$Expenses))
cat("\n🔎 Missing 'Profit':", missing_profit, "\n")
cat("🔎 Missing 'Expenses':", missing_expenses, "\n")

# ===============================================
# 🎯 Advanced Scenario: Handling Edge Cases

cat("\n📚 Practical Example: Deriving with Additional Conditions:\n")

# Scenario: Derive "Profit" only if "Revenue" and "Expenses" are both present
fin[is.na(fin$Profit) & !is.na(fin$Revenue) & !is.na(fin$Expenses), "Profit"] <- 
  fin[is.na(fin$Profit) & !is.na(fin$Revenue) & !is.na(fin$Expenses), "Revenue"] - 
  fin[is.na(fin$Profit) & !is.na(fin$Revenue) & !is.na(fin$Expenses), "Expenses"]

cat("✅ Derived 'Profit' only for rows with complete 'Revenue' and 'Expenses'.\n")

# --- 🔑 Key Notes:
# - This advanced condition ensures no derivation occurs where data is insufficient.
# - Always validate complex imputations to prevent errors.

# ===============================================
# 🔑 Key Takeaways:
# 1. **When to Use Derived Values**:
#    - Use derivation when missing values can logically be calculated from other data.
#    - Example: If **Profit = Revenue - Expenses**, derive missing "Profit" using available "Revenue" and "Expenses".
#
# 2. **Advanced Validations**:
#    - Use conditions to ensure only valid rows are updated.
#    - Example: Derive "Profit" only when both "Revenue" and "Expenses" are non-missing.
#
# 3. **Using `cat()` for Logging**:
#    - Add progress logs to your script to improve understanding and debugging.
#    - Use `cat()` to print calculated values and summaries dynamically.
#
# 4. **Best Practices**:
#    - Always validate derived values to ensure accuracy.
#    - Derivation works best when the dataset has clear logical relationships.

# --- 🚀 End of Script ---
# ===============================================
