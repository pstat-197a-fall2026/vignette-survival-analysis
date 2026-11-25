# Setup
library(dplyr)
library(readr)

# ----- 1. Loading Raw Data -----
raw_path <- "data/raw/WA_Fn-UseC_-Telco-Customer-Churn.csv"
telco_raw <- read_csv(raw_path, show_col_types = FALSE) # read csv into a tibble

glimpse(telco_raw)


# ----- 2. Inspect Missing Values -----

colSums(is.na(telco_raw)) # checking for missing values

telco_raw |>
  filter(is.na(TotalCharges)) |>
  select(customerID, tenure, Churn, TotalCharges)

## Implies that all customers with tenure == 0 signed up but have not paid the bill for the month yet, so nothing has been charged.

# ----- 3. Clean and Recoding -----
telco <- telco_raw |>
  filter(tenure > 0) # removing the 11 observations that have missing TotalCharges values

# finish later