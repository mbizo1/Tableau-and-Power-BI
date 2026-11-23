# Data Engineering & Analytics Portfolio

A portfolio of practical projects in **data engineering, SQL analytics, data preparation, and business intelligence**. My focus is on building dependable data workflows, validating results, and turning data into clear, useful insights.

**Career focus:** Junior Data Engineer · Data Solutions Engineer · Data Analyst  
**Background:** BSc Computer Science · Quality assurance and data validation experience  
**Certifications:** Microsoft Certified: Azure Data Scientist Associate · Microsoft Certified: Azure Data Fundamentals

## Featured projects

### 1. [Retail Sales ETL Pipeline — Python & SQL Server](https://github.com/mbizo1/Retail-Sales-ETL-Pipeline)
**Data engineering | Python · Pandas · SQL Server · SQLAlchemy**

Built a reproducible extract–transform–load pipeline for the [UCI Online Retail dataset](https://archive.ics.uci.edu/dataset/352/online+retail). The pipeline reads Excel data, standardises records, flags quality issues, and loads two related datasets into SQL Server.

- Processed **541,909 source records** and loaded **530,104 positive-sales records**.
- Added record-count validation, exception handling, execution logs and transactional database refresh.
- Verified repeatable execution without accumulating duplicate loads.

**[View source code, pipeline architecture and validation results](https://github.com/mbizo1/Retail-Sales-ETL-Pipeline)**

### 2. [COVID-19 Data Transformation — SQL Server](./COVID19_Data_Transformation/)
**SQL analytics | SQL Server · SSMS · CTEs · Window functions · Views**

Prepared historical COVID-19 case and vaccination datasets for analysis in SQL Server, then developed queries covering infection trends, reported deaths and vaccination progress.

- Imported and validated **85,171 records in each of two source tables**.
- Used joins, aggregations, CTEs, temporary tables and window functions.
- Created **three reusable SQL views** for reporting.

**[View the SQL analysis and documentation](./COVID19_Data_Transformation/)**

*Tutorial foundation credited to Alex The Analyst; the portfolio implementation includes revised queries, validations and documentation.*

### 3. [Career Transitions into Data — Power BI](./Career-Transitions-into-Data/)
**Business intelligence | Power BI · Power Query · DAX**

Redesigned an interactive report exploring career switching, entry difficulty and demographic patterns in a survey of **630 respondents**.

- Developed DAX measures for respondent counts, percentages and age groups.
- Cleaned and grouped survey data with Power Query.
- Compared reported entry difficulty for career switchers and non-switchers, with interactive country and role filters.

**[View the dashboard and key findings](./Career-Transitions-into-Data/)**

### 4. [Sales & Customer Performance — Tableau](./Tableau-Sales-Customer-Performance/)
**Data visualisation | Tableau · KPI calculations · Context filters · Dashboard design**

Enhanced two connected Tableau dashboards covering sales performance, profitability, customer activity and product trends.

- Presented a 2023 overview of approximately **733K in sales**, **93K in profit** and **693 customers**.
- Corrected KPI filtering behaviour and separated a chart-specific Top 10 ranking from overall totals.
- Improved navigation, formatting, visual consistency and customer-table readability.

**[View the dashboards and screenshots](./Tableau-Sales-Customer-Performance/)**

*Based on Data With Baraa's Tableau tutorial, with subsequent redesign, troubleshooting and validation documented in the project README. The downloadable workbook is published with a third-party MIT licence notice and attribution.*

## Technical toolkit

| Area | Tools and skills |
|---|---|
| **Programming and ETL** | Python, Pandas, SQLAlchemy, data cleaning, validation, logging |
| **Databases and SQL** | Microsoft SQL Server, SSMS, joins, CTEs, window functions, views |
| **Analytics and BI** | Power BI, Power Query, DAX, Tableau, dashboard design |
| **Cloud foundations** | Microsoft Azure fundamentals and data science certification |
| **Development workflow** | Git, GitHub, VS Code, Jupyter Notebook |

## What these projects demonstrate

I focus on more than producing charts or writing queries. Across these projects, I have worked on **data quality**, **reproducible processing**, **correct metric definitions**, **error investigation**, and **clear documentation** so that results can be explained and checked.

The portfolio uses historical, public, or tutorial-based datasets for learning and demonstration. Each project README describes its data source, methods, limitations and relevant attribution.

---

**[Explore all repositories](https://github.com/mbizo1?tab=repositories)** · **[View GitHub profile](https://github.com/mbizo1)**
