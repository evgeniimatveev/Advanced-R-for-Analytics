# ===============================================
# 🎓 Lecture-Script: Removing Records with Missing Data
# ===============================================

# --- 🛠 Step 1: Setting Up the Environment
# Always start by setting your working directory and importing your dataset.

# Working directory: open Advanced-R-for-Analytics.Rproj so paths are relative to the repo root
getwd()  # ✅ Verify the working directory

# Import the dataset
fin <- read.csv("data/future-500.csv")  # 📥 Load dataset
head(fin, 24)  # 👀 Preview the first 24 rows

# Backup the original dataset
fin_backup <- fin  # 📂 Always create a backup before making changes

# --- 🔑 Key Notes:
# - `NA` represents missing or unavailable data in R.
# - Removing or filtering out missing data ensures cleaner analysis but may reduce the dataset's size.
# - Always evaluate whether removing rows is necessary, as it may affect your results.

# ===============================================
# 🛠 Step 2: Identify and Analyze Missing Data

# Identify rows with complete data
complete_rows <- fin[complete.cases(fin), ]  # Retain only complete rows
head(complete_rows)  # 👀 Preview the result

# Identify rows with missing data
missing_rows <- fin[!complete.cases(fin), ]  # Retain only rows with missing data
head(missing_rows)  # 👀 Preview rows with missing data

# --- 🔍 Analyze Missing Data in Specific Columns
# Example: Inspect rows where the "Industry" column is missing
missing_industry <- fin[is.na(fin$Industry), ]
missing_industry  # View rows where "Industry" is NA

# Example: Retain rows where "Industry" is NOT missing
non_missing_industry <- fin[!is.na(fin$Industry), ]
head(non_missing_industry)  # Verify the result

# --- 🔑 Key Notes:
# Use `is.na()` to check for missing data in specific columns.

# ===============================================
# 🛠 Step 3: Remove Records with Missing Data

# Option 1: Remove rows with missing "Industry" values
fin <- fin[!is.na(fin$Industry), ]
head(fin)  # Verify that rows with missing "Industry" are removed

# Option 2: Remove rows with any missing values
fin <- fin[complete.cases(fin), ]
head(fin)  # Verify that only complete rows remain

# --- 🔍 Analysis After Cleaning
summary(fin)  # 📊 Check the dataset summary to confirm changes
str(fin)  # 🔎 Inspect the structure of the cleaned dataset

# ===============================================
# 🛠 Step 4: Advanced Examples with Conditions

# Example 1: Identify rows with missing "Revenue" but non-missing "Industry"
missing_revenue <- fin[is.na(fin$Revenue) & !is.na(fin$Industry), ]
missing_revenue

# Example 2: Identify rows where "Profit" is missing
missing_profit <- fin[is.na(fin$Profit), ]
missing_profit

# Example 3: Remove rows with missing values in multiple columns
# Remove rows where either "Revenue" or "Expenses" is NA
fin <- fin[!is.na(fin$Revenue) & !is.na(fin$Expenses), ]
head(fin)  # Verify the result

# ===============================================
# 🛠 Step 5: Saving the Cleaned Dataset
# Always save your cleaned dataset for future analysis.

write.csv(fin, "Cleaned_Future_500.csv", row.names = FALSE)  # Save as a new file

# ===============================================
# 🔑 Key Takeaways:
# 1. **Identifying Missing Data**:
#    - Use `is.na()` to locate missing values in specific columns or rows.
#    - Combine `is.na()` with logical operators for advanced filtering.
#
# 2. **Removing Rows with Missing Data**:
#    - Use `complete.cases()` to retain only complete rows.
#    - Combine `is.na()` with conditions to remove rows selectively.
#
# 3. **Best Practices**:
#    - Always create a backup before modifying the dataset.
#    - Analyze the impact of removing rows on your dataset's size and structure.
#
# 4. **Alternatives to Deletion**:
#    - Impute missing values (e.g., replace with mean or median).
#    - Use predictive models to estimate missing data.

# --- 🚀 End of Script ---
# ===============================================