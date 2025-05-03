# TSA Claims Data Analysis (2002–2017)

## Overview

This project focuses on the **data preparation and analysis of TSA (Transportation Security Administration) claims** filed between 2002 and 2017. The dataset includes claims related to lost or damaged property and personal injury during airport security screenings. The goal was to clean and standardize the dataset, resolve inconsistencies, and generate a dynamic, state-specific statistical report to support data-driven decision-making and operational transparency.

---

## Objectives

- **Data Cleaning and Transformation**
  - Remove duplicates and irrelevant fields
  - Address missing values systematically
  - Correct inconsistent formatting in key columns (e.g., `Claim_Type`, `StateName`)

- **Data Standardization**
  - Standardize date formats (e.g., `01JAN2000`)
  - Format currency values (e.g., `$100.00`)
  - Normalize column names and categorical values for consistency

- **Data Quality Assurance**
  - Resolve date-related issues
  - Validate categorical fields
  - Drop redundant or uninformative columns (`County`, `City`)

- **Dynamic Reporting**
  - Generate a PDF summary report
  - Focus the analysis on a user-defined U.S. state
  - Visualize yearly trends, claim types, and financial impact

---

## Tools & Technologies

- **SAS (Statistical Analysis System)**
  - `PROC IMPORT`, `PROC SORT`, `PROC FREQ`, `DATA` step for data preparation
  - `ODS PDF` for exporting formatted, dynamic reports

---

## Data Preparation Process

1. **Data Import**
   - Read raw data from `TSAClaims2002_2017.csv`

2. **Initial Cleaning**
   - Remove exact duplicates
   - Handle missing entries in essential fields
   - Standardize values in categorical columns

3. **Data Formatting**
   - Reformat date fields using `INPUT` and `PUT` functions
   - Standardize case formatting and remove leading/trailing spaces
   - Label columns for enhanced readability

4. **Data Validation**
   - Validate date ranges and detect anomalies
   - Apply frequency analysis on key dimensions (e.g., `Claim_Type`, `Item_Category`)

---

## Analysis & Reporting

- **Statistical Summary**
  - Claim distribution over time
  - Claims per year and per state
  - Frequency of claim types and item categories

- **Dashboard Highlights**
  - Time series trends
  - Outliers and anomalies in claim dates
  - State-wise breakdown of claims and reimbursement totals

- **Final Report**
  - Generated as a PDF via `ODS PDF`
  - Includes visual summaries and frequency tables
  - Tailored by default to a specific user-defined state

---

## Deliverables

- Cleaned and standardized dataset (ready for downstream analysis)
- Statistical report (PDF) summarizing findings
- Reproducible SAS script for data preparation and reporting

---

## Impact

- Ensured high-quality, analysis-ready data
- Revealed patterns to improve TSA claims processing and oversight
- Delivered automated reporting infrastructure adaptable to any U.S. state



