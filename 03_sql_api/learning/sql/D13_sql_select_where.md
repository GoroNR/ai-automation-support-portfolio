# D13 — SQL SELECT & WHERE na tabeli `tickets`

## Cel ćwiczenia

Celem tego artefaktu jest przećwiczenie podstawowych zapytań SQL na fikcyjnej tabeli `tickets`.

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

---

# 1. SELECT all tickets

```sql
SELECT *
FROM tickets;
```

**Tłumaczenie:**
Pokaż wszystkie kolumny i wszystkie zgłoszenia z tabeli `tickets`.

`*` oznacza wszystkie kolumny.

---

# 2. SELECT only ticket ID and summary

```sql
SELECT ticket_id, summary
FROM tickets;
```

**Tłumaczenie:**
Pokaż tylko numer zgłoszenia i krótki opis problemu.

To jest przydatne, gdy nie potrzebujemy całej tabeli, tylko szybkiego przeglądu ticketów.

---

# 3. SELECT category

```sql
SELECT category
FROM tickets;
```

**Tłumaczenie:**
Pokaż kategorię każdego zgłoszenia.

Przykładowe kategorie to: `login`, `billing`, `bug`, `integration`, `performance`, `feature_request`.

---

# 4. SELECT unique categories

```sql
SELECT DISTINCT category
FROM tickets;
```

**Tłumaczenie:**
Pokaż kategorie zgłoszeń bez duplikatów.

`DISTINCT` usuwa powtarzające się wartości.

---

# 5. Find high priority tickets

```sql
SELECT *
FROM tickets
WHERE priority = 'high';
```

**Tłumaczenie:**
Pokaż wszystkie zgłoszenia, które mają priorytet `high`.

To pozwala szybko znaleźć najważniejsze sprawy do obsługi.

---

# 6. Find tickets that are not closed

```sql
SELECT *
FROM tickets
WHERE status != 'closed';
```

**Tłumaczenie:**
Pokaż wszystkie zgłoszenia, które nie są zamknięte.

`!=` oznacza „nie równa się”.

To zapytanie pokazuje tickety, które nadal wymagają pracy.

---

# 7. Find billing tickets

```sql
SELECT *
FROM tickets
WHERE category = 'billing';
```

**Tłumaczenie:**
Pokaż wszystkie zgłoszenia z kategorii `billing`.

To mogą być problemy z płatnościami, fakturami, subskrypcją albo podwójnym obciążeniem karty.

---

# 8. Find tickets assigned to Adrian

```sql
SELECT *
FROM tickets
WHERE owner = 'Adrian';
```

**Tłumaczenie:**
Pokaż wszystkie zgłoszenia przypisane do osoby `Adrian`.

Takie zapytanie pomaga sprawdzić własną kolejkę pracy.

---

# 9. Find high priority tickets that are still open

```sql
SELECT *
FROM tickets
WHERE priority = 'high'
AND status != 'closed';
```

**Tłumaczenie:**
Pokaż zgłoszenia o wysokim priorytecie, które nie są jeszcze zamknięte.

`AND` oznacza, że oba warunki muszą być spełnione jednocześnie.

To jest bardzo praktyczne zapytanie dla supportu, bo pokazuje pilne sprawy, którymi trzeba się zająć.

---

# 10. Find login or integration tickets

```sql
SELECT *
FROM tickets
WHERE category = 'login'
OR category = 'integration';
```

**Tłumaczenie:**
Pokaż zgłoszenia z kategorii `login` albo `integration`.

`OR` oznacza, że wystarczy spełnić jeden z warunków.

To przydatne, gdy chcemy zobaczyć kilka typów problemów naraz.

---

# Short summary

Najważniejsze komendy z tego ćwiczenia:

```sql
SELECT
FROM
WHERE
DISTINCT
AND
OR
!=
```

## Po ludzku

`SELECT` mówi, jakie kolumny chcemy zobaczyć.
`FROM` mówi, z jakiej tabeli pobieramy dane.
`WHERE` filtruje wyniki.
`DISTINCT` usuwa duplikaty.
`AND` łączy warunki, które muszą być spełnione razem.
`OR` pozwala spełnić jeden z kilku warunków.
`!=` oznacza „nie równa się”.

---

# Portfolio note

I practiced basic SQL `SELECT` and `WHERE` queries on a fictional SaaS support tickets table.
The queries show how to retrieve all tickets, select specific columns, filter by priority, category, owner and status, and combine conditions using `AND` and `OR`.
