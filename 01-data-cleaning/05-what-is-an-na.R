# ===============================================
# 🎓 Lecture-Script: What is an NA in R?
# ===============================================

# --- 🛠 Step 1: Understanding NA
# In R, NA stands for "Not Available" and is used to represent missing values.
# It can occur in numeric, character, factor, or logical data types.

# --- 🔑 Key Characteristics of NA:
# 1. NA is not a value; it represents "unknown" or "missing".
# 2. Operations with NA generally result in NA (e.g., `1 + NA` returns `NA`).
# 3. Comparisons involving NA return NA, not TRUE or FALSE.

# Example: Simple operations with NA
x <- NA
y <- 5

x + y  # Output: NA (result is unknown because x is missing)
x == y  # Output: NA (comparison is also unknown)

# ===============================================
# 🛠 Step 2: Logical Comparisons with NA
# Let's explore how NA behaves with logical operators and comparisons.

# --- 🔎 Comparing NA with Logical Values
NA == TRUE  # Output: NA (unknown)
NA == FALSE  # Output: NA (unknown)

# --- 🔎 Comparing NA with Numeric Values
NA == 5  # Output: NA
5 == NA  # Output: NA

# --- 🔎 NA with Other Logical Operations
TRUE & NA  # Output: NA (AND operation with missing value)
FALSE | NA  # Output: NA (OR operation with missing value)

# --- 🔎 Comparing NA to Itself
NA == NA  # Output: NA (two unknowns can't be compared)
is.na(NA)  # Output: TRUE (use is.na() to detect missing values)

# --- 🔎 Example with a Vector Containing NA
vec <- c(1, NA, 3)

vec == 1  # Output: TRUE, NA, FALSE
is.na(vec)  # Output: FALSE, TRUE, FALSE (detects which elements are NA)

# ===============================================
# 🛠 Step 3: Working with NA in Data
# Let's practice handling NA in a dataset.

# Example Data
data <- data.frame(
  ID = 1:5,
  Value = c(10, NA, 15, NA, 20)
)

# Detecting NA
is.na(data$Value)  # Identify missing values
which(is.na(data$Value))  # Get indices of missing values

# --- Handling NA
# Replace NA with a specific value (e.g., mean)
data$Value[is.na(data$Value)] <- mean(data$Value, na.rm = TRUE)
data  # Verify the updated dataset

# ===============================================
# 🛠 Step 4: Advanced Examples with NA
# Let's explore how NA interacts with logical operations.

# --- 🔎 Combining TRUE, FALSE, and NA
TRUE & NA  # Output: NA (unknown outcome)
FALSE & NA  # Output: FALSE (FALSE dominates in AND)
TRUE | NA  # Output: TRUE (TRUE dominates in OR)
FALSE | NA  # Output: NA (unknown outcome)

# --- 🔎 NA in Logical Expressions
vec <- c(TRUE, FALSE, NA)

vec & TRUE  # Output: TRUE, FALSE, NA
vec | FALSE  # Output: TRUE, FALSE, NA

# --- 🔎 Filter Example with NA
filter_vec <- c(1, NA, 3, 4, NA)
filter_vec > 2  # Output: NA, NA, TRUE, TRUE, NA
filter_vec[filter_vec > 2]  # Output: Warning (due to NA)

# Handle NA Before Filtering
filter_vec[!is.na(filter_vec) & filter_vec > 2]  # Output: 3, 4

# ===============================================
# 🔑 Summary of NA Key Concepts
# 1. **What is NA?**
#    - NA represents missing or unknown values in R.
#    - It works differently from regular values in comparisons and operations.
# 2. **Logical Comparisons with NA**:
#    - Any operation involving NA generally results in NA.
#    - Use `is.na()` to detect missing values instead of `==`.
# 3. **Handling NA**:
#    - Replace NA using techniques like mean, median, or imputation.
#    - Filter NA using `!is.na()` for further analysis.

# --- 🚀 End of Script ---
# ===============================================





