# COVID-19 Global Data Analytics Portfolio 🌍📊

## Project Overview
This project provides a rigorous analysis of the COVID-19 pandemic, focusing on mortality rates, infection density, and the relationship between population size and virus spread. By leveraging **SQL** for data transformation and **Tableau** for visual storytelling, this repository demonstrates a full-cycle data analytics workflow—from raw data processing to actionable insights.

## Key Features
- **SQL Data Pipeline:** Advanced queries using Joins, CTEs, Temp Tables, and Window Functions to clean and aggregate global health data.
- **Interactive Dashboard:** A Tableau dashboard (`.twbx`) visualizing geographic hotspots, daily trends, and vaccination coverage.
- **Statistical Reporting:** Comprehensive PDF report summarizing findings on global fatality rates (approx. 2.11%) and regional impact.

## Repository Contents
- 📂 **Data/**: Raw and processed datasets (`CovidDeaths.csv`, `CovidVaccinations.csv`, and specific tables TBL_1 to TBL_4).
- 📂 **SQL Scripts/**: `CovidDeathandCovidVaccination.sql` containing the logic for data extraction and transformation.
- 📂 **Tableau/**: `Covid Dashboard.twbx` for interactive data exploration.
- 📄 **Report/**: `Covid 19 - REPORT.pdf` for the final summary of insights.

## Technical Highlights (SQL)
The analysis utilizes complex SQL techniques to handle large-scale health data:
- **Joins:** Combining death and vaccination records on location and date.
- **Window Functions:** Calculating rolling totals of people vaccinated using `SUM(...) OVER (PARTITION BY ...)`.
- **CTEs & Temp Tables:** Improving query readability and performance for percentage calculations.

## Insights Derived
1. **Global Impact:** Identified a global fatality rate of 2.11% based on 150M+ confirmed cases.
2. **Regional Disparities:** Europe and North America recorded the highest absolute death counts, while smaller nations (e.g., Andorra) showed higher infection density relative to population.
3. **Vaccination Progress:** Mapped the correlation between vaccination rollouts and shifts in daily case trends.

## How to Use
1. **SQL:** Import the `.csv` files into your SQL Server/Environment and run the `.sql` scripts to see the transformation logic.
2. **Tableau:** Open the `.twbx` file using Tableau Desktop or Tableau Public to interact with the visualizations.

## Authors
- **Sandy**
