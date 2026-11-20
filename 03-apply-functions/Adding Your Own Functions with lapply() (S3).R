# ============================================
# 🎓 Lecture: Adding Your Own Functions with lapply()
# ============================================

# --- 🧠 THEORY: Creating Custom Functions in lapply()
# 1. **Why Use Custom Functions?**
#    - lapply() is extremely flexible and allows users to apply *any* function to list elements.
#    - You can define your own functions directly within lapply() or outside for reuse.
#
# 2. **Inline (Anonymous) Functions**:
#    - These are defined directly in lapply(), making code more concise.
#    - Example: `lapply(my_list, function(x) mean(x))`
#
# 3. **External (Named) Functions**:
#    - Defined outside of lapply() and referenced by name.
#    - Useful for complex logic or reusable functions.
#
# 4. **Practical Uses**:
#    - Apply mathematical transformations to data.
#    - Extract specific rows/columns from each data frame.
#    - Calculate custom metrics like temperature fluctuations or seasonal averages.

# ============================================

# --- 📂 Step 1: Revisiting the Weather Data
# The Weather list contains data frames for four cities.
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

# ============================================

# --- 🔍 Step 2: Adding Custom Functions with lapply()

# 1️⃣ Calculate row means for all data frames
cat("\n🔹 Row means for all weather data frames:\n")
RowMeans <- lapply(Weather, rowMeans)
print(RowMeans)

# Explanation:
# - The function `rowMeans()` calculates the average for each row in the data frames.
# - Using `lapply()`, this operation is applied to every city's data frame.

# 2️⃣ Extract the first column (AvgHigh_F) using a custom function
cat("\n🔹 Extracting the first column (AvgHigh_F) using a custom function:\n")
ExtractHigh <- lapply(Weather, function(x) x[, 1])
print(ExtractHigh)

# Explanation:
# - An anonymous function `function(x) x[, 1]` is created to extract the first column.
# - This column corresponds to the `AvgHigh_F` column in each data frame.

# 3️⃣ Calculate temperature fluctuations (difference between AvgHigh_F and AvgLow_F)
cat("\n🔹 Calculating temperature fluctuations for each city:\n")
TempFluctuations <- lapply(Weather, function(z) round(z[, 1] - z[, 2], 2))  # Difference between columns
print(TempFluctuations)

# Explanation:
# - This anonymous function computes `z[, 1] - z[, 2]` (High - Low temperatures).
# - `round(..., 2)` ensures results are rounded to two decimal places.

# 4️⃣ Create a reusable function for sunshine hours per precipitation day
cat("\n🔹 Sunshine hours per day with precipitation (custom reusable function):\n")
SunshinePerPrecip <- function(city_data) {
  round(city_data$HoursOfSunshine / city_data$DaysWithPrecip, 2)
}
SunshineEfficiency <- lapply(Weather, SunshinePerPrecip)
print(SunshineEfficiency)

# Explanation:
# - A reusable function `SunshinePerPrecip` is defined to calculate efficiency.
# - It divides `HoursOfSunshine` by `DaysWithPrecip` for each city.

# ============================================

# --- 🔗 Step 3: Advanced Applications and Flexibility

# 5️⃣ Extract multiple columns (AvgHigh_F and AvgLow_F) using lapply()
cat("\n🔹 Extracting multiple columns (AvgHigh_F and AvgLow_F):\n")
HighLowTemps <- lapply(Weather, function(x) x[, c("AvgHigh_F", "AvgLow_F")])
print(HighLowTemps)

# Explanation:
# - Here, a subset of columns is extracted using column names.
# - This is especially useful for selecting relevant data features.

# 6️⃣ Calculate monthly averages of precipitation for all cities
cat("\n🔹 Monthly averages of precipitation (AvgPrecip_inch):\n")
MonthlyPrecipitation <- lapply(Weather, function(x) mean(x$AvgPrecip_inch))
print(MonthlyPrecipitation)

# ============================================

# --- 📌 Key Notes:
# 1. Inline functions are great for one-off custom calculations within lapply().
# 2. Reusable functions simplify code when the same logic is applied across multiple analyses.
# 3. Combine subsetting (`[]`) with custom functions for precise data manipulation.
# 4. Always document your functions for better code readability and reuse.

# --- 💡 Tips:
# - Start with a simple function and iterate to make it more complex as needed.
# - Test your custom function on a single data frame before applying it across a list.
# - Use descriptive function names to make your code self-explanatory.