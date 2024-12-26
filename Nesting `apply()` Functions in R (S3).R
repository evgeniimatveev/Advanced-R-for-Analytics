# ============================================
# 🎓 Lecture: Nesting `apply()` Functions in R
# ============================================

# --- 🧠 THEORY: Why Nest `apply()` Functions?
# 1. **Definition**:
#    - Nesting `apply()` functions means using one `apply()` inside another, 
#      or combining `apply()` with `lapply()` or `sapply()`.
#    - This approach is powerful when working with complex data structures like lists of data frames.

# 2. **Key Features**:
#    - Process hierarchical data efficiently (e.g., lists containing data frames).
#    - Combine operations across multiple levels of a dataset.

# 3. **Applications**:
#    - Summarizing data across dimensions (rows, columns, multiple data frames).
#    - Aggregating metrics for each city in a weather dataset.
#    - Identifying extreme values (e.g., max, min) across rows or columns.

# ============================================

# --- 📂 Step 1: Revisiting the Weather Data
# As before, we are using a list of weather data frames.
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

# --- 🔍 Step 2: Applying Nested Functions

# 1️⃣ Compute the Row Maximum for Each Data Frame 🏙️
cat("\n🔹 Maximum value for each row in all cities:\n")
RowMax <- lapply(Weather, function(city) apply(city, 1, max))
print(RowMax)

# Explanation:
# - Outer `lapply()` iterates over each data frame in the `Weather` list.
# - Inner `apply()` computes the row-wise maximum values for each city's data frame.

# 2️⃣ Find the Maximum Value for Each Column Across Cities 🌦️
cat("\n🔹 Maximum value for each column across all cities:\n")
ColMax <- sapply(Weather, function(city) apply(city, 2, max))
print(ColMax)

# Explanation:
# - Outer `sapply()` simplifies the output into a matrix.
# - Inner `apply()` computes column-wise maximum values for each city's data frame.

# 3️⃣ Combine Row Means and Max with Nesting 📊
cat("\n🔹 Row Means and Maximum combined for all cities:\n")
RowStats <- lapply(Weather, function(city) {
  Means <- rowMeans(city)
  MaxValues <- apply(city, 1, max)
  data.frame(Means, MaxValues)
})
print(RowStats)

# Explanation:
# - `rowMeans()` calculates the average value for each row.
# - `apply()` computes the maximum value for each row.
# - Results are combined into a data frame for each city.

# ============================================

# --- 🔗 Step 3: Advanced Analysis

# 4️⃣ Calculate Sunshine to Rain Ratio 🌞🌧️
cat("\n🔹 Sunshine to Rain Ratio for all cities:\n")
SunRainRatio <- sapply(Weather, function(city) {
  city$HoursOfSunshine / city$DaysWithPrecip
})
print(SunRainRatio)

# Explanation:
# - A custom function computes the ratio of `HoursOfSunshine` to `DaysWithPrecip` for each city.
# - Results are returned as a simplified matrix.

# 5️⃣ Use Nested `sapply()` for Multi-Level Analysis 🔁
cat("\n🔹 Find min and max of all numerical columns across all cities:\n")
MinMax <- sapply(Weather, function(city) {
  cbind(
    Min = apply(city, 2, min),
    Max = apply(city, 2, max)
  )
})
print(MinMax)

# Explanation:
# - `apply()` computes column-wise min and max values.
# - Results are combined into a matrix using `cbind()` for each city.

# ============================================

# --- 📝 Key Notes:
# 1. **Nesting Basics**:
#    - Use `lapply()` when working with lists and need consistent outputs.
#    - Use `sapply()` to simplify nested results when possible.
#    - Combine `apply()` for row or column operations with `lapply()` or `sapply()` for higher-level control.

# 2. **Best Practices**:
#    - Break down nested functions into smaller steps for debugging and clarity.
#    - Use inline comments to document the purpose of each layer.

# --- 💡 Tips:
# - Think of `lapply()` as iterating over "items" (e.g., data frames) and `apply()` as iterating over "dimensions" (rows/columns).
# - Use `str()` or `class()` to inspect the structure of your results.
