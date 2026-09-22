# PhonePe-Data-Analysis
An end-to-end analysis of 21 billion PhonePe transactions (2018-2021) featuring Python data imputation, advanced SQL analytics, and an interactive Power BI executive dashboard

# 📱 PhonePe Transaction & User Data Analysis

## 📌 Project Overview
This project analyzes the transaction and user registration data of PhonePe across various Indian states and districts from 2018 to 2021. By combining Python for data preprocessing and SQL for deep-dive analytics, this study extracts actionable business insights regarding market penetration, transaction trends, and device usage. The project culminates in an interactive Power BI dashboard designed for executive-level decision-making.

## 🎯 Core Objectives
* **Data Cleaning & Imputation:** Handle missing district demographic data (Population, Area, Density) using Python Pandas.
* **Trend Analysis:** Track year-over-year transaction volumes and total amounts transferred across different states.
* **User Demographics:** Identify the top smartphone brands driving user registrations.
* **Financial Metrics:** Calculate and visualize the Average Transaction Value (ATV) to identify high-value regions.

## 🛠️ Tech Stack
* **Python:** Pandas, NumPy, Matplotlib Data Imputation, Cleaning, Exploratory Data Analysis ([Phone Pe Problems.ipynb](Notebooks/Phone%20Pe%20Problems.ipynb))
* **SQL:** MySQL: Aggregations, Window Functions, CTEs, View Creation ([SQL problems.sql](SQL%20Scripts/SQL%20problems.sql))
* **Data Visualization:** Microsoft Power BI ([Phone Pe Dashboard.pbix](Dashboard/Phone%20Pe%20Dashboard.pbix))
* **Raw Data:** ([phonepe_raw_data.xlsx](Data/phonepe_raw_data.xlsx))

## 📊 Interactive Dashboard

![Executive Performance Overview](Images/Phone%20Pe%20Executive%20Performance%20Overview.png)

![District Demographic Deep Dive](Images/Phone%20Pe%20District%20Demographic%20Deep%20Dive.png)

![Transaction Category Dynamics](Images/Phone%20Pe%20Transaction%20Category%20Dynamics.png)

![Device Adoption and Tech Ecosystem](Images/Phone%20Pe%20Device%20Adoption%20and%20Tech%20Ecosystem.png)

*An executive-level Power BI dashboard showcasing cumulative platform performance, transaction category dynamics, demographic breakdowns, and device adoption trends from 2018 to 2021.*

## 💡 Key Business Insights
1. **High-Level Performance:** Between 2018 and 2021, the platform successfully processed 21 billion total transactions amounting to 36.38T INR, maintaining a healthy Average Transaction Value (ATV) of 2.00K INR.
2. **Transaction Leaders:** Telangana, Maharashtra, Karnataka, Andhra Pradesh, and Uttar Pradesh drive the highest transaction amounts across the country.
3. **Category Dominance:** Peer-to-peer payments represent the vast majority of the transfer volume, accounting for 84.24% of the total amount transferred, followed distantly by Merchant payments at 10.65%. 
4. **Device Market Share:** Xiaomi is the dominant smartphone brand among registered users with 616M users, followed by Samsung (481M) and Vivo (411M).
5. **App Engagement & Growth:** Total transactions and app opens experienced exponential growth from 2018 to 2021, which correlates directly with the sharp, sustained rise in peer-to-peer and merchant transfer amounts over the same period.

## 📂 Repository Contents
* [**`Data/phonepe_raw_data.xlsx`**](Data/phonepe_raw_data.xlsx): The foundational dataset containing state and district-level transaction, user, and demographic data.
* [**`Notebooks/Phone Pe Problems.ipynb`**](Notebooks/Phone%20Pe%20Problems.ipynb): Python code detailing the data wrangling process, including the imputation of missing geographical demographics.
* [**`SQL Scripts/SQL problems.sql`**](SQL%20Scripts/SQL%20problems.sql): Advanced SQL queries utilizing CTEs and window functions to solve specific business problems.
* [**`SQL Scripts/SQL exports.sql`**](SQL%20Scripts/SQL%20exports.sql): Structured SQL views created to feed clean, aggregated data directly into the Power BI dashboard.
* [**`Dashboard/Phone Pe Dashboard.pbix`**](Dashboard/Phone%20Pe%20Dashboard.pbix): The final interactive Power BI dashboard file.

## 🚀 How to Run this Project
1. Clone the repository: `git clone https://github.com/yourusername/PhonePe-Data-Analysis.git`
2. Open the Python notebook to view the data cleaning process.
3. Run the `SQL exports.sql` script in your SQL environment to generate the necessary views.
4. Execute `SQL problems.sql` to view the raw business answers.
5. Open the `Phone Pe Dashboard.pbix` file in Microsoft Power BI Desktop to interact with the visualizations.
