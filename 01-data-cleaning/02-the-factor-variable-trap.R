# ===============================================
# 🎓 Lecture-Script: The Factor Variable Trap in R
# ===============================================

# --- 🛠 Step 1: Understanding the Factor Variable Trap (FVT)
# Factors in R are used to store categorical variables. However,
# directly converting a factor to numeric can lead to unexpected results! ⚠️

# Example: Creating a factor
z <- factor(c("12", "13", "14", "12", "12"))  # 🗂️ A factor with character-like numbers
typeof(z)  # 🔎 Check the type of 'z' (it will show "integer" for factors)
z          # 🔍 Observe the levels of the factor

# --- ⚠️ Problem: Direct Conversion of Factor to Numeric
# If you directly convert a factor to numeric, R does NOT convert the levels to numbers. 
# Instead, it converts the factor levels to their underlying "integer codes."

y <- as.numeric(z)  # ❌ Direct conversion
y  # Output: [1] 1 2 3 1 1 (NOT the actual numbers "12", "13", etc.)
typeof(y)  # 🔎 Type is "double", but the result is incorrect!

# ===============================================
# 🛠 Step 2: Correct Way to Convert Factor to Numeric
# To correctly convert a factor to numeric, first convert it to a character.

# Correct conversion process 🔄
x <- as.numeric(as.character(z))  # ✅ Convert factor -> character -> numeric
x  # Output: [1] 12 13 14 12 12
typeof(x)  # 🔎 Check that the type is now "double"

# --- 🔑 Key Notes:
# 1. Factors store levels as integer codes.
# 2. Directly converting a factor to numeric results in these codes, NOT the actual values.
# 3. Always convert factors to character first, THEN to numeric. 🚀

# ===============================================
# 🛠 Step 3: Exploring Factor Levels
# Let’s examine the levels of a factor to understand the issue better.

# Creating a factor with character inputs
levels(z)  # 🔍 View the unique levels (categories) of 'z'

# Checking the integer codes
as.integer(z)  # Displays the internal representation of the factor levels
# Output: [1] 1 2 3 1 1

# --- 💡 Why Does This Happen?
# - R assigns an internal numeric code to each unique value in a factor.
# - When you use `as.numeric()` directly, R gives you the numeric codes, NOT the actual data.

# ===============================================
# 🛠 Step 4: Practical Example - Fixing Incorrect Conversions
# Let’s practice converting factor variables correctly with a practical example.

# Example Dataset 📊
data <- data.frame(
  ID = factor(c("101", "102", "103", "101", "102")),
  Value = factor(c("50", "60", "70", "50", "60"))
)

# Incorrect Conversion ❌
data$ID_numeric_wrong <- as.numeric(data$ID)
data$Value_numeric_wrong <- as.numeric(data$Value)

# Correct Conversion ✅
data$ID_numeric <- as.numeric(as.character(data$ID))
data$Value_numeric <- as.numeric(as.character(data$Value))

# View the results
print(data)

# --- 🛠 Outputs:
# - `ID_numeric_wrong` and `Value_numeric_wrong` will show incorrect codes.
# - `ID_numeric` and `Value_numeric` will show the correct numeric values.

# ===============================================
# 🛠 Step 5: Automating the Conversion
# For datasets with many factor columns, you can automate the conversion process.

# Function to convert factors to numeric
convert_factor_to_numeric <- function(factor_col) {
  if (is.factor(factor_col)) {
    return(as.numeric(as.character(factor_col)))
  } else {
    return(factor_col)
  }
}

# Example: Apply the function to a data frame
data$Value_numeric_auto <- convert_factor_to_numeric(data$Value)

# Verify the results
print(data)

# ===============================================
# 🛠 Step 6: Avoiding the Factor Trap While Importing Data
# Sometimes, data imported using `read.csv()` converts text columns into factors by default.

# Import data without converting text to factors
# (added so the script runs on its own: the course's example.csv is not included, so a small one is created)
example_file <- tempfile(fileext = ".csv")
write.csv(data.frame(name = c("Anna", "Ben"), city = c("Paris", "Rome")), example_file, row.names = FALSE)
data_imported <- read.csv(example_file, stringsAsFactors = FALSE)  # ✅ Use stringsAsFactors = FALSE
str(data_imported)  # Check the structure of the imported data

# --- 🔎 Why Use `stringsAsFactors = FALSE`?
# It prevents R from automatically converting character columns into factors.

# ===============================================
# 🔑 Summary of Key Concepts
# 1. Directly converting factors to numeric gives incorrect results (underlying codes).
# 2. Always convert factors to character FIRST, then to numeric:
#      `as.numeric(as.character(factor_col))`
# 3. Use `levels()` to view unique values in a factor.
# 4. When importing data, set `stringsAsFactors = FALSE` to avoid unwanted factors.

# --- End of Script 🚀 ---
# ===============================================