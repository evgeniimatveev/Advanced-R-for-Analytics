# ===============================================
# 🎓 Lecture-Script: Subsetting Lists in R
# ===============================================

# --- 🛠 Step 1: Revisiting the List
# Create the RL1 subset
RL1 <- util[util$Machine == "RL1", ]
head(RL1)  # Check the subset

cat("\n🔍 Revisiting the List (list_rl1):\n")
list_rl1 <- list(
  Machine = "RL1",
  Stats = c(0.849, 0.952, 0.995),  # Utilization statistics
  LowThreshold = TRUE,
  UnknownHours = RL1[is.na(RL1$Utilization), "PosixTime"],
  Data = RL1
)
print(list_rl1)

# --- 🔑 Key Notes:
# - Lists in R can be subsetted in different ways depending on the use case.
# - You can extract individual elements, multiple elements, or specific components.

# ===============================================
# 🛠 Step 2: Extracting Single Components
cat("\n📦 Extracting Single Components:\n")

# Using single square brackets - returns a list
single_brackets <- list_rl1[1]
cat("\n📋 Using [ ] (returns a list):\n")
print(single_brackets)

# Using double square brackets - returns the actual object
double_brackets <- list_rl1[[1]]
cat("\n🔑 Using [[ ]] (returns the actual object):\n")
print(double_brackets)

# Using $ notation for named components
dollar_sign <- list_rl1$Machine
cat("\n💡 Using $ (for named components):\n")
print(dollar_sign)

# --- 🔑 Key Notes:
# - **`[ ]`** always returns a list.
# - **`[[ ]]`** extracts the actual object.
# - **`$`** is shorthand for named components.

# ===============================================
# 🛠 Step 3: Extracting Multiple Components
cat("\n📚 Extracting Multiple Components:\n")

# Subset by index
subset_by_index <- list_rl1[c(1, 4)]
cat("\n🔢 Subset by Index:\n")
print(subset_by_index)

# Subset by names
subset_by_name <- list_rl1[c("Machine", "Stats")]
cat("\n🔑 Subset by Names:\n")
print(subset_by_name)

# --- 🔑 Key Notes:
# - Use `c()` to specify the indices or names of components to extract multiple elements.

# ===============================================
# 🛠 Step 4: Accessing Elements Within Components
cat("\n🎯 Accessing Elements Within Components:\n")

# Extracting the 2nd value from the Stats component
second_stat <- list_rl1$Stats[2]
cat("\n📊 2nd Value from Stats:\n")
print(second_stat)

# Alternatively, using double brackets
second_stat_alt <- list_rl1[[2]][2]
cat("\n🔑 Alternative Method for the Same Value:\n")
print(second_stat_alt)

# --- 🔑 Key Notes:
# - You can combine `[[ ]]` or `$` with `[ ]` to access specific elements within a list component.

# ===============================================
# 🔑 Key Takeaways:
# 1. **Single Brackets (`[ ]`)**:
#    - Returns a subset of the list as a list itself.
#
# 2. **Double Brackets (`[[ ]]`)**:
#    - Extracts the actual object stored in the list.
#
# 3. **Dollar Sign (`$`)**:
#    - Simplifies access to named components.
#
# 4. **Combining Brackets**:
#    - Combine `[[ ]]` or `$` with `[ ]` for nested subsetting.
#
# 5. **Subsetting by Index/Name**:
#    - Use `c()` for flexible multi-element subsetting.

# --- 🚀 End of Script ---
# ===============================================