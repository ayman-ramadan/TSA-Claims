# ✈️ TSA Claims Data Analysis using SAS

This project analyzes claims submitted to the **Transportation Security Administration (TSA)** by passengers at U.S. airports. Using **SAS**, I performed data cleaning, preparation, and exploratory analysis to identify trends in claim types, statuses, processing time, and airport performance.

---

## 🧠 Objective

To perform comprehensive **data cleaning, preparation, and analysis** on TSA claims data to uncover insights and answer key business questions, including:
- What types of claims are most common?
- Which airports have the highest volume of claims?
- How long does it take to process claims?
- What is the most frequent claim status?

---

## 📁 Data Source

- **TSA Claims Dataset (Publicly Available)**
  - Fields include: `Claim Number`, `Claim Type`, `Incident Date`, `Date Received`, `Airport Code`, `Claim Site`, `Disposition`, `Close Amount`, and others.

---

## 🛠️ Tools & Technologies

- **SAS Studio** / **SAS Enterprise Guide**
- **PROC SQL**, **PROC MEANS**, **PROC FREQ**, **PROC SGPLOT**
- **DATA Step Programming**
- Formats, Labels, Titles for enhanced reporting and visualization

---

## 🔄 Workflow Overview

### 1️⃣ Data Cleaning & Preparation
- Removed null or invalid `Claim Type`, `Disposition`, and `Close Amount` values.
- Converted character-type dates into `SAS Date` format for analysis.
- Created new calculated columns:
  - `Days_to_Process = Date_Closed - Date_Received`
  - `Year`, `Month` extracted from `Incident Date`
- Filtered duplicates and invalid airport codes.

### 2️⃣ Exploratory Data Analysis
- Frequency distribution of **Claim Types**, **Disposition**, and **Claim Sites**.
- Identified top 10 airports with the highest number of claims.
- Calculated mean/median **Close Amounts** and **Days to Process**.
- Analyzed claim trends over time (monthly/yearly).

### 3️⃣ Visualizations & Reporting
- **Bar Charts**: Most common claim types and statuses.
- **Pie Charts**: Proportion of claim outcomes.
- **Line Graphs**: Year-over-year trends in claim volume.
- **Histograms**: Distribution of processing times and claim values.
- Exported summary tables to Excel and visual reports to PDF.

## Dashboard
![image](https://github.com/user-attachments/assets/1ba6e934-b025-4732-94fc-d96285c2bafe)

---

## 📊 Key Insights

- Over **60% of claims were denied or settled** with minimal payout.
- Most claims originated from **10 high-traffic airports**.
- Property loss and damage made up the majority of submissions.
- Average claim processing time was **45+ days**, with high variance by disposition.


