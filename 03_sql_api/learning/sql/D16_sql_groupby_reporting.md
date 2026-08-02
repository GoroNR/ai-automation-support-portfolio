# D16 — SQL GROUP BY Reporting

## Cel ćwiczenia

Celem tego artefaktu jest przećwiczenie raportowych zapytań SQL z użyciem:

```sql
GROUP BY
COUNT
SUM
AVG
MIN
MAX
ORDER BY
HAVING
JOIN
```

Zapytania są oparte na fikcyjnych tabelach SaaS / helpdesk:

* `tickets` — zgłoszenia klientów,
* `customers` — dane klientów.

---

# Przykładowa tabela `tickets`

```sql
ticket_id
customer_id
created_at
category
priority
status
summary
owner
resolution_hours
satisfaction_score
```

# Przykładowa tabela `customers`

```sql
customer_id
customer_name
customer_email
company_name
plan
country
```

---

# 1. Count tickets by category

```sql
SELECT
  category,
  COUNT(*) AS ticket_count
FROM tickets
GROUP BY category
ORDER BY ticket_count DESC;
```

**Tłumaczenie:**
Policz, ile zgłoszeń jest w każdej kategorii.

To pokazuje, jakie problemy pojawiają się najczęściej, np. `login`, `billing`, `bug`, `integration`, `performance`.

---

# 2. Count tickets by priority

```sql
SELECT
  priority,
  COUNT(*) AS ticket_count
FROM tickets
GROUP BY priority
ORDER BY ticket_count DESC;
```

**Tłumaczenie:**
Policz, ile ticketów ma każdy priorytet.

To pomaga sprawdzić, czy zespół ma dużo pilnych spraw, np. `high` albo `critical`.

---

# 3. Count tickets by status

```sql
SELECT
  status,
  COUNT(*) AS ticket_count
FROM tickets
GROUP BY status
ORDER BY ticket_count DESC;
```

**Tłumaczenie:**
Policz, ile ticketów jest w każdym statusie.

Przykładowe statusy:

```text
new
open
in_progress
waiting_customer
escalated
solved
closed
```

To pomaga zobaczyć, ile spraw jest nadal aktywnych.

---

# 4. Count open tickets by category

```sql
SELECT
  category,
  COUNT(*) AS open_ticket_count
FROM tickets
WHERE status != 'closed'
GROUP BY category
ORDER BY open_ticket_count DESC;
```

**Tłumaczenie:**
Policz aktywne tickety w każdej kategorii.

`WHERE status != 'closed'` filtruje tylko zgłoszenia, które nadal wymagają pracy.

---

# 5. Count high priority tickets by owner

```sql
SELECT
  owner,
  COUNT(*) AS high_priority_count
FROM tickets
WHERE priority = 'high'
GROUP BY owner
ORDER BY high_priority_count DESC;
```

**Tłumaczenie:**
Policz, ile ticketów o wysokim priorytecie ma każdy support agent.

To jest przydatne do sprawdzania obciążenia zespołu.

---

# 6. Average resolution time by category

```sql
SELECT
  category,
  AVG(resolution_hours) AS avg_resolution_hours
FROM tickets
WHERE status = 'closed'
GROUP BY category
ORDER BY avg_resolution_hours DESC;
```

**Tłumaczenie:**
Policz średni czas rozwiązania ticketów w każdej kategorii.

`AVG()` liczy średnią.
`WHERE status = 'closed'` oznacza, że liczymy tylko zamknięte tickety, bo tylko one mają pełny czas rozwiązania.

---

# 7. Average satisfaction score by owner

```sql
SELECT
  owner,
  AVG(satisfaction_score) AS avg_satisfaction_score
FROM tickets
WHERE satisfaction_score IS NOT NULL
GROUP BY owner
ORDER BY avg_satisfaction_score DESC;
```

**Tłumaczenie:**
Policz średnią ocenę satysfakcji klienta dla każdego agenta.

`IS NOT NULL` usuwa tickety bez oceny klienta.

To pomaga sprawdzić jakość odpowiedzi supportu.

---

# 8. Count tickets by customer plan

```sql
SELECT
  c.plan,
  COUNT(t.ticket_id) AS ticket_count
FROM customers AS c
INNER JOIN tickets AS t
ON c.customer_id = t.customer_id
GROUP BY c.plan
ORDER BY ticket_count DESC;
```

**Tłumaczenie:**
Policz, ile ticketów pochodzi od klientów z każdego planu.

Przykładowe plany:

```text
Free
Basic
Pro
Enterprise
```

To może pokazać, czy np. klienci `Enterprise` zgłaszają więcej problemów niż klienci `Free`.

---

# 9. Count tickets by country

```sql
SELECT
  c.country,
  COUNT(t.ticket_id) AS ticket_count
FROM customers AS c
INNER JOIN tickets AS t
ON c.customer_id = t.customer_id
GROUP BY c.country
ORDER BY ticket_count DESC;
```

**Tłumaczenie:**
Policz liczbę ticketów według kraju klienta.

To jest przykład raportu dla Customer Operations albo Customer Success.

---

# 10. Show categories with more than 3 open tickets

```sql
SELECT
  category,
  COUNT(*) AS open_ticket_count
FROM tickets
WHERE status != 'closed'
GROUP BY category
HAVING COUNT(*) > 3
ORDER BY open_ticket_count DESC;
```

**Tłumaczenie:**
Pokaż tylko te kategorie, które mają więcej niż 3 aktywne tickety.

`HAVING` działa podobnie do `WHERE`, ale używa się go po `GROUP BY`, czyli do filtrowania wyników zagregowanych.

---

# Najważniejsze komendy z tego ćwiczenia

```sql
GROUP BY
COUNT
SUM
AVG
MIN
MAX
ORDER BY
HAVING
JOIN
IS NOT NULL
```

## Po ludzku

`GROUP BY` grupuje dane, np. według kategorii, statusu albo agenta.
`COUNT()` liczy rekordy.
`SUM()` sumuje wartości.
`AVG()` liczy średnią.
`MIN()` pokazuje najmniejszą wartość.
`MAX()` pokazuje największą wartość.
`ORDER BY` sortuje wynik.
`HAVING` filtruje wyniki po grupowaniu.
`JOIN` łączy dane z dwóch tabel.

---

# Portfolio note

I practiced SQL reporting queries using fictional SaaS support data.

The queries show how to:

* count tickets by category, priority and status,
* report open tickets by category,
* check high-priority workload by owner,
* calculate average resolution time,
* calculate customer satisfaction scores,
* combine ticket data with customer data,
* report tickets by plan and country,
* use `HAVING` to filter grouped results.

This is useful for SaaS Support, Technical Support, Customer Operations and Customer Success roles because teams often need to analyze ticket volume, workload, response quality and customer impact.
