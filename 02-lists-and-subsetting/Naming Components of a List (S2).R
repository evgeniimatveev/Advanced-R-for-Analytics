# ===============================================
# 🎓 Lecture-Script: Naming Components of a List
# ===============================================

# --- 🛠 Step 1: Creating a List
cat("\n🔍 Creating a List for Machine RL1 Analysis\n")

# Define a list without component names
list_rl1 <- list("RL1", util_stats_RL1, util_below_90_flag)

cat("\n📋 List Before Naming Components:\n")
print(list_rl1)

# --- 🔑 Key Notes:
# - A list is initially created without component names.
# - This makes accessing components less intuitive (you can only use the index).

# ===============================================
# 🛠 Step 2: Naming the Components of a List

cat("\n✏️ Naming Components of the List\n")

# Add names to the components
names(list_rl1) <- c("Machine", "Stats", "LowThreshold")

cat("\n📋 List After Naming Components:\n")
print(list_rl1)

# Access components by name
cat("\n🔑 Accessing Components by Name:\n")
print(list_rl1$Machine)  # Access "Machine"
print(list_rl1$Stats)    # Access "Stats"
print(list_rl1$LowThreshold)  # Access "LowThreshold"

# --- 🔑 Key Notes:
# - Using **`names()`** allows you to assign descriptive names to list components.
# - After naming, you can access components by name or by index.

# ===============================================
# 🛠 Step 3: Modifying Component Names

cat("\n🔧 Modifying Component Names\n")

# Change the names of the components
names(list_rl1) <- c("MachineName", "UtilizationStats", "Below90Flag")

cat("\n📋 List After Renaming Components:\n")
print(list_rl1)

# --- 🔑 Key Notes:
# - Component names can be changed at any time by reassigning them using `names()`.

# ===============================================
# 🛠 Step 4: Creating a List with Named Components Directly

cat("\n✨ Creating a List with Named Components Directly\n")

# Create a list with named components
list_rl1_named <- list(
  Machine = "RL1",
  Stats = util_stats_RL1,
  LowThreshold = util_below_90_flag
)

cat("\n📋 List with Named Components:\n")
print(list_rl1_named)

# --- 🔑 Key Notes:
# - Defining names directly while creating the list makes the code cleaner and easier to understand.

# ===============================================
# 🛠 Step 5: Removing a Component from a List

cat("\n🗑️ Removing a Component from the List\n")

# Remove the "LowThreshold" component
list_rl1_named$LowThreshold <- NULL

cat("\n📋 List After Removing 'LowThreshold':\n")
print(list_rl1_named)

# --- 🔑 Key Notes:
# - Components in a list can be removed by setting them to `NULL`.

# ===============================================
# 🛠 Step 6: Exploring Nested Lists

cat("\n🔍 Working with Nested Lists\n")

# Create a nested list
nested_list <- list(
  MachineData = list_rl1_named,
  AdditionalInfo = c("Analysis Complete", Sys.Date())
)

cat("\n📋 Nested List:\n")
print(nested_list)

# Access data in nested lists
cat("\n🔑 Accessing Data from Nested Lists:\n")
print(nested_list$MachineData$Stats)  # Access Stats within nested list
print(nested_list$AdditionalInfo[2])  # Access Date in AdditionalInfo

# ===============================================
# 🔑 Key Takeaways:
# 1. **Naming Components:**
#    - Names make working with lists more intuitive.
#    - You can assign names after creation using **`names()`**, or directly while creating the list.
#
# 2. **Removing Components:**
#    - Components can be removed by assigning them `NULL`.
#
# 3. **Nested Lists:**
#    - Lists can contain other lists, creating hierarchical data structures.
#    - Access is performed using `$` or `[[ ]]`.
#
# 4. **Flexibility of Lists:**
#    - Lists are ideal for storing heterogeneous data, such as vectors, data frames, or other lists.

# --- 🚀 End of Script ---
# ===============================================