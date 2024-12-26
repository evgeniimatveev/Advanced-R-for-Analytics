# ========================================
# Script-Lecture: Index Reset and NA Handling
# ========================================

# --- 🔹 1. Setting the Working Directory
# Set the working directory to access your data file
setwd("C:/Users/GAMING/OneDrive/Dokumente/=== ADVANCED R A-Z ===")  # Update to your path!
getwd()  # Verify the current working directory

# --- 🔹 2. Importing the Dataset
# Load the CSV file into R
fin <- read.csv("Future-500-The-Dataset (S1).csv")  # 📥 Load the dataset
head(fin, 10)  # View the first 10 rows
summary(fin)   # Summary statistics of the dataset
str(fin)       # Check the structure of the dataset

# --- 🔹 3. Creating a Backup
# Create a backup of the original dataset
fin_backup <- fin  # 🛡️ Backup to avoid data loss
cat("✅ Backup created!\n")

# --- 🔹 4. Detecting Missing Data (NA)
# Use is.na() to identify missing values
cat("\n🔍 Checking for NA in the 'Expenses' column:\n")
is.na(fin$Expenses)

cat("\n🔍 Rows with missing data:\n")
missing_rows <- fin[!complete.cases(fin), ]
head(missing_rows, 5)  # Display the first 5 rows with NA

# --- 🔹 5. Removing Rows with Missing Values
# Remove rows with missing data
cat("\n🧹 Removing rows with missing data...\n")
fin <- fin[complete.cases(fin), ]
cat("✅ Cleanup complete! Remaining rows:\n")
nrow(fin)  # Number of rows remaining

# --- 🔹 6. Resetting Dataframe Index
# Reset row indices after row deletion

# Option 1: Sequential renumbering of indices
rownames(fin) <- 1:nrow(fin)
cat("✅ Indices reset (sequential numbering).\n")

# Option 2: Removing row names completely
rownames(fin) <- NULL
cat("✅ Row names removed.\n")
head(fin, 10)  # Verify the changes

# --- 🔹 7. Restoring the Backup
# Restore the original data if needed
fin <- fin_backup  # 🛡️ Restore data
cat("✅ Data restored from the backup!\n")
tail(fin, 5)  # View the last few rows

# --- 🔹 8. NA Example with a Vector
# Demonstration of NA handling with a simple vector
cat("\n🔎 Example: Handling NA in a vector:\n")
example_vector <- c(1, 44, NA, 33, 568, NA)
cat("Original vector:\n")
print(example_vector)

cat("Where are the NAs in the vector?\n")
print(is.na(example_vector))

# --- 🔹 9. Final Dataset Check
cat("\n📊 Final dataset summary:\n")
summary(fin)  # Final check on the dataset