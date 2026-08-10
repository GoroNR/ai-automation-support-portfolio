# D46 — JSON Basics for SaaS Support and API Work

## Objective

The goal of this exercise was to practise reading and writing JSON objects used in common SaaS and API scenarios.

The exercise focuses on three business entities:

- support tickets,
- customers,
- orders.

I created five JSON objects and described:

- what each object represents,
- the purpose of each field,
- the data types used,
- nested objects,
- arrays,
- boolean values,
- `null` values.

---

# What is JSON?

JSON stands for:

```text
JavaScript Object Notation
```

It is a lightweight text format commonly used to exchange structured data between APIs, applications, backend services and automation tools.

A JSON object is enclosed in curly braces:

```json
{
  "key": "value"
}
```

---

# Common JSON data types

## String

```json
{
  "status": "open"
}
```

## Number

```json
{
  "priority_score": 3
}
```

## Boolean

```json
{
  "is_active": true
}
```

## Null

```json
{
  "resolved_at": null
}
```

## Array

```json
{
  "tags": ["login", "urgent"]
}
```

## Nested object

```json
{
  "customer": {
    "customer_id": 101,
    "company": "Northstar Labs"
  }
}
```

---

# Object 1 — Basic support ticket

```json
{
  "ticket_id": 1001,
  "subject": "Unable to log in after password reset",
  "category": "login",
  "priority": "high",
  "status": "open",
  "customer_email": "anna@example.com",
  "created_at": "2026-08-10T09:15:00Z",
  "resolved_at": null
}
```

## Description

This object represents a basic SaaS support ticket.

| Field | Type | Description |
|---|---|---|
| `ticket_id` | number | Unique ticket identifier |
| `subject` | string | Short description of the issue |
| `category` | string | Ticket category |
| `priority` | string | Business priority |
| `status` | string | Current ticket status |
| `customer_email` | string | Customer contact email |
| `created_at` | string | Ticket creation timestamp |
| `resolved_at` | null / string | Resolution timestamp when available |

The field:

```json
"resolved_at": null
```

shows that the property exists, but no resolution time is available yet.

---

# Object 2 — Support ticket with nested customer data

```json
{
  "ticket_id": 1002,
  "subject": "API returns 401 Unauthorized",
  "category": "api",
  "priority": "high",
  "status": "investigating",
  "needs_escalation": false,
  "customer": {
    "customer_id": 205,
    "company_name": "BlueWave Travel",
    "plan": "Enterprise",
    "country": "Thailand"
  },
  "tags": [
    "api",
    "authentication",
    "technical_support"
  ]
}
```

## Description

This object demonstrates:

- a nested `customer` object,
- an array of tags,
- a boolean value.

Correct boolean:

```json
"needs_escalation": false
```

Different data type:

```json
"needs_escalation": "false"
```

The second value is a string, not a boolean.

---

# Object 3 — Customer profile

```json
{
  "customer_id": 301,
  "company_name": "Northstar Labs",
  "contact_name": "Marta Kowalska",
  "email": "marta@northstarlabs.example",
  "plan": "Enterprise",
  "country": "Poland",
  "active": true,
  "monthly_revenue": 2499.99,
  "onboarding_completed": true
}
```

## Description

This object represents a SaaS customer account.

It contains:

- strings,
- numbers,
- booleans.

A number should normally not be quoted when the API expects a numeric value:

```json
"monthly_revenue": 2499.99
```

---

# Object 4 — Customer with integrations and account owner

```json
{
  "customer_id": 302,
  "company_name": "Orbit Finance",
  "plan": "Enterprise",
  "active": true,
  "integrations": [
    "Slack",
    "Salesforce",
    "Microsoft Teams"
  ],
  "account_owner": {
    "employee_id": 17,
    "name": "Daniel Smith",
    "team": "Customer Success"
  },
  "last_health_score": 87,
  "churn_risk": false
}
```

## Description

This customer object contains:

- an array of integrations,
- a nested account-owner object,
- numeric and boolean values.

The nested object groups related employee data:

```json
"account_owner": {
  "employee_id": 17,
  "name": "Daniel Smith",
  "team": "Customer Success"
}
```

---

# Object 5 — Customer order

```json
{
  "order_id": "ORD-2026-0042",
  "customer_id": 301,
  "status": "processing",
  "currency": "USD",
  "items": [
    {
      "product_id": "SAAS-PRO",
      "product_name": "Pro Subscription",
      "quantity": 10,
      "unit_price": 49.0
    },
    {
      "product_id": "ONBOARDING",
      "product_name": "Onboarding Package",
      "quantity": 1,
      "unit_price": 299.0
    }
  ],
  "total_amount": 789.0,
  "paid": true,
  "created_at": "2026-08-10T10:30:00Z"
}
```

## Description

This object represents an order containing an array of item objects.

Each item has its own:

- product ID,
- product name,
- quantity,
- unit price.

This is a common API structure when one resource contains multiple related records.

---

# Comparison of the five objects

| Object | Main JSON concepts |
|---|---|
| Ticket 1 | strings, numbers, `null` |
| Ticket 2 | nested object, array, boolean |
| Customer 1 | strings, numbers, booleans |
| Customer 2 | array, nested object, booleans |
| Order | array of objects, numbers, booleans |

---

# Common JSON mistakes

## 1. Using single quotation marks

Incorrect:

```text
{
  'status': 'open'
}
```

Correct:

```json
{
  "status": "open"
}
```

## 2. Adding a trailing comma

Incorrect:

```text
{
  "status": "open",
  "priority": "high",
}
```

Correct:

```json
{
  "status": "open",
  "priority": "high"
}
```

## 3. Writing booleans as strings

Different:

```json
{
  "active": "true"
}
```

and:

```json
{
  "active": true
}
```

## 4. Writing numbers as strings

Different:

```json
{
  "ticket_id": "1001"
}
```

and:

```json
{
  "ticket_id": 1001
}
```

The expected type depends on the API schema.

## 5. Missing comma between fields

Incorrect:

```text
{
  "status": "open"
  "priority": "high"
}
```

Correct:

```json
{
  "status": "open",
  "priority": "high"
}
```

## 6. Using `undefined`

JSON supports:

```text
null
```

but does not support JavaScript-style:

```text
undefined
```

---

# Why JSON matters in Technical Support

In SaaS Technical Support, JSON frequently appears in:

- API request bodies,
- API responses,
- webhook payloads,
- integration logs,
- automation tools,
- configuration files.

A support specialist should be able to answer questions such as:

```text
Is the JSON valid?
Is a required field missing?
Is the field name correct?
Is the value using the correct data type?
Is the expected value nested inside another object?
Is the expected information inside an array?
Is the API returning null?
```

---

# Example troubleshooting scenario

A customer sends:

```json
{
  "customer_id": 301,
  "quantity": "10",
  "paid": "true"
}
```

The API expects:

```json
{
  "customer_id": 301,
  "quantity": 10,
  "paid": true
}
```

Both payloads are syntactically valid JSON, but the data types differ.

Customer request:

```text
quantity → string
paid     → string
```

Expected schema:

```text
quantity → number
paid     → boolean
```

This can cause an API validation error even when the JSON syntax itself is valid.

---

# Key lessons

During this exercise, I learned how to:

- create valid JSON objects,
- use key-value pairs,
- distinguish strings from numbers,
- use boolean values,
- use `null`,
- create arrays,
- create nested objects,
- create arrays of objects,
- recognize common JSON syntax errors,
- identify data-type mismatches,
- read JSON from a Technical Support perspective.

---

# Skills demonstrated

- JSON
- REST API fundamentals
- API request bodies
- API response analysis
- data types
- nested objects
- arrays
- technical troubleshooting
- SaaS Technical Support
- technical documentation

---

# Completion checklist

- [ ] Created a basic support ticket object.
- [ ] Created a support ticket with nested customer data.
- [ ] Created a customer profile object.
- [ ] Created a customer object with integrations and an account owner.
- [ ] Created an order containing an array of item objects.
- [ ] Identified strings, numbers, booleans and `null`.
- [ ] Used nested objects.
- [ ] Used arrays.
- [ ] Reviewed common JSON mistakes.
- [ ] Added this Markdown file to GitHub.

## Git commit

```text
Complete JSON basics practice
```
