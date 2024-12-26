# ===============================================
# 🎓 Lecture-Script: Extracting Components of Lists: [] vs [[]] vs $
# ===============================================

# --- 🛠 Step 1: Understanding the Difference
cat("\n📚 Understanding Different List Extraction Methods:\n")

# Three common methods to extract components from a list:
# 1. **Single Brackets []**: Returns a sublist, keeping the data structure intact.
# 2. **Double Brackets [[]]**: Extracts the actual object inside the list.
# 3. **Dollar Sign $**: Conveniently extracts named components.

# --- 🔑 Key Notes:
# - Use **`[]`** when you want to keep the component in list form.  
# - Use **`[[]]`** when you need the raw object.  
# - Use **`$`** for named list elements—it’s cleaner and more readable.

# ===============================================
# 🛠 Step 2: Creating a Sample List

cat("\n🔨 Creating a Sample List:\n")

# Example list
list_rl1 <- list(
  Machine = "RL1",
  Stats = c(0.849, 0.952, 0.995),  # Utilization values
  LowThreshold = TRUE
)

cat("\n📋 List Structure:\n")
print(list_rl1)

# ===============================================
# 🛠 Step 3: Extracting Components with `[]`

cat("\n🗂️ Extracting Components with Single Brackets ([]):\n")

# Extract "Machine" using []
machine_sublist <- list_rl1[1]  # Keeps the result as a sublist
print(machine_sublist)

cat("\n🔑 Type of result:\n")
print(typeof(machine_sublist))  # Type is still "list"

# --- 🔑 Key Notes:
# - **`[]`** always returns a list, even if the selected element is a single component.

# ===============================================
# 🛠 Step 4: Extracting Components with `[[]]`

cat("\n🎯 Extracting Components with Double Brackets ([[]]):\n")

# Extract "Machine" using [[]]
machine_raw <- list_rl1[[1]]  # Extracts the actual object (a character string in this case)
print(machine_raw)

cat("\n🔑 Type of result:\n")
print(typeof(machine_raw))  # Type is now "character"

# --- 🔑 Key Notes:
# - **`[[]]`** extracts the actual data inside the list, dropping the list structure.

# ===============================================
# 🛠 Step 5: Extracting Components with `$`

cat("\n💡 Extracting Components with Dollar Sign ($):\n")

# Extract "Stats" using $
stats <- list_rl1$Stats
print(stats)

cat("\n🔑 Type of result:\n")
print(typeof(stats))  # Type is now "double"

# --- 🔑 Key Notes:
# - **`$`** is a shortcut to extract named components directly.

# ===============================================
# 🛠 Step 6: Accessing Nested Elements

cat("\n🔍 Accessing Specific Elements Inside a Component:\n")

# Access the 3rd element of the "Stats" vector
third_stat <- list_rl1$Stats[3]
print(third_stat)  # Prints the third value: 0.995

# Same using [[]]
third_stat_alt <- list_rl1[[2]][3]
print(third_stat_alt)

# --- 🔑 Key Notes:
# - You can chain extraction methods, e.g., `[[]]` followed by `[index]`.

# ===============================================
# 🔑 Key Takeaways:
# 1. **`[]` vs `[[]]` vs `$`:**
#    - Use `[]` for sublists.
#    - Use `[[]]` for raw data extraction.
#    - Use `$` for named components—it’s concise and clear.
#
# 2. **Nested Access:**
#    - Combine methods like `[[]][index]` or `$[index]` for specific elements.
#
# 3. **Best Practices:**
#    - Use `$` for named components whenever possible—it improves readability.
#    - Use `[[]]` for numeric indexing when names are not available.

# --- 🚀 End of Script ---
# ===============================================