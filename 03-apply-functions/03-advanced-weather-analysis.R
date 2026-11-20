# ================================================================
# 🌟 Advanced Weather Analysis Script with Loops and `apply()` 🚀
# ================================================================

# --- 🛠️ Step 1: Data Preparation -------------------------------
# 🔹 Weather data for Chicago, New York, and San Francisco.
# 🔹 Using matrices for each city and storing them in a list.

cat("📊 Preparing weather data for analysis:\n")

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

Weather <- list(Chicago = Chicago, NewYork = NewYork, SanFrancisco = SanFrancisco)

cat("✅ Data is ready:\n")
print(Weather)

# --- 📈 Step 2: Recreating apply() with Loops -------------------
cat("\n🔄 Recreating the apply() function with loops:\n")

# Example: Calculating the mean of each row (seasons) for Chicago
cat("\n➡️ Calculating seasonal means for Chicago using a loop:\n")
output <- NULL  # Initialize empty vector
for (i in 1:nrow(Chicago)) {
  output[i] <- mean(Chicago[i, ])  # Calculate row mean
}
names(output) <- rownames(Chicago)  # Add row names
print(output)

cat("\n➡️ Calculating seasonal means for Chicago using apply():\n")
apply_output <- apply(Chicago, 1, mean)  # Equivalent to the loop
print(apply_output)

# --- ⚙️ Step 3: Custom Analysis -------------------------------
cat("\n📊 Performing additional analysis:\n")

# 🔹 Calculate the range (max - min) for each row (season) across all cities.
cat("\n🌀 Seasonal temperature ranges (max - min):\n")
seasonal_ranges <- lapply(Weather, function(city) apply(city, 1, function(x) max(x) - min(x)))
print(seasonal_ranges)

# 🔹 Normalize the data for each city by subtracting the mean and dividing by the standard deviation.
cat("\n📉 Normalizing data (z-scores) for each city:\n")
normalize <- function(x) (x - mean(x)) / sd(x)
normalized_weather <- lapply(Weather, function(city) apply(city, 1:2, normalize))
print(normalized_weather)

# 🔹 Identify months with temperatures above a threshold (e.g., 85°F).
cat("\n🌡️ Months with temperatures above 85°F:\n")
above_85 <- lapply(Weather, function(city) {
  apply(city, 2, function(x) any(x > 85))  # Check if any temperature in a column is > 85
})
print(above_85)

# 🔹 Calculate total temperatures for each season.
cat("\n📊 Total temperature by season:\n")
season_totals <- lapply(Weather, function(city) apply(city, 1, sum))
print(season_totals)

# --- 🔍 Step 4: Comparing Cities ------------------------------
cat("\n🌍 Comparing cities based on temperature metrics:\n")

# 🔹 Mean temperature across all seasons.
cat("\n📈 Average temperature for each city:\n")
average_temp <- sapply(Weather, function(city) mean(city))
print(average_temp)

# 🔹 Maximum temperature observed in each city.
cat("\n🔥 Maximum temperature for each city:\n")
max_temp <- sapply(Weather, function(city) max(city))
print(max_temp)

# 🔹 Minimum temperature observed in each city.
cat("\n❄️ Minimum temperature for each city:\n")
min_temp <- sapply(Weather, function(city) min(city))
print(min_temp)

# --- 🧮 Step 5: Practice Tasks ---------------------------------
cat("\n🧮 Additional practice tasks for deeper analysis:\n")

# 🔹 Fraction of temperatures above 85°F by city.
cat("\n🧮 Fraction of temperatures > 85°F for each city:\n")
fraction_above_85 <- sapply(Weather, function(city) mean(city > 85))
print(fraction_above_85)

# 🔹 Median temperature by season for each city.
cat("\n📊 Median temperatures by season:\n")
median_temps <- lapply(Weather, function(city) apply(city, 1, median))
print(median_temps)

# 🔹 Identify the season with the highest total temperature in each city.
cat("\n🏆 Season with the highest total temperature in each city:\n")
highest_temp_season <- lapply(Weather, function(city) {
  season_totals <- apply(city, 1, sum)
  names(which.max(season_totals))  # Return the season with the highest total
})
print(highest_temp_season)

# --- 🗝️ Key Takeaways -----------------------------------------
# 🗂️ **Key Notes about apply() and Loops:**
# - Loops provide flexibility but are verbose and less efficient.
# - `apply()` and its family (e.g., `lapply`, `sapply`) make operations concise and expressive.
# - Use loops for complex operations that can't be vectorized.

# 🎯 **Tips for Weather Data Analysis:**
# - Normalize data for comparisons across cities with different temperature scales.
# - Focus on meaningful metrics like seasonal ranges or thresholds.
# - Aggregate data (e.g., totals, averages) for better interpretability.

cat("\n✅ Script completed successfully! Happy analyzing! 😊\n")