# D15 — SQL JOIN na tabelach `customers` i `tickets`

## Cel ćwiczenia

Celem tego artefaktu jest przećwiczenie zapytań SQL łączących dane klienta ze zgłoszeniem supportowym.

W tym przykładzie używamy dwóch fikcyjnych tabel:

* `customers` — dane klientów,
* `tickets` — zgłoszenia klientów w systemie SaaS / helpdesk.

---

# 1. Przykładowa tabela `customers`

Tabela `customers` przechowuje informacje o klientach.

```sql
customers
```

| column         | description                    |
| -------------- | ------------------------------ |
| customer_id    | unikalny identyfikator klienta |
| customer_name  | imię i nazwisko klienta        |
| customer_email | email klienta                  |
| company_name   | nazwa firmy                    |
| plan           | plan subskrypcji               |
| country        | kraj klienta                   |

Przykładowe kolumny:

```sql
customer_id
customer_name
customer_email
company_name
plan
country
```

---

# 2. Przykładowa tabela `tickets`

Tabela `tickets` przechowuje zgłoszenia klientów.

```sql
tickets
```

| column      | description                         |
| ----------- | ----------------------------------- |
| ticket_id   | unikalny identyfikator zgłoszenia   |
| customer_id | ID klienta, który wysłał zgłoszenie |
| created_at  | data utworzenia zgłoszenia          |
| category    | kategoria zgłoszenia                |
| priority    | priorytet zgłoszenia                |
| status      | status zgłoszenia                   |
| summary     | krótki opis problemu                |
| owner       | osoba odpowiedzialna za ticket      |

Przykładowe kolumny:

```sql
ticket_id
customer_id
created_at
category
priority
status
summary
owner
```

---

# Relacja między tabelami

Tabele łączą się przez kolumnę `customer_id`.

```sql
customers.customer_id = tickets.customer_id
```

Po ludzku:

> Jeden klient może mieć wiele ticketów, ale każdy ticket należy do jednego klienta.

---

# 1. Show all tickets with customer details

```sql
SELECT
  t.ticket_id,
  t.created_at,
  c.customer_name,
  c.customer_email,
  c.company_name,
  t.category,
  t.priority,
  t.status,
  t.summary
FROM tickets AS t
INNER JOIN customers AS c
ON t.customer_id = c.customer_id;
```

**Tłumaczenie:**
Pokaż wszystkie tickety razem z danymi klienta.

`INNER JOIN` pokazuje tylko te zgłoszenia, które mają dopasowanego klienta w tabeli `customers`.

---

# 2. Show high priority tickets with customer company

```sql
SELECT
  t.ticket_id,
  c.company_name,
  c.customer_name,
  t.category,
  t.priority,
  t.status,
  t.summary
FROM tickets AS t
INNER JOIN customers AS c
ON t.customer_id = c.customer_id
WHERE t.priority = 'high';
```

**Tłumaczenie:**
Pokaż tylko tickety o wysokim priorytecie razem z nazwą firmy i klientem.

To jest przydatne, gdy support chce szybko zobaczyć, którzy klienci mają pilne problemy.

---

# 3. Show open tickets with customer plan

```sql
SELECT
  t.ticket_id,
  c.customer_name,
  c.company_name,
  c.plan,
  t.category,
  t.priority,
  t.status,
  t.summary
FROM tickets AS t
INNER JOIN customers AS c
ON t.customer_id = c.customer_id
WHERE t.status != 'closed';
```

**Tłumaczenie:**
Pokaż wszystkie niezamknięte tickety razem z planem klienta.

Dzięki temu support może zobaczyć, czy problem dotyczy np. klienta z planem `Free`, `Pro` albo `Enterprise`.

---

# 4. Show billing tickets with customer emails

```sql
SELECT
  t.ticket_id,
  c.customer_email,
  c.company_name,
  t.category,
  t.priority,
  t.status,
  t.summary
FROM tickets AS t
INNER JOIN customers AS c
ON t.customer_id = c.customer_id
WHERE t.category = 'billing';
```

**Tłumaczenie:**
Pokaż tickety z kategorii `billing` razem z emailem klienta.

To może dotyczyć faktur, subskrypcji, płatności, refundów albo podwójnych opłat.

---

# 5. Show tickets from Enterprise customers

```sql
SELECT
  t.ticket_id,
  c.customer_name,
  c.company_name,
  c.plan,
  t.category,
  t.priority,
  t.status,
  t.summary
FROM tickets AS t
INNER JOIN customers AS c
ON t.customer_id = c.customer_id
WHERE c.plan = 'Enterprise';
```

**Tłumaczenie:**
Pokaż zgłoszenia klientów z planem `Enterprise`.

To jest ważne w SaaS, bo klienci Enterprise często mają wyższy priorytet obsługi, osobne SLA albo dedykowany Customer Success Manager.

---

# 6. Show urgent login tickets with company and country

```sql
SELECT
  t.ticket_id,
  c.company_name,
  c.country,
  t.category,
  t.priority,
  t.status,
  t.summary
FROM tickets AS t
INNER JOIN customers AS c
ON t.customer_id = c.customer_id
WHERE t.category = 'login'
AND t.priority = 'high'
AND t.status != 'closed';
```

**Tłumaczenie:**
Pokaż pilne, niezamknięte tickety dotyczące logowania razem z firmą i krajem klienta.

To może oznaczać, że klient nie może dostać się do systemu, więc problem blokuje pracę.

---

# 7. Count tickets per customer

```sql
SELECT
  c.customer_id,
  c.customer_name,
  c.company_name,
  COUNT(t.ticket_id) AS ticket_count
FROM customers AS c
LEFT JOIN tickets AS t
ON c.customer_id = t.customer_id
GROUP BY
  c.customer_id,
  c.customer_name,
  c.company_name
ORDER BY ticket_count DESC;
```

**Tłumaczenie:**
Policz, ile ticketów ma każdy klient.

Używamy `LEFT JOIN`, żeby pokazać także klientów, którzy nie mają żadnych ticketów.

`COUNT(t.ticket_id)` liczy liczbę zgłoszeń przypisanych do klienta.

---

# 8. Show customers with no tickets

```sql
SELECT
  c.customer_id,
  c.customer_name,
  c.customer_email,
  c.company_name,
  c.plan
FROM customers AS c
LEFT JOIN tickets AS t
ON c.customer_id = t.customer_id
WHERE t.ticket_id IS NULL;
```

**Tłumaczenie:**
Pokaż klientów, którzy nie mają żadnych zgłoszeń.

`LEFT JOIN` bierze wszystkich klientów, a `WHERE t.ticket_id IS NULL` zostawia tylko tych, dla których nie znaleziono żadnego ticketa.

To może być przydatne dla Customer Success, bo klienci bez ticketów mogą:

* nie mieć problemów,
* dobrze korzystać z produktu,
* albo w ogóle nie używać systemu i nie zgłaszać problemów.

---

# Najważniejsze komendy z tego ćwiczenia

```sql
INNER JOIN
LEFT JOIN
ON
WHERE
AND
GROUP BY
COUNT
ORDER BY
IS NULL
```

## Po ludzku

`INNER JOIN` pokazuje tylko pasujące rekordy z obu tabel.
`LEFT JOIN` pokazuje wszystkie rekordy z lewej tabeli, nawet jeśli nie mają dopasowania w drugiej tabeli.
`ON` mówi SQL-owi, po jakiej kolumnie połączyć tabele.
`WHERE` filtruje wyniki.
`GROUP BY` grupuje wyniki, np. po kliencie.
`COUNT` liczy rekordy.
`IS NULL` sprawdza, czy czegoś brakuje.

---

# Portfolio note

I practiced SQL `JOIN` queries using two fictional SaaS support tables: `customers` and `tickets`.

The queries show how to:

* combine customer data with ticket data,
* find high-priority tickets,
* filter open billing and login issues,
* review Enterprise customer tickets,
* count tickets per customer,
* identify customers with no tickets.

This is useful for SaaS Support, Customer Success and Customer Operations roles because support teams often need to connect ticket information with customer details such as company, plan, email and country.
