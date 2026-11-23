# Sales & Customer Performance Analytics | Tableau

An interactive Tableau portfolio project exploring retail sales performance, profitability, customer purchasing behaviour, and geographic trends. The project presents two connected dashboards with consistent navigation and filters.

> **Project context:** This is a tutorial-based Tableau project originally built by following **Data With Baraa**. The dashboards were subsequently redesigned and enhanced for this portfolio. See [Source and attribution](#source-and-attribution) for credit and publication notes.

## Dashboard previews

### Sales Performance Overview

![Sales Performance Overview](screenshots/sales-dashboard.png)

### Customer Performance Overview

![Customer Performance Overview](screenshots/customer-dashboard.png)

## Business questions

- How are sales, profit, and quantity performing compared with the previous year?
- Which product subcategories generate the most sales, and which produce profits or losses?
- How do weekly sales and profit move throughout the year?
- How many distinct customers and orders are recorded, and what is the average sales value per customer?
- How are customers distributed by number of orders, and which customers generate the highest profit?
- How does performance change when filtering by product category or geographic location?

## Key metrics: 2023 overview

The workbook's 2023 views display the following headline measures when product and geographic filters are unrestricted:

| Metric | 2023 value | Change vs. previous year |
|---|---:|---:|
| Total sales | 733K | +20.4% |
| Total profit | 93K | +14.2% |
| Total quantity | 12K | +26.8% |
| Total customers | 693 | +8.6% |
| Sales per customer | 1,058 | +10.8% |
| Total orders | 1,687 | +28.3% |

*Sales and profit are shown without a currency symbol because the source workbook's reporting currency has not yet been verified. Some dashboard totals are rounded for display.*

## Dashboard features

**Sales Performance Overview**
- Sales, profit, and quantity KPIs with previous-year comparisons and monthly sparklines.
- Top 10 product subcategories, comparing sales and profit/loss.
- Weekly sales and profit trends, including average reference lines.

**Customer Performance Overview**
- Unique customers, sales per customer, and orders KPIs with previous-year comparisons.
- Customer distribution by number of orders.
- Top 10 customers ranked by profit, with last order date, sales, and order counts.

**Interactivity**
- Linked navigation between the Sales and Customer dashboards.
- Year, category, subcategory, region, state, and city selection controls.
- Filter-responsive KPIs and charts.
- A chart-specific Top 10 restriction that does not reduce the overall KPI totals.

## Selected observations

- Sales increased by **20.4%** year over year, while profit increased by **14.2%**. Profit grew more slowly than sales, making margin performance a useful area for deeper analysis.
- Orders increased by **28.3%**, compared with **8.6%** growth in distinct customers. This suggests ordering activity grew faster than the customer base; further analysis would be needed to explain why.
- In the 2023 subcategory view, **Tables** show a loss, while **Copiers** contribute strong positive profit among the displayed subcategories. These patterns could inform follow-up investigation into product mix and discounting.

These observations describe the dashboard outputs; they do not establish the underlying causes.

## Tableau techniques demonstrated

- Interactive dashboard design, layout refinement, and consistent visual hierarchy.
- Calculated KPI measures and year-over-year comparisons.
- Distinct customer counts and average sales per customer (`SUM([CY Sales]) / COUNTD([CY Customers])`).
- Table-based Top 10 ranking and customer profit ranking.
- Context filters for Level of Detail calculations so KPI values respond to product and location selections.
- Separation of chart-specific ranking filters from dashboard-wide filters.
- Number/date formatting, chart labels, reference lines, and navigation controls.
- Packaging a workbook with its embedded extract for reuse.

## Repository files

```text
Tableau-Sales-Customer-Performance/
├── README.md
└── screenshots/
    ├── sales-dashboard.png
    └── customer-dashboard.png
```

The editable packaged workbook, `Sales_Customer_Performance_Analytics.twbx`, is retained locally. It can be added to the public repository after the terms applicable to its embedded source materials and data have been confirmed.

## How to explore

The screenshots above preview the finished dashboards. The packaged workbook is currently retained locally while its source-material permissions are checked.

For local review in Tableau Desktop:

1. Open `Sales_Customer_Performance_Analytics.twbx` in a compatible Tableau Desktop version.
2. Start with **Sales Performance Overview** and use the navigation buttons to switch between the two dashboards.
3. Open the filter panel and select a year, product category, subcategory, or location.
4. Compare the headline KPIs with the detailed charts. Restore unrestricted product and location filters for the overall 2023 figures shown above.

The saved packaged workbook was reopened and checked with its embedded data extract. A connection to the original standalone `Customers.csv` file was not available during the rebuild; avoid refreshing the data source without validating the connection first.

## Source and attribution

**Tutorial and original dashboard concept:** [Data With Baraa — *Tableau Complete Project End-to-End | Like I Do in My Real Projects*](https://www.youtube.com/watch?v=dahrmqT5GD4), by **Baraa Khatib Salkini (Data With Baraa)**.

This project began as a learning exercise following that tutorial. The initial dashboard structure, core business measures and source data were tutorial-based; they should not be represented as an independently invented dashboard concept or original dataset.

**My subsequent enhancement work** included:

- Redesigning the visual hierarchy, dashboard titles, colour palette and navigation panel.
- Improving customer-table readability, KPI number formatting and date presentation.
- Troubleshooting context-filter and Level of Detail calculation behaviour so KPIs respond to product and geographical selections.
- Separating the Top 10 subcategory ranking from overall KPI calculations, preserving accurate all-category totals.
- Testing year, product and location filters, navigating between dashboards, and validating a reopened packaged workbook.

**Dataset provenance:** The workbook uses the sales/customer dataset supplied or demonstrated with the tutorial. Its exact licensing and redistribution conditions have not been independently established for this copy; the figures are presented as tutorial-data analytics, not as operational results for a real retailer.

**Redistribution note:** The [official Data With Baraa Tableau GitHub repository](https://github.com/DataWithBaraa/tableau-ultimate-course) displays an MIT licence, but the separate [Academy Tableau course download](https://academy.datawithbaraa.com/l/digital_download/930713/tableau-course-materials) states that redistribution of its downloadable materials requires written permission. Because the origin and terms of this workbook's embedded extract are not yet confirmed, this portfolio page currently shares original explanatory text and screenshots of my enhanced dashboards, **not** the packaged `.twbx` or the tutorial data. The original creator is credited and linked above.
