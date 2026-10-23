# Career Transitions into Data

A one-page Power BI report exploring career switching, reported entry difficulty and respondent demographics using a June 2022 survey of 630 people.

![Career Transitions into Data dashboard](dashboard.png)

## Project objective

Explore three questions:

- What proportion of respondents reported switching careers into data?
- How did reported entry difficulty differ between career switchers and non-switchers?
- How did career switching vary across current role groups?

Country and role slicers allow users to explore subsets of the survey. An age chart provides context about the respondents.

## Tools and skills

- **Power BI Desktop:** Interactive report design and visualisation.
- **Power Query:** Data preparation, column naming and category sorting.
- **DAX:** Distinct respondent counts, filtered counts, percentages and age grouping.

## Data preparation

The source workbook contained 630 unique respondent IDs. The career-switching and entry-difficulty questions had no missing responses.

Preparation included:

- Renaming survey fields for readability.
- Trimming and cleaning relevant text fields.
- Grouping current job titles for clearer comparisons.
- Creating age bands: Under 25, 25–35 and Over 35.
- Creating a numeric difficulty sort column in Power Query, ordered from Very Easy to Very Difficult.

The original Excel source was kept unchanged.

## Key findings

| Metric | Result |
|---|---:|
| Survey respondents | 630 |
| Respondents who switched careers into data | 372 |
| Career switcher percentage | 59.0% |
| Respondents reporting difficult or very difficult entry | 200 |
| Difficult or very difficult entry percentage | 31.7% |

Among career switchers, **36.6%** reported difficult or very difficult entry, compared with **24.8%** of non-switchers—a difference of approximately **11.8 percentage points**.

These percentages compare difficulty within each group. The stacked column chart displays respondent counts, and the two groups have different sizes: 372 switchers and 258 non-switchers.

## Dashboard features

- Four summary cards.
- Entry-difficulty counts split by career-switch status.
- Career switcher percentage within each current role group.
- Respondent distribution by current age group.
- Country of residence and role group filters.

## Metric definitions

- **Total Respondents:** Distinct count of respondent IDs.
- **Career Switchers:** Respondents who answered Yes to switching careers into data.
- **Career Switcher %:** Career switchers divided by respondents with a Yes or No response in the applicable filter context.
- **Difficult Entry %:** Respondents selecting Difficult or Very Difficult divided by all respondents in the applicable group, removing the entry-difficulty filter.

## Limitations

- Findings describe this survey sample and should not be treated as representative of the entire data workforce.
- Responses were collected in June 2022 and do not describe current hiring conditions.
- Some role groups contain very few respondents. A high percentage may represent only a handful of people.
- Age represents age at the time of the survey, not age when the respondent changed careers.
- The survey includes a Student/Looking/None role category, so respondents should not all be assumed to hold data jobs.
- Previous careers, transition dates and transition duration were not recorded.
- Differences between groups are descriptive and do not establish causation.

## View the report

1. Download [the Power BI report](Career-Transitions-into-Data.pbix).
2. Open it in Power BI Desktop.
3. Explore the country and role slicers.
4. Clear filters and chart selections to return to the full sample of 630 respondents.

The screenshot above provides a static preview. Refreshing the report may require updating the Excel source path in Power Query.

## Project background and attribution

This report redesigns an earlier Power BI learning project around a focused career-transition question. The redesign includes revised measures, grouped categories, ordered difficulty responses and an updated page layout.

The original dataset publisher and associated tutorial have not yet been confirmed. Source attribution will be updated once verified.
