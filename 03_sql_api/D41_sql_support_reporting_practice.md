# D41 — SQL Support Reporting Practice

## Objective

Build practical SQL reporting skills for a SaaS or IT Support environment using a relational SQLite dataset with two tables: `customers` and `tickets`.

This exercise covers:

- `SELECT`
- `WHERE`
- `JOIN`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- aggregate functions
- monthly support reporting

## Files

```text
AI_Automation_Portfolio/
└── 03_sql_api/
    ├── D41_sql_praktyka_raportów_supportowych.md
    ├── D41_support_dataset.sql
    ├── D41_queries.sql
    ├── D41_support.db
    └── screenshots/
        ├── D41_01_database_setup.png
        ├── D41_02_monthly_report.png
        └── D41_03_all_queries.png
```

## Dataset

The database contains:

- 8 customers
- 24 support tickets
- multiple categories, priorities, owners and statuses
- tickets created across three months

## Database setup

1. Create a new SQLite database named `D41_support.db`.
2. Open and execute `D41_support_dataset.sql`.
3. Confirm that both tables exist:

```sql
SELECT name
FROM sqlite_master
WHERE type = 'table'
ORDER BY name;
```

4. Confirm the number of records:

```sql
SELECT COUNT(*) AS customer_count FROM customers;
SELECT COUNT(*) AS ticket_count FROM tickets;
```

Expected result:

```text
customers: 8
tickets: 24
```

## Practical work

I manually executed 15 support-reporting queries stored in `D41_queries.sql`.

The queries cover:

1. complete ticket queue ordered by creation date,
2. active High and Critical tickets,
3. tickets joined with customer information,
4. ticket count by category,
5. ticket count by priority,
6. ticket count by owner,
7. average resolution time by category,
8. average first response time by priority,
9. customers with at least three tickets,
10. categories with at least four tickets,
11. ticket volume by month,
12. monthly resolved-ticket performance,
13. active workload by owner,
14. ticket count by category and priority,
15. owners with slower average resolution time.

## Selected report

The monthly support-performance query combines filtering, aggregation and ordering:

```sql
SELECT
    strftime('%Y-%m', created_at) AS report_month,
    COUNT(*) AS resolved_ticket_count,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours
FROM tickets
WHERE status IN ('Resolved', 'Closed')
  AND resolution_hours IS NOT NULL
GROUP BY strftime('%Y-%m', created_at)
ORDER BY report_month ASC;
```

This report shows the number of resolved tickets and the average resolution time for each month.

## Business observations

Complete these points after running the queries:

- **Most common ticket category:** _Add the result from Query 4._
- **Most common priority:** _Add the result from Query 5._
- **Owner with the most assigned tickets:** _Add the result from Query 6._
- **Category with the highest average resolution time:** _Add the result from Query 7._
- **Month with the largest ticket volume:** _Add the result from Query 11._
- **Customers with at least three tickets:** _Add the result from Query 9._
- **First response performance:** _Explain whether Critical and High tickets received faster first responses than Medium and Low tickets._

## Evidence

Only three screenshots are required.

### 1. Database setup

```text
D41_01_database_setup.png
```

The screenshot should show:

- the `customers` and `tickets` tables,
- the customer count of 8,
- the ticket count of 24.

### 2. Monthly report

```text
D41_02_monthly_report.png
```

The screenshot should show:

- the complete monthly report query,
- its result table,
- month, resolved-ticket count and average resolution time.

### 3. Complete query file

```text
D41_03_all_queries.png
```

The screenshot should show `D41_queries.sql` in the editor with the query headings or file outline confirming all 15 queries.

## Skills demonstrated

- SQL
- SQLite
- relational databases
- filtering and sorting
- table joins
- aggregate functions
- `GROUP BY` and `HAVING`
- SaaS support reporting
- ticket workload analysis
- operational metrics

## Completion checklist

- [ ] Created `D41_support.db`.
- [ ] Executed `D41_support_dataset.sql`.
- [ ] Confirmed 8 customers and 24 tickets.
- [ ] Manually executed all 15 queries.
- [ ] Saved all queries in `D41_queries.sql`.
- [ ] Added business observations.
- [ ] Created the three required screenshots.
- [ ] Saved all files in `03_sql_api/`.
- [ ] Committed the exercise to GitHub.

## Git commit

```bash
git add 03_sql_api/
git commit -m "Complete D41 SQL support reporting practice"
git push
```

## Portfolio summary

> Built a relational SQLite support dataset and created 15 SQL reports covering filtering, joins, aggregation, workload analysis, customer ticket volume, priority distribution, response time and monthly support performance.
