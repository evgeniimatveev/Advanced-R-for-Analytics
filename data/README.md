# 📂 Datasets

| File | Size | Used by |
|---|---|---|
| [`future-500.csv`](future-500.csv) | 500 companies × 11 columns | Section 1 |
| [`machine-utilization.csv`](machine-utilization.csv) | 3,600 hourly readings, machines RL1, RL2, SR1, SR4A, SR6 | Section 2 |
| [`weather/`](weather/) | 4 cities (Chicago, Houston, New York, San Francisco) × Fahrenheit and Celsius (`-f.csv`, `-c.csv`) | Section 3 |

## `future-500.csv`

`ID`, `Name`, `Industry`, `Inception`, `Employees`, `State`, `City`, `Revenue`, `Expenses`, `Profit`, `Growth`

8 of the 11 columns contain missing values, which is what Section 1 is about:

| Column | Missing | Share |
|---|--:|--:|
| `Industry` | 2 | 0.4% |
| `Inception` | 1 | 0.2% |
| `Employees` | 2 | 0.4% |
| `State` | 4 | 0.8% |
| `Revenue` | 2 | 0.4% |
| `Expenses` | 3 | 0.6% |
| `Profit` | 2 | 0.4% |
| `Growth` | 1 | 0.2% |

Revenue, Expenses and Growth are stored as text (`$9,684,527`, `1,130,700 Dollars`, `19%`) so they have to be cleaned before any arithmetic. Lecture `04-using-gsub-and-sub` shows how.

## `machine-utilization.csv`

`Timestamp`, `Machine`, `Percent Idle`: one reading per hour for each machine; utilization is `1 − Percent Idle`.

---

*Built by [Evgenii Matveev](https://github.com/evgeniimatveev) · Data Analyst / Analytics & MLOps Engineer*
