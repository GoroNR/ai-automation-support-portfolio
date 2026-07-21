# D18 — API Basics: GET Request in Postman

## Cel ćwiczenia

Celem tego ćwiczenia było wykonanie prostego requestu `GET` do publicznego API przy użyciu Postman Web.

Użyte API:

```text
JSONPlaceholder
```

Endpoint:

```text
https://jsonplaceholder.typicode.com/posts/1
```

---

# What is an API?

API, czyli **Application Programming Interface**, to sposób komunikacji między aplikacjami.

Po ludzku:

> API pozwala jednej aplikacji poprosić drugą aplikację o dane albo wykonanie konkretnej akcji.

Przykład:

Aplikacja supportowa może wysłać request do API, żeby pobrać dane klienta, sprawdzić status subskrypcji albo utworzyć nowe zgłoszenie.

---

# What is an HTTP request?

HTTP request to zapytanie wysyłane do serwera.

Request zwykle zawiera:

* HTTP method,
* endpoint URL,
* headers,
* optional body,
* optional parameters.

W tym ćwiczeniu użyłem metody:

```http
GET
```

---

# What is GET?

`GET` to metoda HTTP używana do pobierania danych.

Przykład:

```http
GET https://jsonplaceholder.typicode.com/posts/1
```

To oznacza:

> Pobierz dane posta o ID 1.

`GET` nie powinien zmieniać danych na serwerze. Służy tylko do odczytu.

---

# Request details

## Method

```http
GET
```

## URL

```text
https://jsonplaceholder.typicode.com/posts/1
```

## Tool

```text
Postman Web
```

## Authentication

```text
No authentication required
```

## Request body

```text
No body required for this GET request
```

---

# Response status code

Expected status code:

```text
200 OK
```

## What does 200 OK mean?

`200 OK` oznacza, że request został wykonany poprawnie i serwer zwrócił odpowiedź.

Po ludzku:

> API działa, endpoint istnieje, a serwer zwrócił dane.

---

# Response body example

Przykładowa odpowiedź JSON:

```json
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
```

---

# JSON fields explained

## userId

```json
"userId": 1
```

ID użytkownika, który jest autorem posta.

## id

```json
"id": 1
```

ID konkretnego posta.

## title

```json
"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
```

Tytuł posta.

## body

```json
"body": "..."
```

Treść posta.

---

# Screenshot

Screenshot file:

```text
03_sql_api/postman_get_posts_1.png
```

The screenshot should show:

* HTTP method: `GET`,
* request URL,
* status code: `200 OK`,
* JSON response body.

---

# Support / SaaS context

In SaaS Support, API basics are useful because support teams often need to understand how systems exchange data.

Examples:

* checking if an integration endpoint works,
* testing whether an API returns customer data,
* verifying status codes,
* reading JSON responses,
* collecting technical evidence before escalation.

---

# What I learned

In this exercise, I learned how to:

* send a basic `GET` request in Postman,
* use a public test API,
* check HTTP status code,
* read a JSON response,
* identify fields in the response body,
* document the request and response for portfolio purposes.

---

# Portfolio note

I used Postman Web to send a `GET` request to a public JSONPlaceholder API endpoint.

The request returned a successful `200 OK` response with JSON data containing `userId`, `id`, `title` and `body`.

This exercise demonstrates basic API testing skills useful for SaaS Support, Technical Support and Customer Operations roles.
