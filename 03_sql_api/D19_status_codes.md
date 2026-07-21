# D19 — API Status Codes

## Cel ćwiczenia

Celem tego artefaktu jest zrozumienie podstawowych kodów odpowiedzi HTTP, które pojawiają się podczas testowania API w narzędziach takich jak Postman, Hoppscotch, Bruno albo Insomnia.

Status code mówi, czy request zakończył się sukcesem, błędem klienta, błędem serwera albo przekierowaniem.

---

# What is a status code?

HTTP status code to kod liczbowy zwracany przez serwer po wykonaniu requestu.

Po ludzku:

> Status code mówi, co stało się z requestem.

Przykład:

```http
GET https://jsonplaceholder.typicode.com/posts/1
```

Jeśli wszystko działa poprawnie, API zwraca:

```text
200 OK
```

To znaczy:

> Request się udał i serwer zwrócił dane.

---

# Main status code groups

## 1xx — Informational

Kody `100–199` oznaczają informacje techniczne.

Na poziomie podstaw SaaS Support zwykle nie są najważniejsze.

---

## 2xx — Success

Kody `200–299` oznaczają, że request zakończył się sukcesem.

Najważniejsze przykłady:

| Status code    | Meaning          | Simple explanation                             |
| -------------- | ---------------- | ---------------------------------------------- |
| 200 OK         | Success          | Request worked correctly.                      |
| 201 Created    | Created          | New resource was created.                      |
| 204 No Content | Success, no body | Request worked, but there is no response body. |

---

## 3xx — Redirect

Kody `300–399` oznaczają przekierowanie.

Przykład:

| Status code           | Meaning            | Simple explanation                                |
| --------------------- | ------------------ | ------------------------------------------------- |
| 301 Moved Permanently | Permanent redirect | Resource moved to a new URL.                      |
| 302 Found             | Temporary redirect | Resource is temporarily available somewhere else. |
| 304 Not Modified      | Cached response    | Client can use cached version.                    |

---

## 4xx — Client error

Kody `400–499` oznaczają, że problem jest prawdopodobnie po stronie requestu, klienta, adresu, danych albo uprawnień.

Najważniejsze przykłady:

| Status code               | Meaning           | Simple explanation                                            |
| ------------------------- | ----------------- | ------------------------------------------------------------- |
| 400 Bad Request           | Invalid request   | Request is wrong or malformed.                                |
| 401 Unauthorized          | Not authenticated | User/API client is not logged in or token is missing/invalid. |
| 403 Forbidden             | No permission     | User is known, but does not have access.                      |
| 404 Not Found             | Not found         | Endpoint or resource does not exist.                          |
| 405 Method Not Allowed    | Wrong method      | Endpoint exists, but this HTTP method is not allowed.         |
| 409 Conflict              | Conflict          | Request conflicts with current state of the resource.         |
| 422 Unprocessable Content | Validation error  | Data was understood but is invalid.                           |
| 429 Too Many Requests     | Rate limit        | Too many requests were sent.                                  |

---

## 5xx — Server error

Kody `500–599` oznaczają, że problem jest prawdopodobnie po stronie serwera lub systemu.

Najważniejsze przykłady:

| Status code               | Meaning             | Simple explanation                                           |
| ------------------------- | ------------------- | ------------------------------------------------------------ |
| 500 Internal Server Error | Server error        | Something failed on the server.                              |
| 502 Bad Gateway           | Bad gateway         | One server received an invalid response from another server. |
| 503 Service Unavailable   | Service unavailable | Server is temporarily unavailable.                           |
| 504 Gateway Timeout       | Timeout             | Server waited too long for another service.                  |

---

# Status codes used in my API exercise

## GET post by ID

Request:

```http
GET https://jsonplaceholder.typicode.com/posts/1
```

Expected response:

```text
200 OK
```

Meaning:

> The API returned the requested post successfully.

---

## GET comments for post

Request:

```http
GET https://jsonplaceholder.typicode.com/comments?postId=1
```

Expected response:

```text
200 OK
```

Meaning:

> The API returned comments connected to post ID 1.

---

## POST create post

Request:

```http
POST https://jsonplaceholder.typicode.com/posts
```

Example request body:

```json
{
  "title": "Support ticket test",
  "body": "Testing a POST request for SaaS support API basics.",
  "userId": 1
}
```

Expected response:

```text
201 Created
```

Meaning:

> The API accepted the request and simulated creating a new resource.

---

# SaaS Support examples

## Example 1 — 200 OK

A customer says an integration is not working.

Support sends a test request and receives:

```text
200 OK
```

This means the endpoint responded successfully.

Possible next action:

> Check whether the returned JSON contains the expected fields.

---

## Example 2 — 401 Unauthorized

A customer says their API integration stopped working.

API response:

```text
401 Unauthorized
```

Possible meaning:

> API key, token or authentication is missing, expired or invalid.

Possible next action:

> Ask the customer to check API credentials or regenerate the token.

---

## Example 3 — 403 Forbidden

API response:

```text
403 Forbidden
```

Possible meaning:

> The user or API token is recognized, but it does not have permission to access this resource.

Possible next action:

> Check user role, workspace permissions or API scope.

---

## Example 4 — 404 Not Found

API response:

```text
404 Not Found
```

Possible meaning:

> Endpoint is wrong or the requested resource does not exist.

Possible next action:

> Check the URL, resource ID and API documentation.

---

## Example 5 — 429 Too Many Requests

API response:

```text
429 Too Many Requests
```

Possible meaning:

> The client sent too many requests in a short time and hit the API rate limit.

Possible next action:

> Ask the customer to reduce request frequency or check rate limit documentation.

---

## Example 6 — 500 Internal Server Error

API response:

```text
500 Internal Server Error
```

Possible meaning:

> Something failed on the server side.

Possible next action:

> Check service status, logs and escalate to technical support or engineering if needed.

---

# Quick troubleshooting logic

## If status code starts with 2

The request probably worked.

Check:

* returned JSON,
* expected fields,
* data format,
* whether response matches customer expectations.

## If status code starts with 4

The request is probably wrong or the customer does not have access.

Check:

* URL,
* HTTP method,
* request body,
* headers,
* API key,
* token,
* permissions,
* resource ID.

## If status code starts with 5

The server or upstream service probably has a problem.

Check:

* service status page,
* logs,
* incident reports,
* whether other users are affected,
* whether escalation is needed.

---

# Portfolio note

I learned the basic HTTP status code groups used in API testing.

I practiced how to interpret successful responses, client errors and server errors in a SaaS Support context.

This is useful for Technical Support and SaaS Support roles because status codes help identify whether an API issue is related to the request, authentication, permissions, missing resources, rate limits or server-side failures.
