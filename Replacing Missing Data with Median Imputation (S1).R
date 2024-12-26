# ===============================================
# 🎓 Lecture-Script: Replacing Missing Data with Median Imputation
# ===============================================

# --- 🛠 Step 1: Setting Up the Environment
# Always set your working directory and load the dataset to ensure smooth workflow 📂

setwd("C:/Users/GAMING/OneDrive/Dokumente/=== ADVANCED R A-Z ===")  # Update this path
getwd()  # ✅ Verify the working directory

# Import the dataset
fin <- read.csv("Future-500-The-Dataset (S1).csv")  # 📥 Load dataset
head(fin, 10)  # 👀 Preview the first 10 rows
summary(fin)   # 📊 Summary statistics for an overview of data and missing values
str(fin)       # 🔍 Check column data types and structure

# --- 🔑 Key Notes:
# 1. Missing values in R are represented as `NA`. 
# 2. `median()` calculates the middle value of a dataset, unaffected by extreme outliers.
# 3. Use `na.rm = TRUE` in calculations to exclude `NA` values from operations.
# 4. Replacing missing data helps retain the dataset size while improving data quality.

# ===============================================
# 🛠 Step 2: Identifying Missing Data
cat("\n🔍 Finding rows with missing data:\n")

# Rows with missing data
missing_rows <- fin[!complete.cases(fin), ]  # Retain rows with `NA` values
head(missing_rows)  # 👀 View rows with missing data
cat("✅ Rows with missing data identified.\n")

# --- 🔑 Key Notes:
# - Use `complete.cases()` to filter rows with no missing values.
# - Use `!complete.cases()` to find rows with missing values.

# ===============================================
# 🛠 Step 3: Basic Median Imputation
# Replace missing values in "Employees" column using the median 🧮

# Step 1: Calculate the median for "Employees" (excluding NA values)
cat("\n🔹 Calculating the median for 'Employees':\n")
median_employees <- median(fin$Employees, na.rm = TRUE)  # Exclude missing values
cat("Median (all industries):", median_employees, "\n")

# 👉 What is the median?  
# - The **median** is the middle value in a sorted list of numbers.  
# - For example, in `[1, 2, 3, 4, 5]`, the median is `3`.  
# - If the list length is even (e.g., `[1, 2, 3, 4]`), the median is the average of the two middle numbers: `(2 + 3)/2 = 2.5`.  
# - The median is **resistant to outliers**, making it reliable for imputation.

# Step 2: Replace missing values in "Employees" with the median
fin$Employees[is.na(fin$Employees)] <- median_employees  # Replace `NA` with the median
cat("✅ Missing 'Employees' values replaced with the overall median.\n")

# --- 🔑 Key Notes:
# - Imputation preserves dataset size while reducing bias caused by missing data.

# ===============================================
# 🛠 Step 4: Industry-Specific Median Imputation
# Replace missing "Employees" values using medians calculated per industry 🎯

# Step 1: Median for the "Retail" industry
cat("\n🔹 Calculating median for 'Retail' industry:\n")
median_retail_employees <- median(fin[fin$Industry == "Retail", "Employees"], na.rm = TRUE)
cat("Median (Retail):", median_retail_employees, "\n")

# Replace missing "Employees" values for "Retail"
fin$Employees[is.na(fin$Employees) & fin$Industry == "Retail"] <- median_retail_employees
cat("✅ Missing 'Employees' values for 'Retail' replaced with the industry median.\n")

# Step 2: Median for "Financial Services"
cat("\n🔹 Calculating median for 'Financial Services':\n")
median_finserv_employees <- median(fin[fin$Industry == "Financial Services", "Employees"], na.rm = TRUE)
cat("Median (Financial Services):", median_finserv_employees, "\n")

# Replace missing values for "Financial Services"
fin$Employees[is.na(fin$Employees) & fin$Industry == "Financial Services"] <- median_finserv_employees
cat("✅ Missing 'Employees' values for 'Financial Services' replaced with the industry median.\n")

# --- 🔑 Key Notes:
# - Industry-specific medians provide more accurate imputations by reflecting group-level patterns.
# - Logical filtering (e.g., `fin$Industry == "Retail"`) ensures calculations are industry-specific.

# ===============================================
# 🛠 Step 5: Validating the Imputation
# Ensure all missing values in "Employees" have been handled ✅

cat("\n🔍 Checking for remaining missing data in 'Employees':\n")
summary(fin$Employees)  # Confirm no `NA` values remain in "Employees"
cat("✅ Validation complete: All missing data replaced.\n")

# --- 🔑 Key Notes:
# - Always validate the results of imputation to ensure accuracy.
# - Use `summary()` to confirm no `NA` values remain.

# ===============================================
# 🛠 Step 6: Practical Examples
# Demonstrate median imputation results 📚

cat("\n📚 Examples of median calculations:\n")
cat("🔹 Median (overall):", median_employees, "\n")
cat("🔹 Median (Retail):", median_retail_employees, "\n")
cat("🔹 Median (Financial Services):", median_finserv_employees, "\n")

# Example: Check rows imputed for "Retail"
cat("\n🔎 Rows with updated 'Employees' for 'Retail':\n")
fin[fin$Industry == "Retail" & !is.na(fin$Employees), ]

# ===============================================
# 🔑 Key Takeaways:
# 1. **Median Imputation**:
#    - Reliable for numerical columns with missing values.
#    - Resilient to extreme outliers, ensuring accurate replacements.
#
# 2. **NA Handling**:
#    - Use `is.na()` to detect missing values.
#    - Combine `is.na()` with logical filters for targeted imputation.
#
# 3. **Industry-Specific Imputation**:
#    - Improves accuracy by calculating medians specific to each group.
#
# 4. **Validation**:
#    - Always use `summary()` and other checks to ensure no missing values remain.
#
# --- 🚀 End of Script ---
# ===============================================