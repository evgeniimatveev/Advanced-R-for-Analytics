# advanced_r_quick_demo.R
# Quick demo: advanced R concepts in a small, readable workflow
# - missing value handling
# - apply-family functions (tapply, mapply)
# - compact summary for analytics

# 1. Tiny demo dataset ----------------------------------------------

raw_data <- data.frame(
  machine      = c("A", "A", "B", "B", "C"),
  utilization  = c(0.92, NA, 0.76, 0.83, NA),
  temperature  = c(75.1, 76.3, 80.0, 78.5, 77.0),
  stringsAsFactors = FALSE
)

# Flag rows with missing utilization
raw_data$has_missing_util <- is.na(raw_data$utilization)

# 2. Impute missing utilization by machine median -------------------

# Compute machine-wise medians for utilization (ignoring NAs)
median_by_machine <- tapply(
  raw_data$utilization,
  raw_data$machine,
  FUN = function(x) median(x, na.rm = TRUE)
)

# Replace NAs with the corresponding machine median
raw_data$utilization_imputed <- mapply(
  FUN = function(util, machine) {
    if (is.na(util)) median_by_machine[[machine]] else util
  },
  util   = raw_data$utilization,
  machine = raw_data$machine
)

# 3. Create a compact summary using the apply family ----------------

util_summary <- sapply(
  raw_data["utilization_imputed"],
  FUN = function(x) {
    c(
      min  = min(x),
      mean = mean(x),
      max  = max(x)
    )
  }
)

# 4. Print results --------------------------------------------------

cat("=== Raw data with flags and imputed utilization ===\n")
print(raw_data)

cat("\n=== Utilization (imputed) summary ===\n")
print(round(util_summary, 3))
