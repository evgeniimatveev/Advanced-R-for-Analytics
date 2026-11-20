# ===============================================
# 🎓 Lecture-Script: Visualizing Results After Handling Missing Data
# ===============================================

# --- 🛠 Step 1: Setting Up the Environment
# Import necessary libraries and ensure data is ready for visualization
library(ggplot2)  # 📊 Use ggplot2 for professional-quality visualizations

# --- 🔑 Key Notes:
# 1. **Why Visualize?**  
#    - Visualization helps identify patterns, trends, and anomalies in the dataset.  
#    - It confirms if data cleaning and imputations were applied correctly.  
# 2. **Data Visualization Tools in R**:  
#    - Base R plotting functions: Easy and quick for basic graphs.  
#    - **`ggplot2`**: Ideal for advanced and customizable visualizations.  

# ===============================================
# 🛠 Step 2: Data Preparation for Visualization

# Preview the cleaned dataset
cat("\n🔹 Previewing the dataset after NA removal or imputation:\n")
head(fin, 10)  # 👀 First 10 rows of the dataset
summary(fin)   # 📊 Check summary statistics

# --- 🔑 Ensure the following:
# - No missing values remain in critical columns like Revenue, Expenses, or Profit.
# - Data consistency in categorical variables (e.g., Industry).

# ===============================================
# 🛠 Step 3: Scatterplot Visualization

cat("\n📊 Creating a Scatterplot: Revenue vs. Expenses (colored by Industry)\n")

# Step 1: Define the scatterplot
p <- ggplot(data = fin, aes(x = Revenue, y = Expenses, color = Industry)) +
  geom_point(size = 2, alpha = 0.6) +  # Plot points with transparency
  labs(title = "Scatterplot of Revenue vs. Expenses by Industry",
       x = "Revenue ($)", y = "Expenses ($)",
       color = "Industry") +
  theme_minimal()  # Use a clean theme

# Step 2: Render the scatterplot
print(p)  # 🎨 Display the scatterplot

# --- 🔑 Key Notes:
# - **`aes()`** maps data columns to visual properties (e.g., x-axis, y-axis, color).  
# - Adding **`geom_point()`** creates the scatterplot.  
# - Use **`alpha`** to adjust transparency for overlapping points.  

# ===============================================
# 🛠 Step 4: Trendlines with Scatterplot

cat("\n📈 Adding Trendlines to the Scatterplot\n")

# Step 1: Add trendlines (smoothed)
p_with_trend <- p + 
  geom_smooth(method = "loess", fill = NA, size = 1, se = FALSE)  # Add smooth trendlines

# Step 2: Render the updated scatterplot
print(p_with_trend)  # 🎨 Scatterplot with trendlines

# --- 🔑 Key Notes:
# - **`geom_smooth()`** adds a trendline to identify patterns.  
# - **`method = "loess"`** fits a local regression curve.  
# - Use **`se = FALSE`** to hide confidence intervals.

# ===============================================
# 🛠 Step 5: Boxplot Visualization

cat("\n📊 Creating a Boxplot: Industry vs. Growth\n")

# Step 1: Define the boxplot
boxplot_growth <- ggplot(data = fin, aes(x = Industry, y = Growth, fill = Industry)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 16) +  # Boxplot with highlighted outliers
  labs(title = "Boxplot of Growth by Industry",
       x = "Industry", y = "Growth (%)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for readability

# Step 2: Render the boxplot
print(boxplot_growth)  # 🎨 Boxplot visualization

# --- 🔑 Key Notes:
# - Boxplots visualize the **distribution and spread** of numerical data across categories.  
# - Highlight outliers using **`outlier.color`** and **`outlier.shape`**.

# ===============================================
# 🛠 Step 6: Advanced Visualization (Jittered Boxplot)

cat("\n🎨 Adding Jittered Points to the Boxplot\n")

# Step 1: Overlay jittered points
jittered_boxplot <- boxplot_growth +
  geom_jitter(width = 0.2, alpha = 0.5, color = "black")  # Add jittered points for visibility

# Step 2: Render the jittered boxplot
print(jittered_boxplot)  # 🎨 Boxplot with jittered points

# --- 🔑 Key Notes:
# - **`geom_jitter()`** adds slight random noise to point positions, reducing overlap.  
# - Helps visualize dense regions within boxplots.

# ===============================================
# 🔑 Key Takeaways:
# 1. **Scatterplots**:
#    - Best for exploring relationships between two numerical variables (e.g., Revenue vs. Expenses).  
#    - Use **color** or **size** to add additional dimensions (e.g., Industry, Profit).  
#
# 2. **Boxplots**:
#    - Useful for comparing distributions across categories (e.g., Growth by Industry).  
#    - Highlight key statistics: Median, quartiles, and outliers.  
#
# 3. **Advanced Enhancements**:
#    - Add trendlines (e.g., LOESS) to scatterplots for pattern identification.  
#    - Use jittered points to improve readability in dense boxplots.  
#
# 4. **Best Practices**:
#    - Always ensure cleaned and imputed data before visualization.  
#    - Choose appropriate visualizations based on the data and analysis goals.

# --- 🚀 End of Script ---
# ===============================================