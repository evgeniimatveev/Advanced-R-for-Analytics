# ============================================
# 🎓 Lecture: Using `which.max()` and `which.min()` in R
# ============================================

# --- 🧠 THEORY: What are `which.max()` and `which.min()`?
# 1. **Purpose**:
#    - `which.max()`: Finds the *position* of the maximum value in a vector.
#    - `which.min()`: Finds the *position* of the minimum value in a vector.

# 2. **Why Use Them?**:
#    - To locate the specific position/index of an extreme value in datasets.
#    - Combine with other functions to identify labels, months, or categories.

# 3. **Applications**:
#    - Identify the hottest/coldest months.
#    - Locate periods with maximum or minimum precipitation.
#    - Pinpoint months with the most or least sunshine.

# ============================================

# --- 📂 Step 1: Revisiting the Weather Data
# We will continue with our Weather list containing multiple data frames:
Weather <- list(
  Chicago = data.frame(
    AvgHigh_F = c(32, 36, 46, 50, 60, 70, 85, 82, 75, 63, 48, 36), 
    AvgLow_F = c(18, 21, 30, 41, 50, 60, 70, 68, 66, 57, 46, 34),
    AvgPrecip_inch = c(2.05, 1.93, 2.72, 3.31, 3.98, 3.23, 4.13, 4.21, 4.31, 3.43, 3.23, 2.56),
    DaysWithPrecip = c(10, 9, 11, 10, 12, 11, 9, 8, 8, 9, 10, 11),
    HoursOfSunshine = c(135, 136, 187, 215, 280, 311, 318, 283, 267, 226, 193, 113)
  ),
  NewYork = data.frame(
    AvgHigh_F = c(39, 42, 50, 60, 71, 80, 85, 83, 75, 63, 50, 40), 
    AvgLow_F = c(26, 30, 40, 50, 60, 70, 74, 72, 65, 54, 40, 30),
    AvgPrecip_inch = c(3.90, 3.56, 4.06, 4.56, 3.56, 4.13, 4.65, 4.33, 4.25, 3.50, 3.25, 3.10),
    DaysWithPrecip = c(11, 10, 12, 13, 12, 10, 9, 9, 10, 12, 11, 12),
    HoursOfSunshine = c(154, 171, 213, 240, 270, 310, 330, 300, 267, 220, 180, 140)
  )
)

# ============================================

# --- 🔍 Step 2: Basic Usage of `which.max()` and `which.min()`

# 1️⃣ Find the Hottest Month in Chicago 🏙️
cat("\n🔹 The hottest month in Chicago is:\n")
HottestMonth <- which.max(Weather$Chicago$AvgHigh_F)
names(Weather$Chicago$AvgHigh_F)[HottestMonth] <- month.abb[HottestMonth]
print(paste("The hottest month is:", month.abb[HottestMonth]))

# Explanation:
# - `which.max()` gives the index of the max value in `AvgHigh_F`.
# - `month.abb` is used to match the month name.

# 2️⃣ Find the Coldest Month in New York ❄️
cat("\n🔹 The coldest month in New York is:\n")
ColdestMonth <- which.min(Weather$NewYork$AvgLow_F)
print(paste("The coldest month is:", month.abb[ColdestMonth]))

# ============================================

# --- 🔗 Step 3: Advanced Nested Analysis

# 3️⃣ Identify Months with Maximum Sunshine for All Cities 🌞
cat("\n🔹 The months with maximum sunshine for each city are:\n")
MaxSunshine <- lapply(Weather, function(city) {
  month.abb[which.max(city$HoursOfSunshine)]
})
print(MaxSunshine)

# Explanation:
# - Outer `lapply()` iterates over cities.
# - `which.max()` finds the month with max sunshine.
# - `month.abb` maps the index to the month name.

# 4️⃣ Locate the Wettest Month in Each City 🌧️
cat("\n🔹 The wettest month in each city is:\n")
WettestMonth <- lapply(Weather, function(city) {
  month.abb[which.max(city$AvgPrecip_inch)]
})
print(WettestMonth)

# ============================================

# --- 🎯 Step 4: Combine with `apply()` and `sapply()`

# 5️⃣ Find the Month of Max Sunshine for All Cities (Simplified Output)
cat("\n🔹 Month of max sunshine for all cities (simplified):\n")
MaxSunshineSimplified <- sapply(Weather, function(city) {
  month.abb[which.max(city$HoursOfSunshine)]
})
print(MaxSunshineSimplified)

# 6️⃣ Find the Row (Month) with the Most Precipitation Across Cities
cat("\n🔹 Month with max precipitation for each city:\n")
MaxPrecipitation <- sapply(Weather, function(city) {
  which.max(city$AvgPrecip_inch)
})
print(MaxPrecipitation)

# ============================================

# --- 📝 Key Notes:
# 1. **Practical Use**:
#    - Use `which.max()` to locate indices of extreme values.
#    - Combine with `lapply()` or `sapply()` for scalable analysis across datasets.

# 2. **Best Practices**:
#    - Always check your data structure before applying these functions.
#    - Use `month.abb` or similar mappings for meaningful results.

# 3. **Customization**:
#    - Adapt for different metrics (temperature, precipitation, etc.).
#    - Combine with nested functions for advanced analysis.

# ============================================