-- Q01 — Lista wszystkich zgłoszeń
-- SELECT + ORDER BY. Sprawdzenie pełnej kolejki od najstarszego zgłoszenia.
SELECT
    ticket_id,
    subject,
    category,
    priority,
    status,
    owner,
    created_at
FROM tickets
ORDER BY created_at ASC;

-- Q02 — Aktywne zgłoszenia o wysokim priorytecie
-- WHERE + ORDER BY. Pokazuje najpilniejsze nierozwiązane sprawy.
SELECT
    ticket_id,
    subject,
    priority,
    status,
    owner
FROM tickets
WHERE status IN ('Open', 'Pending')
  AND priority IN ('High', 'Critical')
ORDER BY
    CASE priority
        WHEN 'Critical' THEN 1
        WHEN 'High' THEN 2
        ELSE 3
    END,
    created_at ASC;

-- Q03 — Zgłoszenia razem z danymi klienta
-- INNER JOIN. Łączy zgłoszenia z firmą, planem i krajem klienta.
SELECT
    t.ticket_id,
    c.company_name,
    c.plan,
    c.country,
    t.subject,
    t.category,
    t.priority,
    t.status
FROM tickets AS t
JOIN customers AS c
    ON t.customer_id = c.customer_id
ORDER BY t.ticket_id;

-- Q04 — Liczba zgłoszeń według kategorii
-- GROUP BY category. Wskazuje najczęstsze obszary problemów.
SELECT
    category,
    COUNT(*) AS ticket_count
FROM tickets
GROUP BY category
ORDER BY ticket_count DESC, category ASC;

-- Q05 — Liczba zgłoszeń według priorytetu
-- GROUP BY priority. Pokazuje rozkład pilności kolejki.
SELECT
    priority,
    COUNT(*) AS ticket_count
FROM tickets
GROUP BY priority
ORDER BY ticket_count DESC, priority ASC;

-- Q06 — Liczba przypisanych zgłoszeń według właściciela
-- GROUP BY owner. COALESCE pokazuje także zgłoszenia nieprzypisane.
SELECT
    COALESCE(owner, 'Unassigned') AS ticket_owner,
    COUNT(*) AS ticket_count
FROM tickets
GROUP BY COALESCE(owner, 'Unassigned')
ORDER BY ticket_count DESC, ticket_owner ASC;

-- Q07 — Średni czas rozwiązania według kategorii
-- WHERE + GROUP BY. Porównuje szybkość rozwiązywania różnych typów problemów.
SELECT
    category,
    COUNT(*) AS resolved_tickets,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours
FROM tickets
WHERE resolution_hours IS NOT NULL
GROUP BY category
ORDER BY avg_resolution_hours DESC;

-- Q08 — Średni czas pierwszej odpowiedzi według priorytetu
-- GROUP BY priority. Sprawdza, czy pilniejsze zgłoszenia otrzymują szybszą odpowiedź.
SELECT
    priority,
    COUNT(*) AS ticket_count,
    ROUND(AVG(first_response_minutes), 2) AS avg_first_response_minutes
FROM tickets
GROUP BY priority
ORDER BY avg_first_response_minutes ASC;

-- Q09 — Klienci z co najmniej trzema zgłoszeniami
-- JOIN + GROUP BY + HAVING. Wykrywa klientów generujących najwięcej spraw.
SELECT
    c.company_name,
    c.plan,
    COUNT(t.ticket_id) AS ticket_count
FROM customers AS c
JOIN tickets AS t
    ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.company_name, c.plan
HAVING COUNT(t.ticket_id) >= 3
ORDER BY ticket_count DESC, c.company_name ASC;

-- Q10 — Kategorie z co najmniej czterema zgłoszeniami
-- GROUP BY + HAVING. Filtruje wyniki dopiero po agregacji.
SELECT
    category,
    COUNT(*) AS ticket_count
FROM tickets
GROUP BY category
HAVING COUNT(*) >= 4
ORDER BY ticket_count DESC, category ASC;

-- Q11 — Liczba zgłoszeń według miesiąca
-- GROUP BY month. SQLite używa strftime do wyciągnięcia miesiąca z daty.
SELECT
    strftime('%Y-%m', created_at) AS report_month,
    COUNT(*) AS ticket_count
FROM tickets
GROUP BY strftime('%Y-%m', created_at)
ORDER BY report_month ASC;

-- Q12 — Miesięczny raport rozwiązanych zgłoszeń
-- WHERE + GROUP BY month. Łączy wolumen rozwiązanych spraw ze średnim czasem rozwiązania.
SELECT
    strftime('%Y-%m', created_at) AS report_month,
    COUNT(*) AS resolved_ticket_count,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours
FROM tickets
WHERE status IN ('Resolved', 'Closed')
  AND resolution_hours IS NOT NULL
GROUP BY strftime('%Y-%m', created_at)
ORDER BY report_month ASC;

-- Q13 — Obciążenie właścicieli aktywnymi zgłoszeniami
-- WHERE + GROUP BY + HAVING. Pokazuje bieżące obciążenie zespołu.
SELECT
    COALESCE(owner, 'Unassigned') AS ticket_owner,
    COUNT(*) AS active_ticket_count
FROM tickets
WHERE status IN ('Open', 'Pending')
GROUP BY COALESCE(owner, 'Unassigned')
HAVING COUNT(*) >= 1
ORDER BY active_ticket_count DESC, ticket_owner ASC;

-- Q14 — Raport kategorii i priorytetu
-- GROUP BY dwóch kolumn. Pozwala zobaczyć, które kategorie generują pilne sprawy.
SELECT
    category,
    priority,
    COUNT(*) AS ticket_count
FROM tickets
GROUP BY category, priority
ORDER BY category ASC, ticket_count DESC, priority ASC;

-- Q15 — Właściciele z wolniejszym średnim czasem rozwiązania
-- WHERE + GROUP BY + HAVING + ORDER BY. Wykrywa właścicieli z co najmniej dwiema sprawami i średnim czasem powyżej ośmiu godzin.
SELECT
    owner,
    COUNT(*) AS resolved_ticket_count,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours
FROM tickets
WHERE owner IS NOT NULL
  AND resolution_hours IS NOT NULL
GROUP BY owner
HAVING COUNT(*) >= 2
   AND AVG(resolution_hours) > 8
ORDER BY avg_resolution_hours DESC;
