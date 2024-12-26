# ===============================================
# 🎓 Lecture-Script: Adding and Deleting Components in Lists
# ===============================================

# --- 🛠 Step 1: Adding Components to a List
cat("\n➕ Adding New Components to a List:\n")

# Recall the existing list
list_rl1 <- list(
  Machine = "RL1",
  Stats = c(0.849, 0.952, 0.995),  # Utilization values
  LowThreshold = TRUE
)

# Adding a new component to the list
list_rl1[4] <- "New Information"
cat("\n🆕 List After Adding a Component:\n")
print(list_rl1)

# --- 🔑 Key Notes:
# - Use `list_name[index] <- value` to add a component.
# - Indexing starts at the next available position.

# ===============================================
# 🛠 Step 2: Adding Components with `$`
cat("\n💡 Adding a Component Using the `$` Syntax:\n")

# Adding a new vector using `$`
list_rl1$UnknownHours <- RL1[is.na(RL1$Utilization), "PosixTime"]
cat("\n⏳ Added Unknown Hours:\n")
print(list_rl1)

# --- 🔑 Key Notes:
# - `$` can add new named components to a list dynamically.
# - Example: Adding all hours where `Utilization` is `NA`.

# ===============================================
# 🛠 Step 3: Deleting Components from a List
cat("\n🗑️ Deleting Components from a List:\n")

# Removing the 4th component (New Information)
list_rl1[4] <- NULL
cat("\n🗑️ List After Removing the Component:\n")
print(list_rl1)

# --- 🔑 Key Notes:
# - Assign `NULL` to the desired index to remove the component.
# - Notice how the numeration of components adjusts automatically.

# ===============================================
# 🛠 Step 4: Adding a Data Frame as a List Component
cat("\n📋 Adding a Data Frame to the List:\n")

# Adding a new component (data frame)
list_rl1$Data <- RL1
cat("\n📊 Updated List:\n")
summary(list_rl1)

# Check the structure of the updated list
cat("\n🔍 Structure of the List:\n")
str(list_rl1)

# --- 🔑 Key Notes:
# - Lists can contain various data types, including entire data frames.
# - This is useful for combining raw data and metadata in a single object.

# ===============================================
# 🔑 Key Takeaways:
# 1. **Adding Components:**
#    - Use `list_name[index] <- value` to add unnamed components.
#    - Use `$` for named components—it’s intuitive and readable.
#
# 2. **Deleting Components:**
#    - Assign `NULL` to an index or a name to remove a component.
#    - Removing components adjusts the list structure automatically.
#
# 3. **Flexible Data Storage:**
#    - Lists can store anything: vectors, data frames, or even other lists!
#
# 4. **Practical Use:**
#    - Organize analysis results, metadata, and processed data efficiently in a single object.

# --- 🚀 End of Script ---
# ===============================================