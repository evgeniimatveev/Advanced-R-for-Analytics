getwd()  # 🕵️ Check the current working directory
# Working directory: open Advanced-R-for-Analytics.Rproj so paths are relative to the repo root
getwd()  # ✅ Confirm the updated directory

# Load the dataset
util <- read.csv("data/machine-utilization.csv")  # 📥 Load data

# Preview the dataset
head(util, 10)  # 👀 Check the first 10 rows
str(util)       # 🔎 Inspect structure (column types and data)

summary(util)  


# ===============================================
# 🎓 Lecture-Script: Understanding Lists in R
# ===============================================

# --- 🛠 Step 1: What is a List in R?
cat("\n🔍 What is a List in R?\n")

# --- 💡 Theory:
# A **list** in R is a data structure that can store elements of different types, 
# including vectors, data frames, other lists, or even functions.
#
# - It is **flexible** and allows combining various objects into one container.
# - Think of it as a "toolbox" where each tool can be different.

# Example of a list
my_list <- list(
  character_data = "Hello, R!",
  numeric_vector = c(1, 2, 3, 4, 5),
  logical_flag = TRUE,
  data_frame_example = data.frame(A = c(10, 20), B = c(30, 40))
)

# Print the list
cat("\n📋 Example List:\n")
print(my_list)

# --- 🔑 Key Notes:
# - Use the `list()` function to create lists.
# - Lists can store mixed types of data, making them versatile.

# ===============================================
# 🛠 Step 2: Practical Example - Analyzing Machine Data

cat("\n🔍 Creating a List for Machine RL1 Analysis\n")

# Step 1: Subset the data for machine RL1
RL1_data <- util[util$Machine == "RL1", ]  # Filter rows for RL1
summary(RL1_data)  # Check basic statistics

# Step 2: Generate key statistics for RL1 Utilization
util_stats_RL1 <- c(
  min(RL1_data$Utilization, na.rm = TRUE),  # Minimum
  mean(RL1_data$Utilization, na.rm = TRUE),  # Mean
  max(RL1_data$Utilization, na.rm = TRUE)   # Maximum
)
cat("\n📊 Key Utilization Stats for RL1:\n")
print(util_stats_RL1)

# Step 3: Logical flag - Has RL1 utilization ever fallen below 90%?
util_below_90_flag <- any(RL1_data$Utilization < 0.90, na.rm = TRUE)  # TRUE/FALSE flag
cat("\n⚠️ Utilization Below 90%? ", util_below_90_flag, "\n")

# Step 4: Create a list to combine these elements
list_RL1 <- list(
  Machine = "RL1",  # Machine name
  Stats = util_stats_RL1,  # Utilization statistics
  Below_90_Flag = util_below_90_flag  # Logical flag
)

cat("\n📋 List for RL1 Analysis:\n")
print(list_RL1)

# ===============================================
# 🛠 Step 3: Accessing List Components

cat("\n🔍 Accessing Elements of a List\n")

# Access elements using $ or [[ ]]
cat("\n💡 Accessing Elements by Name:\n")
print(list_RL1$Stats)  # Access "Stats" using $
print(list_RL1[[2]])   # Access second element using index [[ ]]

# Access a specific value from the "Stats" component
cat("\n🔢 Accessing a Specific Value:\n")
print(list_RL1$Stats[2])  # Mean utilization

# --- 🔑 Key Notes:
# - `$` is used to access elements by name.
# - `[[ ]]` is used to access elements by position.
# - `[ ]` is used to subset vectors within a list.

# ===============================================
# 🛠 Step 4: Modifying Lists

cat("\n🔧 Modifying a List\n")

# Add a new element to the list
list_RL1$New_Element <- "Extra Info"
cat("\n📋 List After Adding a New Element:\n")
print(list_RL1)

# Remove an element
list_RL1$New_Element <- NULL
cat("\n🗑️ List After Removing the New Element:\n")
print(list_RL1)

# ===============================================
# 🛠 Step 5: Nested Lists

cat("\n🔍 Nested Lists\n")

# Create a nested list (a list within a list)
nested_list <- list(
  Machine_Info = list_RL1,  # Add RL1 list as a component
  Other_Info = "Additional data"
)

cat("\n📋 Nested List:\n")
print(nested_list)

# Access an element from the nested list
cat("\n🔑 Accessing Data from Nested List:\n")
print(nested_list$Machine_Info$Stats)

# ===============================================
# 🔑 Key Takeaways:
# 1. **What is a List?**
#    - Lists store multiple types of data in a single container.
#    - Ideal for combining diverse outputs like statistics, data frames, and flags.
#
# 2. **Accessing Elements**:
#    - Use `$` or `[[ ]]` to extract elements.
#    - Use `[ ]` to subset elements within vectors stored in lists.
#
# 3. **Modifying Lists**:
#    - Add or remove components dynamically.
#    - Lists can grow or shrink as needed.
#
# 4. **Nested Lists**:
#    - Lists can contain other lists, useful for hierarchical data storage.
#    - Access elements through chaining `$` or `[[ ]]`.

# --- 🚀 End of Script ---
# ===============================================