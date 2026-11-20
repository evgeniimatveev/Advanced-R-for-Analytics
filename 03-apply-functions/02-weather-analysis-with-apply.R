# ================================================================
# 🌟 R Script: Weather Analysis using apply() and Family Functions
# ================================================================

# --- 🛠️ Step 1: Data Preparation -------------------------------
# 🔹 Creating weather data matrices for Chicago, New York, and San Francisco.
# 🔹 Data is stored in a list for easier manipulation.

cat("📊 Preparing weather data for analysis:\n")

# Creating weather data for three cities
Chicago <- matrix(c(32, 36, 40, 45, 50, 55, 60, 70, 75, 80, 90, 95), 
                  nrow = 4, byrow = TRUE, 
                  dimnames = list(c("Winter", "Spring", "Summer", "Fall"), 
                                  c("Jan", "Feb", "Mar")))

NewYork <- matrix(c(30, 35, 38, 43, 47, 53, 57, 68, 72, 78, 85, 91), 
                  nrow = 4, byrow = TRUE, 
                  dimnames = list(c("Winter", "Spring", "Summer", "Fall"), 
                                  c("Jan", "Feb", "Mar")))

SanFrancisco <- matrix(c(50, 55, 60, 65, 70, 75, 80, 90, 95, 100, 105, 110), 
                       nrow = 4, byrow = TRUE, 
                       dimnames = list(c("Winter", "Spring", "Summer", "Fall"), 
                                       c("Jan", "Feb", "Mar")))

# Storing the data in a list for easier manipulation
Weather <- list(Chicago = Chicago, NewYork = NewYork, SanFrancisco = SanFrancisco)

cat("✅ Data is ready:\n")
print(Weather)

# --- 📈 Step 2: Aggregations with apply() -----------------------
# 🔹 Using apply() to calculate summary metrics for rows (seasons) and columns (months).

cat("\n📈 Calculating seasonal averages for each city:\n")
seasonal_avg <- lapply(Weather, function(city) apply(city, 1, mean))
print(seasonal_avg)

cat("\n🌡️ Finding maximum temperatures by month for each city:\n")
monthly_max <- lapply(Weather, function(city) apply(city, 2, max))
print(monthly_max)

cat("\n🌀 Calculating temperature range (max - min) by season:\n")
seasonal_range <- lapply(Weather, function(city) apply(city, 1, function(x) max(x) - min(x)))
print(seasonal_range)

# --- ⚙️ Step 3: Advanced Analysis ------------------------------
# 🔹 New analysis for deep insights.

cat("\n⛈️ Counting extreme temperatures (>85°F) for each season:\n")
extreme_weather <- lapply(Weather, function(city) apply(city, 1, function(x) sum(x > 85)))
print(extreme_weather)

cat("\n🔍 Finding the coldest month (minimum temperature) for each city:\n")
coldest_month <- lapply(Weather, function(city) apply(city, 2, min))
print(coldest_month)

cat("\n📊 Total temperature by season for each city (sum of all months):\n")
total_temperature <- lapply(Weather, function(city) apply(city, 1, sum))
print(total_temperature)

cat("\n📉 Identifying seasons with below-average temperatures:\n")
# Calculate the average temperature across all cities
all_cities_avg <- mean(unlist(lapply(Weather, mean)))
below_avg_seasons <- lapply(Weather, function(city) {
  apply(city, 1, function(x) mean(x) < all_cities_avg)
})
print(below_avg_seasons)

# --- 🏙️ Step 4: Comparing Cities -------------------------------
# 🔹 Comparing cities using aggregated metrics.

cat("\n🌍 Comparing average temperatures across all cities:\n")
city_means <- sapply(Weather, function(city) mean(city))
print(city_means)

cat("\n🔥 Maximum temperatures for all cities:\n")
city_max <- sapply(Weather, function(city) max(city))
print(city_max)

cat("\n❄️ Minimum temperatures for all cities:\n")
city_min <- sapply(Weather, function(city) min(city))
print(city_min)

# --- 🧮 Step 5: Practice Tasks ----------------------------------
# 🔹 Additional calculations for further insights.

cat("\n🧮 Task 1: Fraction of temperatures above 85°F by city:\n")
fraction_above_85 <- sapply(Weather, function(city) mean(city > 85))
print(fraction_above_85)

cat("\n🧮 Task 2: Calculating median temperatures by season:\n")
median_seasonal_temp <- lapply(Weather, function(city) apply(city, 1, median))
print(median_seasonal_temp)

cat("\n📊 Task 3: Standard deviation of temperatures by month:\n")
std_monthly_temp <- lapply(Weather, function(city) apply(city, 2, sd))
print(std_monthly_temp)

# --- 🗝️ Key Takeaways -----------------------------------------
# 🗂️ **Key Notes about apply():**
# - `apply()` operates on matrices (rows or columns). For rows, use `MARGIN = 1`; for columns, use `MARGIN = 2`.
# - `lapply()` processes each element of a list and returns a list.
# - `sapply()` is a simplified version of `lapply()` that tries to return a vector or matrix.

# 🎯 **Why Use apply()?**
# - Efficiently handles repetitive tasks across rows, columns, or list elements.
# - Reduces the need for explicit loops, making the code concise and expressive.

cat("\n✅ Script completed successfully! Happy analyzing! 😊\n")