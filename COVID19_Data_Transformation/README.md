# COVID-19 Data Exploration Using SQL Server

## Project Overview

This project explores historical COVID-19 data using Microsoft SQL Server to analyse infection trends, reported deaths, population impact, and vaccination progress across countries and continents.

The analysis demonstrates SQL techniques for data exploration, aggregation, joining datasets, calculating cumulative metrics, and creating reusable views for reporting.

The project builds upon Alex The Analyst's SQL portfolio tutorial, with improvements to query structure, calculation accuracy, code readability, and documentation.

## Tools and Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL
- Historical COVID-19 dataset from Our World in Data, obtained through Alex The Analyst's tutorial resources

## Dataset

Two datasets were imported into the `CovidPortfolio` database:

| Table | Records | Description |
|---|---:|---|
| `CovidDeath` | 85,171 | Historical COVID-19 cases, deaths, population and geographic information |
| `CovidVaccinations` | 85,171 | Historical vaccination records and related indicators |

The datasets are joined using `location` and `date`.

## SQL Skills Demonstrated

- Data exploration with `SELECT`, `WHERE` and `ORDER BY`
- Aggregation with `SUM()`, `MAX()` and `GROUP BY`
- SQL joins using `INNER JOIN`
- Window functions using `SUM() OVER()` and `ROW_NUMBER()`
- Common Table Expressions (CTEs)
- Temporary tables
- SQL views
- Percentage calculations and NULL handling

## Key Findings

### 1. Global COVID-19 Statistics

The historical dataset recorded:

| Metric | Result |
|---|---:|
| Reported cases | 150,574,977 |
| Reported deaths | 3,180,206 |
| Reported deaths relative to cases | 2.11% |

These statistics are calculated by aggregating daily reported cases and deaths across country-level records.

### 2. Countries with the Highest Reported Cases Relative to Population

| Country | Percentage |
|---|---:|
| Andorra | 17.13% |
| Montenegro | 15.51% |
| Czechia | 15.23% |

These figures represent cumulative reported cases relative to population, not necessarily the percentage of unique people infected.

### 3. COVID-19 Deaths by Continent

Europe recorded the highest cumulative reported death total in the dataset, followed by North America and South America.

Continental totals were calculated by selecting the latest available non-null cumulative death count for each country and aggregating the results by continent.

### 4. South Africa's Vaccination Progress

The dataset shows recorded COVID-19 vaccination activity beginning in February 2021.

By 28 February 2021, the calculated cumulative vaccination figure was approximately **0.12 doses per 100 people**.

This measures administered doses relative to population, not the percentage of unique individuals vaccinated.

## SQL Analysis Structure

The project is organised into nine sections:

1. Initial Data Exploration
2. South Africa COVID-19 Analysis
3. Country-Level Infection Analysis
4. COVID-19 Death Analysis
5. Global COVID-19 Statistics
6. Vaccination Analysis Using Joins and Window Functions
7. Vaccination Analysis Using a CTE
8. Vaccination Analysis Using Temporary Tables
9. SQL Views for Reporting and Visualisation

## Database Views

Three reusable views were created:

| View | Purpose |
|---|---|
| `globalNumbers` | Summarises reported cases, deaths and the overall death percentage |
| `populationVaccinated` | Calculates cumulative vaccination doses |
| `PercentPopulationVaccinated` | Calculates cumulative vaccination doses per 100 people |

## Running the Project

1. Install Microsoft SQL Server and SQL Server Management Studio.
2. Create a database named `CovidPortfolio`.
3. Import the historical datasets into `dbo.CovidDeath` and `dbo.CovidVaccinations`.
4. Ensure the date and numeric columns use appropriate SQL Server data types.
5. Open `COVID19_Data_Exploration_Portfolio.sql` in SSMS.
6. Execute the script to reproduce the exploratory analysis and create the reporting views.

**Note:** The SQL analysis script assumes the source tables have already been imported. Data import and preparation are separate prerequisites.

## Data Limitations

- The dataset is historical and does not represent current COVID-19 statistics.
- Reported cases may exclude undetected infections.
- Cumulative reported cases may include reinfections.
- Vaccination dose counts do not represent unique people vaccinated.
- Reporting corrections and missing values may affect calculated statistics.
- Aggregating daily changes and selecting cumulative totals can produce slightly different results.

## Project Attribution

The original project concept and tutorial foundation are credited to **Alex The Analyst**.

This portfolio implementation includes revised SQL queries, improved calculation handling, clearer documentation, and validated analytical findings.
