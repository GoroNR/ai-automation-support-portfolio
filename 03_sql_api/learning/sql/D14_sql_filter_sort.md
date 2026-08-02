# D14 — SQL Filter & Sort na tabeli `tickets`

## Cel ćwiczenia

Celem tego artefaktu jest przećwiczenie filtrowania i sortowania danych w SQL na fikcyjnej tabeli `tickets`.

Tabela `tickets` reprezentuje zgłoszenia klientów w systemie SaaS / helpdesk.

Przykładowe kolumny:

```sql
ticket_id
created_at
customer_email
category
priority
status
summary
owner
answer_draft
```

Przykładowe wartości:

```text
category: login, billing, bug, feature_request, integration, performance
priority: low, medium, high, critical
status: new, open, in_progress, waiting_customer, escalated, solved, closed
```

---

# 1. Show all tickets

```sql
SELECT *
FROM tickets;
```

**Tłumaczenie:**
Pokaż wszystkie zgłoszenia i wszystkie kolumny z tabeli `tickets`.

---

# 2. Show only basic ticket information

```sql
SELECT ticket_id, created_at, category, priority, status, summary
FROM tickets;
```

**Tłumaczenie:**
Pokaż tylko najważniejsze informacje o ticketach: ID, datę utworzenia, kategorię, priorytet, status i opis.

To jest bardziej czytelne niż `SELECT *`, jeśli tabela ma dużo kolumn.

---

# 3. Tickets by newest date

```sql
SELECT *
FROM tickets
ORDER BY created_at DESC;
```

**Tłumaczenie:**
Pokaż tickety od najnowszego do najstarszego.

`DESC` oznacza sortowanie malejące. Przy datach oznacza to, że najnowsze zgłoszenia będą na górze.

---

# 4. Tickets by oldest date

```sql
SELECT *
FROM tickets
ORDER BY created_at ASC;
```

**Tłumaczenie:**
Pokaż tickety od najstarszego do najnowszego.

`ASC` oznacza sortowanie rosnące.

---

# 5. High priority tickets first

```sql
SELECT *
FROM tickets
ORDER BY
  CASE
    WHEN priority = 'critical' THEN 1
    WHEN priority = 'high' THEN 2
    WHEN priority = 'medium' THEN 3
    WHEN priority = 'low' THEN 4
    ELSE 5
  END;
```

**Tłumaczenie:**
Pokaż tickety posortowane według ważności: najpierw `critical`, potem `high`, potem `medium`, potem `low`.

Samo `ORDER BY priority` sortowałoby alfabetycznie, więc nie dałoby prawdziwej kolejności priorytetów. Dlatego używamy `CASE`.

---

# 6. High priority tickets only

```sql
SELECT *
FROM tickets
WHERE priority = 'high';
```

**Tłumaczenie:**
Pokaż tylko tickety z priorytetem `high`.

To zapytanie pomaga szybko znaleźć pilne zgłoszenia.

---

# 7. Critical or high priority tickets

```sql
SELECT *
FROM tickets
WHERE priority = 'critical'
OR priority = 'high';
```

**Tłumaczenie:**
Pokaż tickety z priorytetem `critical` albo `high`.

`OR` oznacza, że wystarczy spełnić jeden z warunków.

---

# 8. Tickets that are not closed

```sql
SELECT *
FROM tickets
WHERE status != 'closed';
```

**Tłumaczenie:**
Pokaż wszystkie tickety, które nie są zamknięte.

`!=` oznacza „nie równa się”.

To zapytanie pokazuje aktywne sprawy, które nadal wymagają pracy.

---

# 9. Open billing tickets

```sql
SELECT *
FROM tickets
WHERE category = 'billing'
AND status != 'closed';
```

**Tłumaczenie:**
Pokaż zgłoszenia z kategorii `billing`, które nie są zamknięte.

`AND` oznacza, że oba warunki muszą być spełnione jednocześnie.

To jest praktyczne dla supportu, bo problemy billingowe często wymagają szybkiej i ostrożnej obsługi.

---

# 10. Urgent login tickets

```sql
SELECT *
FROM tickets
WHERE category = 'login'
AND priority = 'high'
AND status != 'closed';
```

**Tłumaczenie:**
Pokaż pilne zgłoszenia dotyczące logowania, które nadal nie są zamknięte.

To może oznaczać, że użytkownik nie może dostać się do systemu, więc problem blokuje pracę.

---

# 11. New tickets waiting for first response

```sql
SELECT *
FROM tickets
WHERE status = 'new'
ORDER BY created_at ASC;
```

**Tłumaczenie:**
Pokaż nowe tickety, posortowane od najstarszego do najnowszego.

To pomaga sprawdzić, które nowe zgłoszenia czekają najdłużej na pierwszą odpowiedź.

---

# 12. Escalated tickets

```sql
SELECT *
FROM tickets
WHERE status = 'escalated';
```

**Tłumaczenie:**
Pokaż zgłoszenia, które zostały eskalowane.

Takie tickety zwykle wymagają pomocy L2 Technical Support, Product albo Engineering.

---

# 13. Integration tickets sorted by newest date

```sql
SELECT *
FROM tickets
WHERE category = 'integration'
ORDER BY created_at DESC;
```

**Tłumaczenie:**
Pokaż zgłoszenia dotyczące integracji, od najnowszego do najstarszego.

Przykłady takich problemów: Slack integration, CRM integration, API key, webhook, automation workflow.

---

# 14. Performance tickets with medium or high priority

```sql
SELECT *
FROM tickets
WHERE category = 'performance'
AND (
  priority = 'medium'
  OR priority = 'high'
);
```

**Tłumaczenie:**
Pokaż tickety dotyczące wydajności, które mają priorytet `medium` albo `high`.

Nawiasy pomagają jasno pokazać, które warunki należą do jednej grupy.

---

# 15. Tickets assigned to Adrian and not closed

```sql
SELECT *
FROM tickets
WHERE owner = 'Adrian'
AND status != 'closed'
ORDER BY created_at ASC;
```

**Tłumaczenie:**
Pokaż aktywne tickety przypisane do Adriana, od najstarszych do najnowszych.

To jest przykład zapytania do sprawdzenia własnej kolejki pracy.

---

# 16. Open tickets sorted by priority and date

```sql
SELECT *
FROM tickets
WHERE status != 'closed'
ORDER BY
  CASE
    WHEN priority = 'critical' THEN 1
    WHEN priority = 'high' THEN 2
    WHEN priority = 'medium' THEN 3
    WHEN priority = 'low' THEN 4
    ELSE 5
  END,
  created_at ASC;
```

**Tłumaczenie:**
Pokaż aktywne tickety, najpierw według priorytetu, a potem według daty utworzenia.

To jest bardzo praktyczne zapytanie dla supportu, bo pokazuje najpierw najważniejsze i najstarsze sprawy.

---

# Najważniejsze komendy z tego ćwiczenia

```sql
SELECT
FROM
WHERE
AND
OR
ORDER BY
ASC
DESC
CASE
!=
```

## Po ludzku

`SELECT` mówi, jakie kolumny chcemy zobaczyć.
`FROM` mówi, z jakiej tabeli pobieramy dane.
`WHERE` filtruje wyniki.
`AND` oznacza, że wszystkie warunki muszą być spełnione.
`OR` oznacza, że wystarczy spełnić jeden z warunków.
`ORDER BY` sortuje wyniki.
`ASC` sortuje rosnąco.
`DESC` sortuje malejąco.
`CASE` pozwala stworzyć własną logikę sortowania.
`!=` oznacza „nie równa się”.

---

# Portfolio note

I practiced SQL filtering and sorting on a fictional SaaS support tickets table.

The queries show how to:

* sort tickets by newest date,
* sort tickets by custom priority order,
* find open billing tickets,
* find urgent login tickets,
* filter escalated tickets,
* review active tickets assigned to a specific owner,
* combine `WHERE`, `AND`, `OR`, `ORDER BY` and `CASE`.

This is useful for SaaS Support, Technical Support and Customer Operations roles because support teams often need to filter ticket queues by category, priority, status, date and owner.
