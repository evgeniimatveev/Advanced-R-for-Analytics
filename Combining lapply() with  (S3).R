# ============================================
# 🎓 Lecture: Combining lapply() with []
# ============================================

# --- 🧠 THEORY: Understanding lapply() and []
# 1. **lapply() Function**:
#    - A key member of the `apply` family in R, designed for lists.
#    - Applies a function to each element of a list and returns a list.
#    - Very flexible for operations on list elements like data frames or vectors.

# 2. **Combining with []**:
#    - The `[]` operator in R is used for subsetting elements of a data frame, vector, or list.
#    - Combining `lapply()` with `[]` allows for targeted extraction of rows, columns, or individual elements from list components.
#    - Example:
#      - `lapply(list, "[", , 1)` retrieves the first column of each data frame in the list.

# 3. **Advantages of Combining lapply() and []**:
#    - Simplifies repetitive tasks across multiple list elements.
#    - Enhances readability and reduces the need for nested loops.
#    - Great for subsetting or applying mathematical transformations.

# ============================================

# --- 📂 Step 1: Revisiting the Weather Data
# Creating a list of data frames for four cities
Weather <- list(
  Chicago = data.frame(
    AvgHigh_F = c(32, 36, 46), 
    AvgLow_F = c(18, 22, 30),
    AvgPrecip_inch = c(2.05, 1.93, 2.72),
    DaysWithPrecip = c(10, 9, 11),
    HoursOfSunshine = c(135, 136, 187)
  ),
  NewYork = data.frame(
    AvgHigh_F = c(39, 42, 50), 
    AvgLow_F = c(26, 30, 35),
    AvgPrecip_inch = c(3.90, 3.56, 4.06),
    DaysWithPrecip = c(11, 10, 12),
    HoursOfSunshine = c(154, 171, 213)
  ),
  Houston = data.frame(
    AvgHigh_F = c(65, 72, 73), 
    AvgLow_F = c(50, 51, 53),
    AvgPrecip_inch = c(4.13, 3.95, 3.39),
    DaysWithPrecip = c(8, 8, 8),
    HoursOfSunshine = c(200, 211, 192)
  ),
  SanFrancisco = data.frame(
    AvgHigh_F = c(57, 60, 62), 
    AvgLow_F = c(46, 48, 49),
    AvgPrecip_inch = c(3.15, 2.99, 3.27),
    DaysWithPrecip = c(10, 9, 10),
    HoursOfSunshine = c(200, 211, 251)
  )
)

# --- 🔍 Step 2: Using lapply() to Access Specific Elements

# Extract the first column (AvgHigh_F) from each city's data
cat("\n🔹 Extracting the first column (AvgHigh_F) from each city's data:\n")
HighTemps <- lapply(Weather, "[", , 1)  # Extracts all rows (",") and the first column ("1")
print(HighTemps)

# Explanation:
# - Here, `lapply(Weather, "[", , 1)` applies the "[" operator to each data frame in the `Weather` list.
# - The `, 1` selects the first column (AvgHigh_F) for all rows.

# Extract the second row (February) from each city's data
cat("\n🔹 Extracting the second row (February) from each city's data:\n")
FebruaryData <- lapply(Weather, "[", 2, )  # Extracts the entire second row for each city
print(FebruaryData)

# Explanation:
# - `2,` specifies the second row (February) from each data frame in the list.
# - This is useful for comparing monthly statistics.

# Extract specific values (AvgHigh_F for February)
cat("\n🔹 Extracting specific values (AvgHigh_F for February):\n")
FebruaryHigh <- lapply(Weather, "[", 2, 1)  # Extracts second row and first column (AvgHigh_F for February)
print(FebruaryHigh)

# Explanation:
# - `2, 1` selects the specific element in the second row and first column of each data frame.
# - This targets one exact value from each city’s data.

# --- ➗ Step 3: Applying Mathematical Functions Using lapply()

# Calculate the average precipitation for each city
cat("\n🔹 Calculating the average precipitation for each city:\n")
AvgPrecip <- lapply(Weather, function(city) mean(city$AvgPrecip_inch))  # Calculates average precipitation
print(AvgPrecip)

# Explanation:
# - This applies a custom function (`mean(city$AvgPrecip_inch)`) to each city's data.
# - Calculates the mean of the `AvgPrecip_inch` column for each data frame.

# Calculate the maximum Hours of Sunshine for each city
cat("\n🔹 Calculating the maximum Hours of Sunshine for each city:\n")
MaxSunshine <- lapply(Weather, function(city) max(city$HoursOfSunshine))  # Finds maximum sunshine hours
print(MaxSunshine)

# Explanation:
# - `max(city$HoursOfSunshine)` computes the maximum value in the `HoursOfSunshine` column for each city.
# - This is helpful for identifying the sunniest period in each city.

# --- 📌 Key Notes:
# 1. lapply() + [] allows precise extraction of rows, columns, or individual values across list elements.
# 2. Use custom functions with lapply() for mathematical and data analysis tasks.
# 3. This combination is efficient and concise for list-based operations.

# --- 💡 Tips:
# - Use `sapply()` if you want the results in a simplified vector or matrix format.
# - Always check the structure of your data with `str()` before applying functions to ensure proper indexing.
# - Experiment with different subsetting techniques and mathematical operations to gain deeper insights into your data!