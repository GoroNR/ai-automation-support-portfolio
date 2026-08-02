# D20 — API Troubleshooting Ticket

## Cel artefaktu

Celem tego ćwiczenia jest pokazanie, jak podejść do prostego zgłoszenia technicznego dotyczącego API/integracji.

Scenariusz:

> Klient zgłasza, że jego integracja przestała działać i API zwraca błąd `401 Unauthorized` albo `404 Not Found`.

---

# 1. Fictional support ticket

## Ticket ID

API-001

## Category

integration

## Priority

high

## Status

new

## Customer message

Hi Support,

Our CRM integration stopped working this morning. When our system tries to send data to your API, we receive an error.

Sometimes we get:

```text
401 Unauthorized
```

and sometimes:

```text
404 Not Found
```

This integration is used by our sales team to sync new leads, so we need help as soon as possible.

Best,
Customer

---

# 2. Problem summary

The customer reports that their CRM integration stopped working and API requests are returning `401 Unauthorized` or `404 Not Found`.

The integration is business-critical because it syncs new leads for the sales team.

---

# 3. Impact

## Customer impact

The sales team cannot sync new leads from the CRM integration.

## Business impact

New leads may not appear in the customer’s workflow, which can delay sales follow-up.

## Priority reason

Priority is `high` because the issue affects an active business workflow and may block the customer’s sales process.

---

# 4. Status codes explained

## 401 Unauthorized

`401 Unauthorized` usually means there is an authentication problem.

Possible causes:

* missing API key,
* expired API token,
* invalid token,
* wrong authorization header,
* customer is using old credentials,
* integration lost access after a password/token change.

## 404 Not Found

`404 Not Found` usually means the requested endpoint or resource does not exist.

Possible causes:

* wrong endpoint URL,
* typo in the API path,
* incorrect resource ID,
* outdated API version,
* deleted or unavailable resource,
* using a production URL instead of sandbox URL, or the opposite.

---

# 5. Diagnostic questions

## Questions about 401 Unauthorized

1. When did the integration last work correctly?
2. Was the API key or token changed recently?
3. Was the user password changed recently?
4. Is the API key still active?
5. Is the token expired?
6. Are you sending the authorization header with every request?
7. Are you using the correct environment: production or sandbox?
8. Can you confirm the exact authorization format used in the request?

Example header:

```http
Authorization: Bearer YOUR_API_TOKEN
```

---

## Questions about 404 Not Found

1. What exact endpoint URL are you calling?
2. Did the endpoint URL change recently?
3. Are you using the correct API version?
4. Are you using the correct resource ID?
5. Does the resource still exist in your account?
6. Are you calling a production endpoint with sandbox data?
7. Are you calling a sandbox endpoint with production data?
8. Can you send the full request path without sensitive credentials?

---

## General troubleshooting questions

1. Can you send the exact timestamp of the failed request?
2. Can you provide a screenshot or copied response body?
3. Does the issue happen for all requests or only specific records?
4. Did anything change in the CRM, API settings, tokens or permissions?
5. Are other integrations working correctly?
6. Is this issue affecting all users or only one workspace/account?

---

# 6. How to check the endpoint in Postman

## Step 1 — Create a new request

Open Postman or another API client such as Hoppscotch, Bruno or Insomnia.

Create a new HTTP request.

---

## Step 2 — Choose the method

Choose the same HTTP method used by the customer’s integration.

Examples:

```http
GET
POST
PUT
PATCH
DELETE
```

For checking whether an endpoint exists, start with `GET` if the API documentation allows it.

---

## Step 3 — Enter the endpoint URL

Example:

```text
https://api.example-saas.com/v1/leads
```

Check carefully:

* base URL,
* API version,
* endpoint path,
* resource ID,
* query parameters.

---

## Step 4 — Add authorization

If the API requires a bearer token, add the header:

```http
Authorization: Bearer YOUR_API_TOKEN
```

In Postman this can be done in:

```text
Authorization → Type → Bearer Token
```

or manually in:

```text
Headers
```

---

## Step 5 — Add request body if needed

For `POST`, `PUT` or `PATCH`, add a JSON body.

Example:

```json
{
  "name": "Test Lead",
  "email": "test@example.com",
  "source": "CRM"
}
```

For `GET`, a body is usually not required.

---

## Step 6 — Send the request

Click:

```text
Send
```

Then check:

* status code,
* response body,
* response headers,
* error message,
* request URL,
* request method.

---

# 7. How to interpret the result

## If Postman returns 200 OK

The endpoint works and the request was successful.

Next action:

* compare Postman request with the customer’s integration request,
* check if the CRM sends different headers, body or URL,
* check if the problem is inside the CRM integration configuration.

---

## If Postman returns 401 Unauthorized

Authentication failed.

Next action:

* verify API token,
* check if token expired,
* confirm authorization header,
* regenerate API key if needed,
* check account permissions.

---

## If Postman returns 404 Not Found

Endpoint or resource was not found.

Next action:

* verify endpoint URL,
* check API version,
* check resource ID,
* confirm production/sandbox environment,
* compare with API documentation.

---

## If Postman returns 500 Internal Server Error

The issue may be on the server side.

Next action:

* check service status,
* check logs,
* test again later,
* escalate to L2 Technical Support or Engineering with request details.

---

# 8. Notes for escalation

If the issue cannot be solved by L1 Support, escalate with:

* customer account/company,
* exact endpoint URL,
* HTTP method,
* status code,
* timestamp,
* request ID if available,
* environment: production or sandbox,
* response body,
* headers without sensitive tokens,
* steps already tested,
* business impact.

---

# 9. Customer reply — English

Hi,

Thanks for reaching out. I’m sorry your CRM integration is not working correctly.

The `401 Unauthorized` response usually points to an authentication issue, such as a missing, expired or invalid API token. The `404 Not Found` response usually means that the endpoint URL, API version or resource ID may be incorrect or no longer available.

To investigate this further, could you please confirm:

1. When did the integration last work correctly?
2. Was the API key, token, CRM configuration or endpoint URL changed recently?
3. Which exact endpoint URL are you calling?
4. Are you using the production or sandbox environment?
5. Does the issue happen for all requests or only specific records?
6. Can you share the response body and timestamp of one failed request?

Please do not send the full API token. If needed, you can share only the first and last few characters so we can identify which credential is being used.

In the meantime, I’ll check whether there are any known API or integration issues on our side. Once we have the request details, we can verify whether the problem is related to authentication, endpoint configuration or a missing resource.

Best,
Adrian

---

# 10. Final support note

This ticket should not be closed until:

* the customer confirms the exact endpoint,
* authentication method is verified,
* production/sandbox environment is confirmed,
* one failed request is reviewed,
* the customer confirms whether the integration works again.

---

# Portfolio note

I created a fictional API troubleshooting ticket for a SaaS integration issue involving `401 Unauthorized` and `404 Not Found` responses.

The exercise includes diagnostic questions, Postman troubleshooting steps, status code interpretation, escalation notes and a professional customer reply.

This demonstrates basic API troubleshooting skills useful for SaaS Support, Technical Support and Customer Operations roles.
