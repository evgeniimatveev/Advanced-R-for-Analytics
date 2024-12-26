# ==========================================
# 🧠 Step 1: Theory - Time Series Visualization in R
# ==========================================
cat("\n🧠 Theory - Time Series Visualization:\n")

# Time series plots are essential for analyzing trends and patterns over time. 
# In R, the ggplot2 package provides a powerful way to visualize time series data. 
# Key concepts:
# - **Time Series**: Data points collected or recorded at specific time intervals.
# - **Faceting**: Dividing a single visualization into subplots based on a grouping variable.
# - **Threshold Lines**: Visual markers that indicate critical levels for comparison.

# Common Scenarios for Time Series:
# 1. Monitoring **system utilization** or performance over time.
# 2. Identifying patterns or anomalies in **machine or system metrics**.
# 3. Visualizing **grouped data** for comparative analysis.

# ==========================================
# 🔧 Step 2: Load Required Libraries
# ==========================================
cat("\n🔧 Loading Required Libraries:\n")
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# ==========================================
# 🔍 Step 3: Data Preparation
# ==========================================
cat("\n🔍 Preparing the Data:\n")

# Example: Using a dataset with columns:
# - PosixTime: Time stamps for each record.
# - Percent.Idle: Percent of time a machine is idle.
# - Machine: Identifier for each machine (e.g., RL1, RL2).

# Simulate an example data frame if not already available
set.seed(123)  # Reproducibility
util <- data.frame(
  PosixTime = seq(as.POSIXct("2023-01-01 00:00"), as.POSIXct("2023-01-01 23:59"), by = "hour"),
  Percent.Idle = runif(24, 0.05, 0.25),
  Machine = rep(c("RL1", "RL2"), each = 12)
)

# Add Utilization column
util$Utilization <- 1 - util$Percent.Idle

# Display the structure of the dataset
cat("Structure of the dataset:\n")
str(util)

# ==========================================
# 📈 Step 4: Creating Time Series Plot
# ==========================================
cat("\n📈 Creating a Basic Time Series Plot:\n")

basic_plot <- ggplot(data = util, aes(x = PosixTime, y = Utilization)) +
  geom_line(color = "blue", size = 1.2) +
  labs(title = "Time Series of Machine Utilization",
       x = "Time",
       y = "Utilization") +
  theme_minimal()

# Display the basic plot
print(basic_plot)

# ==========================================
# 📊 Step 5: Advanced Plot with Grouping
# ==========================================
cat("\n📊 Creating an Advanced Time Series Plot with Grouping:\n")

advanced_plot <- ggplot(data = util, aes(x = PosixTime, y = Utilization, color = Machine)) +
  geom_line(size = 1.2) +
  facet_grid(Machine ~ .) + 
  labs(title = "Time Series of Machine Utilization by Machine",
       x = "Time",
       y = "Utilization") +
  theme_minimal()

# Display the advanced plot
print(advanced_plot)

# ==========================================
# 🚩 Step 6: Adding Threshold Lines
# ==========================================
cat("\n🚩 Adding Threshold Lines:\n")

threshold_plot <- ggplot(data = util, aes(x = PosixTime, y = Utilization, color = Machine)) +
  geom_line(size = 1.2) +
  facet_grid(Machine ~ .) +
  geom_hline(yintercept = 0.90, color = "red", linetype = "dashed", size = 1) +
  labs(title = "Machine Utilization with Threshold",
       x = "Time",
       y = "Utilization") +
  theme_minimal()

# Display the plot with thresholds
print(threshold_plot)

# ==========================================
# 🗂️ Step 7: Save the Plot to a List
# ==========================================
cat("\n🗂️ Saving the Plot to a List:\n")

# Create a list to store results
list_rl1 <- list(
  Machine = "RL1",
  Stats = c(0.849, 0.952, 0.995), # Example utilization stats
  LowThreshold = TRUE,
  UnknownHours = NA,
  Data = util
)

# Save the plot to the list
list_rl1$Plot <- threshold_plot

# Inspect the list
cat("Structure of the list:\n")
str(list_rl1)

# Display the saved plot
cat("\nDisplaying the saved plot from the list:\n")
print(list_rl1$Plot)

# ==========================================
# 🔑 Key Notes
# ==========================================
cat("\n🔑 Key Notes:\n")

# 1. **ggplot2 Package**: Allows flexible and powerful data visualization.
# 2. **Faceting**: Splits data into smaller groups and visualizes each group in a subplot.
# 3. **Thresholds**: Use `geom_hline()` to add reference lines at specific y-values.
# 4. **Lists in R**: Lists can store different types of objects (e.g., plots, data frames).
# 5. **Time Formatting**: Ensure time data is in `POSIXct` format for proper visualization.
# 6. **Reproducibility**: Use `set.seed()` for consistent random data generation.

# ==========================================
# 📝 Summary
# ==========================================
cat("\n📝 Summary:\n")

# - **Time Series Plots** are vital for understanding how data changes over time.
# - **Basic Plots** focus on overall trends, while **advanced plots** highlight grouped data or specific thresholds.
# - **ggplot2** is a versatile package, offering tools like `geom_line` for line plots and `facet_grid` for grouped visualization.
# - **Threshold Lines** are a useful way to mark critical levels in data (e.g., maximum allowed utilization).
# - **Lists in R**: Storing plots and results in a list ensures that analyses remain organized and reusable.