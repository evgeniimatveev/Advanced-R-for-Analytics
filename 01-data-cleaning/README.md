# 🧹 Section 1: Data Cleaning

Importing and preparing a messy real-world dataset (Future-500): text columns that must become numbers, the factor variable trap, locating, filtering and removing missing values, three ways to impute them, and charts of the cleaned result.

> Open `Advanced-R-for-Analytics.Rproj` in RStudio first: it makes paths such as `data/future-500.csv` resolve. ↩️ = builds on an earlier script · 💾 = writes a file into the working directory (git-ignored)

| # | Script | Topic | Notes |
|:-:|--------|-------|-------|
| 1 | [`01-data-preparation-and-cleaning.R`](01-data-preparation-and-cleaning.R) | Data preparation and cleaning: the whole workflow on Future-500 |  |
| 2 | [`02-the-factor-variable-trap.R`](02-the-factor-variable-trap.R) | The factor variable trap: why converting a factor to numbers goes wrong |  |
| 3 | [`03-fvt-in-practice.R`](03-fvt-in-practice.R) | The factor variable trap in practice |  |
| 4 | [`04-using-gsub-and-sub.R`](04-using-gsub-and-sub.R) | Cleaning text columns with `gsub()` and `sub()` ($, commas, "Dollars", %) |  |
| 5 | [`05-what-is-an-na.R`](05-what-is-an-na.R) | What is an `NA`? |  |
| 6 | [`06-locate-missing-data.R`](06-locate-missing-data.R) | An elegant way to locate missing data | 💾 writes `Future-500-Cleaned.csv` |
| 7 | [`07-data-filters-which.R`](07-data-filters-which.R) | Data filters: `which()` for non-missing data |  |
| 8 | [`08-data-filters-is-na.R`](08-data-filters-is-na.R) | Data filters: `is.na()` for missing data |  |
| 9 | [`09-removing-records-with-missing-data.R`](09-removing-records-with-missing-data.R) | Removing records with missing data |  |
| 10 | [`10-index-reset-and-na-handling.R`](10-index-reset-and-na-handling.R) | Resetting the row index and handling `NA` |  |
| 11 | [`11-replacing-with-derived-values.R`](11-replacing-with-derived-values.R) | Replacing missing data with derived values (profit = revenue − expenses) |  |
| 12 | [`12-median-imputation.R`](12-median-imputation.R) | Replacing missing data with the median |  |
| 13 | [`13-median-imputation-part-2.R`](13-median-imputation-part-2.R) | Median imputation, part 2 |  |
| 14 | [`14-median-imputation-part-3.R`](14-median-imputation-part-3.R) | Median imputation, part 3 |  |
| 15 | [`15-dealing-with-missing-data.R`](15-dealing-with-missing-data.R) | Dealing with missing data: overview plus KNN and multiple imputation | ⚠️ needs `DMwR` (removed from CRAN) and `mice` |
| 16 | [`16-visualizing-results.R`](16-visualizing-results.R) | Visualizing the results after handling missing data (ggplot2) | ↩️ run `01-data-preparation-and-cleaning.R` first |

---

[← Quickstart](../00-quickstart/) &nbsp;·&nbsp; [Lists and Subsetting →](../02-lists-and-subsetting/)

*Built by [Evgenii Matveev](https://github.com/evgeniimatveev) · Data Analyst / Analytics & MLOps Engineer*
