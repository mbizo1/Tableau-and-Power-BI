
/*
============================================================
PROJECT: COVID-19 Data Exploration Using SQL Server
============================================================

OBJECTIVE:
Explore historical COVID-19 data to analyse reported
infections, deaths, population impact, and vaccination
progress across countries and continents.

DATA SOURCE:
Our World in Data COVID-19 dataset
(Obtained through Alex The Analyst's SQL tutorial)

DATABASE:
CovidPortfolio

TABLES:
dbo.CovidDeath
dbo.CovidVaccinations

SQL SKILLS DEMONSTRATED:
- Data filtering and aggregation
- Joins
- Common Table Expressions (CTEs)
- Window functions
- Temporary tables
- Views
- Calculated metrics and NULL handling

PROJECT BACKGROUND:
This project builds on Alex The Analyst's COVID-19 SQL
portfolio tutorial. Queries have been reviewed, corrected,
and extended to improve calculation accuracy, readability,
and reporting.

NOTES:
- Results reflect a historical dataset, not current totals.
- Reported cases do not necessarily represent unique people.
- Vaccination doses do not represent unique individuals.
============================================================
*/

USE CovidPortfolio;
GO


-- ============================================================
-- SECTION 1: INITIAL DATA EXPLORATION
-- ============================================================
-- Objective:
-- Examine the COVID-19 dataset and identify the key fields
-- used throughout the analysis.


-- 1.1 Explore COVID-19 records
-- Exclude aggregate geographic records that do not belong
-- to an individual continent.

SELECT
    location,
    continent,
    [date],
    population,
    total_cases,
    new_cases,
    total_deaths,
    new_deaths
FROM dbo.CovidDeath
WHERE continent IS NOT NULL
ORDER BY location, [date];


-- 1.2 Examine key COVID-19 indicators
-- Focus on reported cases, deaths, and population.

SELECT
    location,
    [date],
    population,
    total_cases,
    new_cases,
    total_deaths
FROM dbo.CovidDeath
WHERE continent IS NOT NULL
ORDER BY location, [date];


-- ============================================================
-- SECTION 2: SOUTH AFRICA COVID-19 ANALYSIS
-- ============================================================
-- Objective:
-- Analyse reported COVID-19 deaths and cases in relation
-- to South Africa's population.


-- 2.1 Reported case fatality percentage
-- Measures cumulative reported deaths as a percentage
-- of cumulative reported cases.

SELECT
    location,
    [date],
    total_cases,
    total_deaths,

    ROUND(
        (total_deaths / NULLIF(total_cases, 0)) * 100,
        2
    ) AS DeathPercentage

FROM dbo.CovidDeath
WHERE location = 'South Africa'
ORDER BY [date];


-- 2.2 Reported cases as a percentage of population
-- Measures cumulative reported cases relative to the
-- country's population, not unique individuals infected.

SELECT
    location,
    [date],
    population,
    total_cases,

    ROUND(
        (total_cases / NULLIF(population, 0)) * 100,
        2
    ) AS PercentPopulationInfected

FROM dbo.CovidDeath
WHERE location = 'South Africa'
ORDER BY [date];



-- ============================================================
-- SECTION 3: COUNTRY-LEVEL INFECTION ANALYSIS
-- ============================================================
-- Objective:
-- Identify countries with the highest cumulative reported
-- COVID-19 cases relative to their populations.


-- 3.1 Countries with the highest reported infection rates

SELECT
    location,
    MAX(population) AS Population,
    MAX(total_cases) AS HighestInfectionCount,

    ROUND(
        MAX(total_cases / NULLIF(population, 0)) * 100,
        2
    ) AS PercentPopulationInfected

FROM dbo.CovidDeath

-- Exclude continent and world aggregate records
WHERE continent IS NOT NULL

GROUP BY location

ORDER BY PercentPopulationInfected DESC;



-- ============================================================
-- SECTION 4: COVID-19 DEATH ANALYSIS
-- ============================================================
-- Objective:
-- Compare cumulative reported COVID-19 deaths across
-- continents and identify countries with the highest
-- recorded death totals.


-- 4.1 Total reported COVID-19 deaths by continent
-- Select the latest available non-null cumulative death
-- count for each country before aggregating by continent.

WITH LatestCountryDeaths AS
(
    SELECT
        continent,
        location,
        total_deaths,

        ROW_NUMBER() OVER (
            PARTITION BY location
            ORDER BY
                CASE
                    WHEN total_deaths IS NULL THEN 1
                    ELSE 0
                END,
                [date] DESC
        ) AS RowNum

    FROM dbo.CovidDeath
    WHERE continent IS NOT NULL
)

SELECT
    continent,
    SUM(total_deaths) AS TotalDeathCount

FROM LatestCountryDeaths
WHERE RowNum = 1
GROUP BY continent
ORDER BY TotalDeathCount DESC;


-----------------------------------------------------------------------------

--joining CovidDeath table with CovidVaccination by date and location
select* 
from CovidDeath dea
join CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date


-- ============================================================
-- SECTION 5: GLOBAL COVID-19 STATISTICS
-- ============================================================
-- Objective:
-- Calculate total reported COVID-19 cases, deaths,
-- and the overall reported case fatality percentage
-- across countries in the historical dataset.


-- 5.1 Global reported cases and deaths

SELECT
    SUM(new_cases) AS TotalCases,
    SUM(new_deaths) AS TotalDeaths,

    ROUND(
        (SUM(new_deaths) /
        NULLIF(SUM(new_cases), 0)) * 100,
        2
    ) AS DeathPercentage

FROM dbo.CovidDeath

-- Exclude aggregate geographic records to avoid
-- double-counting countries and continents.
WHERE continent IS NOT NULL;



-- ============================================================
-- SECTION 6: COVID-19 VACCINATION ANALYSIS
-- ============================================================
-- Objective:
-- Combine COVID-19 case and vaccination datasets to
-- analyse cumulative vaccination doses by country.


-- 6.1 Calculate cumulative vaccination doses

SELECT
    dea.continent,
    dea.location,
    dea.[date],
    dea.population,
    vac.new_vaccinations,

    SUM(COALESCE(vac.new_vaccinations, 0))
        OVER (
            PARTITION BY dea.location
            ORDER BY dea.[date]
            ROWS BETWEEN UNBOUNDED PRECEDING
                     AND CURRENT ROW
        ) AS RollingVaccinations

FROM dbo.CovidDeath AS dea

INNER JOIN dbo.CovidVaccinations AS vac
    ON dea.location = vac.location
    AND dea.[date] = vac.[date]

WHERE dea.continent IS NOT NULL

ORDER BY dea.location, dea.[date];



-- ============================================================
-- SECTION 7: VACCINATION ANALYSIS USING A CTE
-- ============================================================
-- Objective:
-- Calculate cumulative COVID-19 vaccination doses
-- per 100 people using a Common Table Expression (CTE).


-- 7.1 Calculate vaccination doses relative to population

;WITH PopvsVac AS
(
    SELECT
        dea.continent,
        dea.location,
        dea.[date],
        dea.population,
        vac.new_vaccinations,

        SUM(COALESCE(vac.new_vaccinations, 0))
            OVER (
                PARTITION BY dea.location
                ORDER BY dea.[date]
                ROWS BETWEEN UNBOUNDED PRECEDING
                         AND CURRENT ROW
            ) AS RollingVaccinations

    FROM dbo.CovidDeath AS dea

    INNER JOIN dbo.CovidVaccinations AS vac
        ON dea.location = vac.location
        AND dea.[date] = vac.[date]

    WHERE dea.continent IS NOT NULL
)

SELECT
    continent,
    location,
    [date],
    population,
    new_vaccinations,
    RollingVaccinations,

    ROUND(
        (RollingVaccinations / NULLIF(population, 0)) * 100,
        2
    ) AS VaccinationDosesPer100People

FROM PopvsVac

WHERE location = 'South Africa'
ORDER BY [date];



-- ============================================================
-- SECTION 8: VACCINATION ANALYSIS USING TEMPORARY TABLES
-- ============================================================
-- Objective:
-- Store intermediate vaccination calculations in a
-- temporary table for further analysis and reuse.


-- 8.1 Remove the temporary table if it already exists

DROP TABLE IF EXISTS #PercentPopulationVaccinated;


-- 8.2 Create the temporary table

CREATE TABLE #PercentPopulationVaccinated
(
    Continent NVARCHAR(255),
    Location NVARCHAR(255),
    [Date] DATE,
    Population FLOAT,
    NewVaccinations FLOAT,
    RollingVaccinations FLOAT
);


-- 8.3 Populate the temporary table

INSERT INTO #PercentPopulationVaccinated
(
    Continent,
    Location,
    [Date],
    Population,
    NewVaccinations,
    RollingVaccinations
)
SELECT
    dea.continent,
    dea.location,
    dea.[date],
    dea.population,
    vac.new_vaccinations,

    SUM(COALESCE(vac.new_vaccinations, 0))
        OVER (
            PARTITION BY dea.location
            ORDER BY dea.[date]
            ROWS BETWEEN UNBOUNDED PRECEDING
                     AND CURRENT ROW
        ) AS RollingVaccinations

FROM dbo.CovidDeath AS dea

INNER JOIN dbo.CovidVaccinations AS vac
    ON dea.location = vac.location
    AND dea.[date] = vac.[date]

WHERE dea.continent IS NOT NULL;


-- 8.4 Analyse South Africa's vaccination progress

SELECT
    Location,
    [Date],
    Population,
    NewVaccinations,
    RollingVaccinations,

    ROUND(
        (RollingVaccinations / NULLIF(Population, 0)) * 100,
        2
    ) AS VaccinationDosesPer100People

FROM #PercentPopulationVaccinated

WHERE Location = 'South Africa'
ORDER BY [Date];



-- ============================================================
-- SECTION 9: SQL VIEWS FOR REPORTING AND VISUALISATION
-- ============================================================
-- Objective:
-- Create reusable SQL views to support COVID-19 reporting,
-- vaccination analysis, and future dashboard development.
--
-- CREATE OR ALTER allows the views to be updated when
-- the script is executed again.


-- 9.1 Global COVID-19 Statistics
-- Summarises reported cases, deaths, and the overall
-- reported case fatality percentage.

GO

CREATE OR ALTER VIEW dbo.globalNumbers AS

SELECT
    SUM(new_cases) AS TotalCases,
    SUM(new_deaths) AS TotalDeaths,

    ROUND(
        (SUM(new_deaths) /
        NULLIF(SUM(new_cases), 0)) * 100,
        2
    ) AS DeathPercentage

FROM dbo.CovidDeath

WHERE continent IS NOT NULL;

GO


-- 9.2 Cumulative Vaccination Progress
-- Combines country-level COVID-19 records with daily
-- vaccination data to calculate cumulative doses.

CREATE OR ALTER VIEW dbo.populationVaccinated AS

SELECT
    dea.continent,
    dea.location,
    dea.[date],
    dea.population,
    vac.new_vaccinations,

    SUM(COALESCE(vac.new_vaccinations, 0))
        OVER (
            PARTITION BY dea.location
            ORDER BY dea.[date]
            ROWS BETWEEN UNBOUNDED PRECEDING
                     AND CURRENT ROW
        ) AS RollingVaccinations

FROM dbo.CovidDeath AS dea

INNER JOIN dbo.CovidVaccinations AS vac
    ON dea.location = vac.location
    AND dea.[date] = vac.[date]

WHERE dea.continent IS NOT NULL;

GO


-- 9.3 Vaccination Doses per 100 People
-- Uses the cumulative vaccination view to calculate
-- vaccination doses relative to population.
--
-- Note:
-- This measures doses per 100 people, not the percentage
-- of unique individuals vaccinated.

CREATE OR ALTER VIEW dbo.PercentPopulationVaccinated AS

SELECT
    continent,
    location,
    [date],
    population,
    new_vaccinations,
    RollingVaccinations,

    ROUND(
        (RollingVaccinations / NULLIF(population, 0)) * 100,
        2
    ) AS VaccinationDosesPer100People

FROM dbo.populationVaccinated;

GO


-- ============================================================
-- SECTION 9: VIEW VALIDATION
-- ============================================================

-- Verify global COVID-19 statistics

SELECT *
FROM dbo.globalNumbers;


-- Verify cumulative vaccination records

SELECT TOP 10 *
FROM dbo.populationVaccinated
WHERE location = 'South Africa'
ORDER BY [date] DESC;


-- Verify vaccination doses per 100 people

SELECT *
FROM dbo.PercentPopulationVaccinated
WHERE location = 'South Africa'
  AND [date] = '2021-02-28';



