# ==========================================
# 🧠 Step 1: Importing Data into R
# ==========================================
cat("\n🧠 Step 1: Importing Data into R\n")

# Set Working Directory
# It's important to navigate to the correct directory containing the dataset.
# Use `getwd()` to get the current working directory and `setwd()` to change it.

getwd()  # Get current working directory
setwd("C:/Users/YourName/Desktop/R Programming Advanced/Weather Data")  # Example directory

# ==========================================
# 🔧 Step 2: Loading CSV Files
# ==========================================
cat("\n🔧 Loading CSV Files:\n")

# Import multiple CSV files into R using `read.csv()` with row names set to the first column.
Chicago <- read.csv("Chicago-F.csv", row.names = 1)
NewYork <- read.csv("NewYork-F.csv", row.names = 1)
Houston <- read.csv("Houston-F.csv", row.names = 1)
SanFrancisco <- read.csv("SanFrancisco-F.csv", row.names = 1)

# Check one of the dataframes
cat("Preview of Chicago dataset:\n")
head(Chicago)

# ==========================================
# 🧪 Step 3: Converting Data Frames to Matrices
# ==========================================
cat("\n🧪 Converting Data Frames to Matrices:\n")

# Since the data is numeric, converting to matrices can simplify operations later.
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

# Check if the conversion was successful
cat("Is Chicago now a matrix?\n")
is.matrix(Chicago)

# ==========================================
# 🗂️ Step 4: Organizing Data into a List
# ==========================================
cat("\n🗂️ Organizing Data into a List:\n")

# Combine all the matrices into a single list for easier manipulation
Weather <- list(Chicago = Chicago, NewYork = NewYork, Houston = Houston, SanFrancisco = SanFrancisco)

# Access elements of the list
cat("\nAccessing Houston's dataset:\n")
print(Weather$Houston)

# ==========================================
# 🧠 Step 5: Introducing the S3 Family of Functions
# ==========================================
cat("\n🧠 Introducing the S3 Family of Functions:\n")

# R's S3 family of functions helps apply repetitive operations across data structures:
# - `apply()`: Works on matrices.
# - `lapply()`: Returns a list.
# - `sapply()`: Simplifies results into vectors or matrices when possible.

# ==========================================
# 🔍 Example 1: Using `apply()` for Matrices
# ==========================================
cat("\n🔍 Example 1: Using apply() on a matrix (row-wise mean):\n")

# Compute the average temperature (row-wise mean) for Chicago
row_means <- apply(Weather$Chicago, 1, mean)
cat("Row-wise means for Chicago:\n")
print(row_means)

# - `apply()`:
#   - `X`: The input array (e.g., a matrix).
#   - `MARGIN`: 1 for rows, 2 for columns.
#   - `FUN`: The function to apply (e.g., mean, sum).

# ==========================================
# 🔍 Example 2: Using `lapply()` for Lists
# ==========================================
cat("\n🔍 Example 2: Using lapply() on the Weather list (column-wise means):\n")

# Calculate column-wise means for all cities in the Weather list
column_means <- lapply(Weather, function(city) apply(city, 2, mean))
cat("Column-wise means for each city:\n")
print(column_means)

# - `lapply()`:
#   - Iterates over each element of a list.
#   - Always returns a list, even if elements are simplified.

# ==========================================
# 🔍 Example 3: Using `sapply()` for Simplified Results
# ==========================================
cat("\n🔍 Example 3: Using sapply() for Simplification:\n")

# Compute the total precipitation for each city (row sums)
total_precipitation <- sapply(Weather, function(city) apply(city, 1, sum))
cat("Total precipitation for each city:\n")
print(total_precipitation)

# - `sapply()`:
#   - Similar to `lapply()`, but simplifies results into vectors or matrices.

# ==========================================
# 🔑 Key Notes
# ==========================================
cat("\n🔑 Key Notes:\n")

# 1. **Data Importing**:
#   - Always set the correct working directory using `setwd()` to avoid file path issues.
#   - Use `read.csv()` to import CSV files into R.

# 2. **Data Conversion**:
#   - Convert data frames to matrices with `as.matrix()` for numerical operations.

# 3. **S3 Functions**:
#   - `apply()`: Apply a function to rows/columns of a matrix.
#   - `lapply()`: Apply a function to each element of a list (returns a list).
#   - `sapply()`: Simplifies `lapply()` results into vectors or matrices.

# 4. **Practical Use Cases**:
#   - Analyze weather data (e.g., average temperatures, total precipitation).
#   - Quickly apply the same operation across multiple datasets.

# ==========================================
# 📝 Summary
# ==========================================
cat("\n📝 Summary:\n")

# - **Data Organization**: Combining datasets into lists simplifies iterative operations.
# - **S3 Functions**: `apply()`, `lapply()`, and `sapply()` reduce repetitive coding.
# - **Key Difference**:
#   - `apply()`: For arrays/matrices.
#   - `lapply()`: Always returns a list.
#   - `sapply()`: Simplifies list outputs when possible.

# Practice these concepts on your own weather datasets to master data handling and processing in R!