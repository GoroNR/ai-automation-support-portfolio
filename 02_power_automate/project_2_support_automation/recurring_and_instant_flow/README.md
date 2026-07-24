# Project 2 — Recurring and Instant Support Flows

## Exercise goal

The goal of this exercise was to practise scheduled cloud flows, instant cloud flows, triggers, actions and flow run history in Microsoft Power Automate.

## Scheduled flow

Flow name:

P2 - Scheduled Support Queue Check

Trigger:

- Recurrence
- Runs every day at 09:00 Bangkok time

Actions:

- Reads support tickets from an Excel Online table
- Sends a confirmation email after accessing the table

## Instant flow

Flow name:

P2 - Manual Test Ticket

Trigger:

- Manually trigger a flow

Inputs:

- Customer name
- Customer email
- Issue description
- Priority

Actions:

- Creates a new support ticket in an Excel table
- Sends an email confirmation

## Trigger vs action

A trigger starts the flow.

Examples used:

- Recurrence
- Manually trigger a flow

An action performs a task after the trigger starts the flow.

Examples used:

- List rows present in a table
- Add a row into a table
- Send an email (V2)

## What works

- The recurring flow starts according to its configured schedule.
- Power Automate successfully accesses the Excel Online table.
- The manual trigger accepts user input.
- The instant flow creates a new support ticket.
- The email confirmation is delivered.
- Successful runs are visible in flow run history.
- Inputs and outputs can be inspected for individual actions.

## What did not work

A controlled test failed after the Excel table name was changed from SupportTickets to WrongTable.

The flow run history showed that:

- The manual trigger succeeded.
- The Excel action failed.
- The email action did not run.

## Fix

The Excel action was corrected by selecting the existing SupportTickets table. After saving and testing the flow again, the complete run succeeded.

## Current limitations

- Priority is entered as free text.
- Empty input values are not yet validated.
- The scheduled flow confirms access to the table but does not yet generate a detailed open-ticket report.
- Error handling and automatic escalation will be added in later iterations.