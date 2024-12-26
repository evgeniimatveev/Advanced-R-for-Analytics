# ===============================================
# 🎓 Lecture-Script: Replacing Missing Data with Median Imputation (Part 2)
# ===============================================

# --- 🛠 Step 1: Setting Up the Environment
# Always start with setting the working directory and importing your dataset 📂

setwd("C:/Users/GAMING/OneDrive/Dokumente/=== ADVANCED R A-Z ===")  # Update this path
getwd()  # ✅ Verify the working directory

# Import the dataset
fin <- read.csv("Future-500-The-Dataset (S1).csv")  # 📥 Load dataset
head(fin, 10)  # 👀 Preview the first 10 rows of the dataset
summary(fin)   # 📊 Summary of the dataset to check for missing data
str(fin)       # 🔍 Inspect data types and column structures

# --- 🔑 Key Notes:
# 1. Median is the **middle value** in a sorted list of numbers, making it a robust measure against outliers.  
# 2. Use the `median()` function in R to calculate the median.  
# 3. The `na.rm = TRUE` argument ensures that `NA` (missing) values are ignored during calculation.

# ===============================================
# 🛠 Step 2: Imputation by Industry-Specific Median

# 🚧 Replace missing "Employees" data for "Retail" industry
cat("\n🔹 Step 1: Median for 'Employees' in Retail industry:\n")
med_empl_retail <- median(fin[fin$Industry == "Retail", "Employees"], na.rm = TRUE)
cat("Median Employees (Retail):", med_empl_retail, "\n")

# Replace missing values in the "Retail" industry with its median
fin$Employees[is.na(fin$Employees) & fin$Industry == "Retail"] <- med_empl_retail
cat("✅ Missing 'Employees' values for 'Retail' updated.\n")

# 🚧 Replace missing "Employees" data for "Financial Services" industry
cat("\n🔹 Step 2: Median for 'Employees' in Financial Services industry:\n")
med_empl_finserv <- median(fin[fin$Industry == "Financial Services", "Employees"], na.rm = TRUE)
cat("Median Employees (Financial Services):", med_empl_finserv, "\n")

fin$Employees[is.na(fin$Employees) & fin$Industry == "Financial Services"] <- med_empl_finserv
cat("✅ Missing 'Employees' values for 'Financial Services' updated.\n")

# --- 🔑 Key Notes:
# - **Why use industry-specific medians?**: This approach preserves the unique characteristics of each industry.  
# - Group-specific imputation ensures that patterns within each subset of data are respected.

# ===============================================
# 🛠 Step 3: Advanced Imputation with Another Column
# Handle missing data for the "Growth" column in the "Construction" industry 🏗️

cat("\n🔹 Step 3: Median for 'Growth' in Construction industry:\n")
med_growth_constr <- median(fin[fin$Industry == "Construction", "Growth"], na.rm = TRUE)
cat("Median Growth (Construction):", med_growth_constr, "\n")

# Replace missing values in "Growth" for "Construction"
fin$Growth[is.na(fin$Growth) & fin$Industry == "Construction"] <- med_growth_constr
cat("✅ Missing 'Growth' values for 'Construction' updated.\n")

# --- 🔑 Key Notes:
# - Applying median imputation for other columns (e.g., "Growth") works similarly.
# - Industry-specific imputations retain meaningful trends in the data.

# ===============================================
# 🛠 Step 4: Validation of Results
cat("\n🔍 Final validation of missing data:\n")
cat("Summary of Employees column after imputation:\n")
summary(fin$Employees)  # Ensure no missing values remain in Employees
cat("Summary of Growth column after imputation:\n")
summary(fin$Growth)  # Ensure no missing values remain in Growth
cat("✅ Imputation validated: Missing data replaced successfully!\n")

# ===============================================
# 🎯 Practical Application: Why Median Imputation?
# 1. **Robust Against Outliers**:
#    - Median is not affected by extreme values, making it ideal for datasets with skewed distributions.
#    - Example: In `[10, 20, 30, 1000]`, the median is `25`, whereas the mean is skewed to `265`.
#
# 2. **Industry-Specific Imputation**:
#    - Use subset filtering (e.g., `Industry == "Retail"`) to preserve group-level insights.
#    - Example: Retail and Construction might have vastly different employee sizes or growth rates.
#
# 3. **Practical Example:**
#    - Suppose you're analyzing sales data, and some rows are missing sales amounts.
#    - Imputing the median for each store type (e.g., small stores, franchises) ensures fairness across groups.

# ===============================================
# 🔑 Key Takeaways:
# 1. **Median Calculation**:
#    - Use `median(data, na.rm = TRUE)` to exclude `NA` values during computation.
#
# 2. **Imputation Process**:
#    - Detect missing data using `is.na()`.
#    - Calculate the median for relevant subsets of data.
#    - Replace missing values with calculated medians for each subset.
#
# 3. **Advanced Techniques**:
#    - Impute across multiple columns using the same process.
#    - Validate the results to ensure no missing data remains.
#
# 4. **Real-World Use**:
#    - Median imputation is commonly used in financial analysis, sales data, and health datasets to preserve data integrity.

# ===============================================
# --- 🚀 End of Script ---