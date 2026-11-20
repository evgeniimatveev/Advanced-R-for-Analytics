# ===============================================
# 🎓 Lecture-Script: Replacing Missing Data with Median Imputation (Part 3)
# ===============================================

# --- 🛠 Step 1: Setting Up the Environment
# Always start by setting your working directory and importing your dataset 📂
# Working directory: open Advanced-R-for-Analytics.Rproj so paths are relative to the repo root
getwd()  # ✅ Verify the working directory

# Import the dataset
fin <- read.csv("data/future-500.csv")  # 📥 Load dataset
head(fin, 10)  # 👀 Preview the first 10 rows
summary(fin)   # 📊 Summary to check for missing values
str(fin)       # 🔍 Inspect the structure of the dataset

# --- 🔑 Key Notes:
# 1. Median imputation works best when values are missing **at random** and are **not too frequent**.  
# 2. For financial data (e.g., revenue or expenses), imputing with a median helps preserve overall patterns without distorting totals.  
# 3. Be careful about logical **dependencies** (e.g., if "Expenses" depend on "Profit").

# ===============================================
# 🛠 Step 2: Median Imputation for "Revenue" in Construction Industry

# Step 1: Calculate the median for "Revenue" in the "Construction" industry 🏗️
cat("\n🔹 Calculating median for 'Revenue' in Construction industry:\n")
med_rev_constr <- median(fin[fin$Industry == "Construction", "Revenue"], na.rm = TRUE)
cat("Median Revenue (Construction):", med_rev_constr, "\n")

# Step 2: Replace missing values in "Revenue" for the "Construction" industry
fin$Revenue[is.na(fin$Revenue) & fin$Industry == "Construction"] <- med_rev_constr
cat("✅ Missing 'Revenue' values for 'Construction' replaced with the industry median.\n")

# --- 🔑 Key Notes:
# - For numeric columns like "Revenue", imputation ensures continuity in downstream calculations (e.g., total revenue).  
# - This technique works across industries by grouping data.

# ===============================================
# 🛠 Step 3: Median Imputation for "Expenses" with Logical Conditions

# Advanced case: Only impute "Expenses" for rows where "Profit" is not missing
cat("\n🔹 Calculating median for 'Expenses' in Construction industry where Profit is available:\n")
med_exp_constr <- median(fin[fin$Industry == "Construction" & !is.na(fin$Profit), "Expenses"], na.rm = TRUE)
cat("Median Expenses (Construction):", med_exp_constr, "\n")

# Replace missing "Expenses" for Construction industry, ensuring "Profit" exists
fin$Expenses[is.na(fin$Expenses) & fin$Industry == "Construction" & !is.na(fin$Profit)] <- med_exp_constr
cat("✅ Missing 'Expenses' values for 'Construction' replaced selectively.\n")

# --- 🔑 Key Notes:
# - Logical conditions ensure imputation aligns with the data's integrity (e.g., don't impute "Expenses" if "Profit" is missing).  
# - Combining `is.na()` and logical operators (e.g., `&`) refines targeting for imputation.

# ===============================================
# 🛠 Step 4: Validation of Imputation Results

cat("\n🔍 Final Validation of Imputation Results:\n")
summary(fin)  # Check summary to ensure all imputations worked
cat("\n✅ Validation complete: Dataset updated successfully!\n")

# --- 🔑 Key Notes:
# Always validate your imputations by:
# - Inspecting summaries (`summary()`)
# - Checking specific rows where changes were made (`head()` or logical filters)

# ===============================================
# 🎯 Advanced Scenario: Multi-Condition Imputation Example

cat("\n📚 Practical Example: Multi-Condition Imputation\n")

# Scenario: Replace missing "Profit" in rows where "Revenue" and "Expenses" exist
cat("\n🔹 Calculating median for 'Profit' where Revenue and Expenses exist:\n")
med_profit <- median(fin[!is.na(fin$Revenue) & !is.na(fin$Expenses), "Profit"], na.rm = TRUE)
cat("Median Profit:", med_profit, "\n")

# Replace missing "Profit" values based on logical conditions
fin$Profit[is.na(fin$Profit) & !is.na(fin$Revenue) & !is.na(fin$Expenses)] <- med_profit
cat("✅ Missing 'Profit' values updated where Revenue and Expenses exist.\n")

# --- 🔑 Key Notes:
# - Multi-condition imputation preserves logical consistency across dependent columns.
# - Always ensure that imputed values align with domain-specific rules (e.g., Profit = Revenue - Expenses).

# ===============================================
# 🔑 Key Takeaways:
# 1. **Median Imputation for Dependent Columns**:
#    - Use logical conditions (`&`, `|`) to ensure data consistency during imputation.  
#    - Example: Don't impute "Expenses" without "Profit" if these columns are correlated.  
#
# 2. **Industry-Specific Insights**:
#    - Use group-level medians (e.g., by `Industry`) for imputation.  
#    - This ensures that the imputed values reflect industry trends and remain accurate.
#
# 3. **Practical Guidelines**:
#    - Always validate imputations to ensure no unintended data distortions occur.
#    - Use multi-condition imputations for datasets with logical dependencies between columns.

# ===============================================
# --- 🚀 End of Script ---
# ===============================================