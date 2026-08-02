SELECT
    strftime('%Y-%m', created_at) AS report_month,
    COUNT(*) AS resolved_ticket_count,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours
FROM tickets
WHERE status IN ('Resolved', 'Closed')
  AND resolution_hours IS NOT NULL
GROUP BY strftime('%Y-%m', created_at)
ORDER BY report_month ASC;