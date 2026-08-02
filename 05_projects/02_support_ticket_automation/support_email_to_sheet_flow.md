# Support Email to Excel Flow

## Project goal

The goal of this project was to create a Power Automate cloud flow that automatically captures support emails in an Excel table.

The workflow detects incoming emails with the keyword `SUPPORT` in the subject and creates a new ticket-like row in Excel.

---

## Workflow overview

```text
Incoming Outlook email
→ Subject contains SUPPORT
→ Add a new row to an Excel table
```

---

## Tools used

* Microsoft Power Automate
* Office 365 Outlook
* Excel Online (Business)
* OneDrive for Business

---

## Trigger

```text
When a new email arrives (V3)
```

The trigger monitors the Outlook inbox for new messages.

### Trigger filter

```text
Subject Filter: SUPPORT
```

Only messages with `SUPPORT` in the subject are processed by the flow.

---

## Excel workbook

### File

```text
Support_Email_Tickets.xlsx
```

### Table name

```text
SupportEmails
```

### Table columns

```text
received_at
sender_email
subject
body_preview
category
priority
status
```

---

## Action

```text
Excel Online (Business) — Add a row into a table
```

The action adds information from the incoming email to the `SupportEmails` table.

---

## Field mapping

| Excel column | Power Automate value |
| ------------ | -------------------- |
| received_at  | Received time        |
| sender_email | From (Address)       |
| subject      | Subject              |
| body_preview | Body preview         |
| category     | email                |
| priority     | medium               |
| status       | new                  |

---

## Test email

### Subject

```text
SUPPORT - Cannot log in after password reset
```

### Body

```text
Hi Support,

I cannot log in after resetting my password. The system shows an invalid credentials error.

Best,
Test Customer
```

---

## Expected result

After the email is received, Power Automate creates a new row in Excel containing:

* received date and time,
* sender email address,
* email subject,
* body preview,
* default category,
* default priority,
* ticket status.

Example:

```text
sender_email: adekbrych3@gmail.com
subject: SUPPORT - Cannot log in after password reset
category: email
priority: medium
status: new
```

---

## Screenshot

```text
02_power_automate/support_email_to_sheet_flow.png
```

The screenshot shows the successful Power Automate flow:

```text
When a new email arrives (V3)
→ Add a row into a table
```

Optional result screenshot:

```text
02_power_automate/support_email_to_sheet_result.png
```

---

## Troubleshooting

If the Excel table is not visible in Power Automate:

1. Confirm that the workbook is stored in OneDrive for Business.
2. Confirm that the data range is formatted as an Excel table.
3. Confirm that the table is named `SupportEmails`.
4. Save and close the workbook.
5. Refresh the Excel action in Power Automate.

If the Outlook or Excel connection fails:

1. Open the connection settings.
2. Sign in again with the Microsoft work account.
3. Confirm that the account has access to the workbook.
4. Test the flow again.

---

## Manual fallback

If the Excel connector is unavailable, the process can be documented manually:

1. Receive a test email with `SUPPORT` in the subject.
2. Copy the email information into the Excel table.
3. Document the intended trigger, mapping and output.
4. Record the connector limitation in the project description.

This fallback demonstrates understanding of the workflow logic, but it does not prove that the automation was executed successfully.

---

## What I learned

In this project, I learned how to:

* use an Outlook email trigger,
* filter incoming messages by subject,
* connect Power Automate to Excel Online,
* add rows automatically to an Excel table,
* map dynamic email data to spreadsheet columns,
* test and troubleshoot a cloud flow.

---

## SaaS Support use case

This type of workflow can be used to create a simple support ticket register from an email inbox.

It can help a support team:

* capture incoming customer requests,
* avoid manually copying email details,
* create a structured ticket log,
* prepare data for reporting and triage,
* reduce repetitive administrative work.

---

## Portfolio summary

I created a Power Automate cloud flow that monitors an Outlook inbox for emails containing `SUPPORT` in the subject.

When a matching email arrives, the flow automatically adds a new row to an Excel table with the sender, subject, body preview, timestamp, category, priority and status.

This project demonstrates practical knowledge of triggers, connectors, dynamic content, field mapping, automated data entry and basic workflow troubleshooting.
