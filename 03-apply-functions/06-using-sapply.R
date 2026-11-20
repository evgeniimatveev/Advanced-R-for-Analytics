# ============================================
# 🎓 Lecture: Using sapply() in R
# ============================================

# --- 🧠 THEORY: What is sapply()?
# 1. **Definition**:
#    - `sapply()` is a user-friendly version of `lapply()` in R.
#    - While `lapply()` always returns a list, `sapply()` tries to simplify the result.
#    - It returns a vector, matrix, or array when possible.

# 2. **Key Features**:
#    - **Simplifies Output**: Converts lists into vectors or matrices, if all elements have the same structure.
#    - **Flexible Application**: Works on lists, data frames, or even simple objects.

# 3. **Comparison**:
#    - Use `lapply()` if you want consistent list outputs.
#    - Use `sapply()` for compact, simplified results.

# 4. **Practical Applications**:
#    - Summarizing data (e.g., mean, sum, range).
#    - Selecting specific elements from a list or data frame.
#    - Applying functions that return scalar values.

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

# --- 🔍 Step 2: Applying sapply()

# 1️⃣ Extract the Average High (AvgHigh_F) for specific months (e.g., July)
cat("\n🔹 Average High Temperatures for July (index 1):\n")
JulyHigh <- sapply(Weather, function(x) x$AvgHigh_F[1])  # July is at index 1
print(JulyHigh)

# Explanation:
# - We extract the first value of the `AvgHigh_F` column from each city's data frame.
# - `sapply()` simplifies the output into a named vector.

# 2️⃣ Extract Average High for the Fourth Quarter (October, November, December)
cat("\n🔹 Average High Temperatures for Q4 (indices 10-12):\n")
Q4High <- sapply(Weather, function(x) x$AvgHigh_F[10:12], simplify = TRUE)
print(Q4High)

# Explanation:
# - Indices `10:12` correspond to the 4th quarter.
# - `sapply()` simplifies the result into a matrix.

# 3️⃣ Row Means for all Weather Data Frames
cat("\n🔹 Row Means for all Weather Data Frames:\n")
RowMeans <- sapply(Weather, rowMeans, simplify = TRUE)  # Similar to lapply(), but simplified
print(RowMeans)

# Explanation:
# - `rowMeans()` computes averages across rows for each data frame.
# - `sapply()` simplifies the result into a matrix.

# 4️⃣ Sunshine Efficiency (Hours of Sunshine / Days with Precipitation)
cat("\n🔹 Sunshine Efficiency (Hours per Precipitation Day):\n")
SunshineEfficiency <- sapply(Weather, function(x) round(x$HoursOfSunshine / x$DaysWithPrecip, 2))
print(SunshineEfficiency)

# Explanation:
# - This custom function divides sunshine hours by days with precipitation.
# - Results are rounded to 2 decimal places and returned as a matrix.

# ============================================

# --- 🔗 Step 3: Advanced Use Cases

# 5️⃣ Custom Function: Calculate Temperature Range (High - Low)
cat("\n🔹 Temperature Range (High - Low):\n")
TempRange <- sapply(Weather, function(x) x$AvgHigh_F - x$AvgLow_F)
print(TempRange)

# Explanation:
# - This custom function calculates the difference between AvgHigh_F and AvgLow_F.
# - Results are returned as a simplified matrix.

# 6️⃣ Nested Application: Row Means with Rounding
cat("\n🔹 Rounded Row Means for Weather Data Frames:\n")
RoundedRowMeans <- round(sapply(Weather, rowMeans, simplify = TRUE), 2)
print(RoundedRowMeans)

# Explanation:
# - Results from `rowMeans()` are passed to `round()`.
# - Final output is a neatly formatted matrix.

# ============================================

# --- 📌 Key Notes:
# 1. `sapply()` tries to simplify output wherever possible:
#    - Scalar outputs are simplified into vectors.
#    - Equal-length outputs are simplified into matrices or arrays.
# 2. Use `simplify = FALSE` if you want a list output, similar to `lapply()`.
# 3. Ideal for summarizing, extracting, or transforming data in lists or data frames.

# --- 💡 Tips:
# - When precision matters, check the structure of the output (`class()` or `str()`).
# - Combine custom functions with `sapply()` to unlock powerful and flexible data transformations.
# - Explore `simplify = FALSE` for consistency when working with irregular data.