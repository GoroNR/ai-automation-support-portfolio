Wklej to jako zawartość pliku:

`01_support_ticketing/saas_onboarding_checklist.md`

# SaaS Customer Onboarding Checklist

## Product overview

### Product name

```text
LeadNest CRM
```

### Product type

LeadNest CRM is a fictional SaaS platform designed for real estate agencies.

The platform helps agencies:

* collect leads from property portals, websites and advertising campaigns,
* assign leads to real estate agents,
* track communication with potential buyers and tenants,
* manage follow-up tasks,
* monitor lead status and conversion,
* reduce missed sales opportunities.

---

## Target customer

The typical customer is a small or medium-sized real estate agency with:

* 5–50 employees,
* multiple sales agents,
* leads coming from different sources,
* no consistent lead follow-up process,
* customer information stored across spreadsheets, email and messaging apps.

---

## Onboarding goal

The goal of onboarding is to help the customer configure the platform, import existing contacts, invite the team and process the first real lead successfully.

The onboarding process should lead to the customer’s first measurable success as quickly as possible.

### First success milestone

```text
The customer imports at least 20 contacts, invites at least 3 team members and successfully assigns and updates the status of the first real lead.
```

---

# Customer onboarding checklist

## 1. Account setup

### Goal

Create and configure the customer’s LeadNest CRM workspace.

### Checklist

* [ ] Create the company workspace.
* [ ] Confirm the company name.
* [ ] Confirm the main administrator.
* [ ] Add the company logo.
* [ ] Set the default language.
* [ ] Set the correct time zone.
* [ ] Confirm the billing email.
* [ ] Configure notification preferences.
* [ ] Confirm the subscription plan.
* [ ] Add the main company address and contact details.

### Required customer information

```text
Company name
Administrator name
Administrator email
Country
Time zone
Billing email
Number of expected users
```

### Definition of done

The customer can log in to the correct workspace and access the main dashboard.

---

## 2. Import contacts and existing leads

### Goal

Move existing customer and lead data into LeadNest CRM.

### Supported import format

```text
CSV or Excel file
```

### Recommended fields

```text
first_name
last_name
email
phone
lead_source
property_interest
assigned_agent
lead_status
last_contact_date
notes
```

### Checklist

* [ ] Ask the customer where existing contacts are currently stored.
* [ ] Provide the CSV import template.
* [ ] Remove duplicate contacts.
* [ ] Check that email and phone fields are formatted correctly.
* [ ] Map spreadsheet columns to CRM fields.
* [ ] Import a small test file first.
* [ ] Review the test import with the customer.
* [ ] Import the complete contact list.
* [ ] Confirm the number of imported records.
* [ ] Document any records that failed to import.

### Data protection check

Before importing data:

* confirm that the customer is allowed to store and process the contacts,
* avoid importing unnecessary sensitive information,
* do not store passwords, payment card data or identity documents in lead notes,
* confirm who should have access to customer records.

### Definition of done

At least 20 customer or lead records are visible in the CRM with correctly mapped information.

---

## 3. Configure user roles and permissions

### Goal

Give each team member the correct level of access.

### Suggested roles

#### Administrator

Can:

* manage the workspace,
* invite and remove users,
* configure integrations,
* edit permissions,
* access reports,
* manage billing settings.

#### Team Manager

Can:

* view team leads,
* assign leads,
* monitor agent performance,
* access team reports,
* update pipeline configuration.

#### Real Estate Agent

Can:

* view assigned leads,
* update lead status,
* add notes,
* schedule follow-ups,
* contact potential customers.

#### Read-only User

Can:

* view selected records,
* view reports,
* not edit or delete customer data.

### Checklist

* [ ] Identify the workspace administrator.
* [ ] Create the required user roles.
* [ ] Invite team members by email.
* [ ] Assign each user to the correct role.
* [ ] Confirm which users can view all leads.
* [ ] Confirm which users can export data.
* [ ] Confirm which users can delete records.
* [ ] Test access using a standard agent account.
* [ ] Remove unnecessary administrator permissions.

### Definition of done

At least three users have accepted their invitations and can access only the information required for their role.

---

## 4. Configure lead pipeline

### Goal

Create a clear process for moving leads through the sales journey.

### Suggested pipeline stages

```text
New lead
Contact attempted
Contacted
Viewing scheduled
Offer submitted
Negotiation
Won
Lost
```

### Checklist

* [ ] Review the customer’s current sales process.
* [ ] Create the required pipeline stages.
* [ ] Define when a lead should move to the next stage.
* [ ] Define required fields for important stages.
* [ ] Add lost-reason options.
* [ ] Confirm who can update lead stages.
* [ ] Create a test lead and move it through the pipeline.
* [ ] Confirm that the pipeline matches the agency’s real workflow.

### Definition of done

The customer can create a lead, assign it to an agent and move it through the agreed pipeline stages.

---

## 5. Configure integrations

### Goal

Connect LeadNest CRM with the tools used by the agency.

### Possible integrations

```text
Gmail or Outlook
Website contact forms
Facebook Lead Ads
Property portals
Google Calendar
Microsoft Outlook Calendar
Slack or Microsoft Teams
Zapier, Make or Power Automate
```

### Checklist

* [ ] Identify the customer’s most important lead sources.
* [ ] Connect the main email account.
* [ ] Connect the company website form.
* [ ] Connect the primary calendar.
* [ ] Connect supported advertising lead sources.
* [ ] Confirm that new leads enter the correct pipeline.
* [ ] Confirm that duplicate leads are handled correctly.
* [ ] Test one lead from each connected source.
* [ ] Document any unsupported integration.
* [ ] Provide a manual or no-code workaround if necessary.

### Integration test

Use one test lead:

```text
Name: Test Customer
Email: test.customer@example.com
Lead source: Website form
Property interest: Two-bedroom apartment
```

Expected result:

```text
The lead appears in LeadNest CRM, enters the New lead stage and is assigned to the correct agent.
```

### Definition of done

At least one important lead source is connected and a test lead is received successfully.

---

## 6. Team training

### Goal

Make sure users understand the basic daily workflow.

### Training topics

* logging in,
* finding assigned leads,
* creating a new lead,
* updating customer information,
* changing lead status,
* adding notes,
* scheduling follow-up tasks,
* using filters,
* searching for contacts,
* reporting a technical issue,
* protecting customer data.

### Suggested training format

```text
45-minute live onboarding session
15-minute questions and answers
Short written quick-start guide
```

### Checklist

* [ ] Schedule the training session.
* [ ] Confirm who should attend.
* [ ] Use the customer’s real workflow during the demo.
* [ ] Show how to create and assign a lead.
* [ ] Show how to update lead status.
* [ ] Show how to schedule a follow-up.
* [ ] Show how managers can monitor pipeline activity.
* [ ] Explain how to contact support.
* [ ] Record unanswered questions.
* [ ] Send training materials after the session.

### Definition of done

The administrator and core users can complete the basic workflow without assistance.

---

## 7. First success metric

### Goal

Confirm that the customer has reached initial value.

### Primary first success metric

```text
The customer successfully processes the first real lead from creation or import to agent assignment and follow-up.
```

### Supporting metrics

* at least 20 contacts imported,
* at least 3 active users,
* at least 1 integration connected,
* at least 1 real lead assigned,
* at least 1 follow-up task created,
* at least 1 lead status updated,
* no unresolved onboarding blocker.

### Checklist

* [ ] Confirm the number of imported contacts.
* [ ] Confirm the number of active users.
* [ ] Confirm that the main integration works.
* [ ] Confirm that the first real lead was created or received.
* [ ] Confirm that the lead was assigned.
* [ ] Confirm that an agent added a note or follow-up task.
* [ ] Ask the customer whether the workflow is clear.
* [ ] Record any remaining blockers.

### Definition of done

The customer has completed one complete lead-management workflow and understands how the product supports daily work.

---

# Welcome email

## Subject

```text
Welcome to LeadNest CRM — next steps for your onboarding
```

## Email body

Hi {{customer_name}},

Welcome to LeadNest CRM. We’re glad to have {{company_name}} on board.

During onboarding, we’ll help you configure your workspace, import existing contacts, invite your team, connect your main lead sources and process your first real lead.

To get started, please prepare:

* the names and email addresses of the users you want to invite,
* a CSV or Excel file with your existing contacts,
* information about your current lead pipeline,
* details of the tools or lead sources you want to connect.

Our first onboarding session is scheduled for:

```text
{{onboarding_date_and_time}}
```

The initial goal is to help your team import at least 20 contacts, invite three users and successfully assign and follow up on the first lead.

Please let me know if there are any specific workflows or technical requirements you would like us to review during the session.

Best,
Adrian
Customer Onboarding Specialist
LeadNest CRM

---

# Seven-day follow-up plan

## Day 0 — Welcome and preparation

### Actions

* send the welcome email,
* confirm the administrator,
* schedule the onboarding call,
* request the contact import file,
* request the list of users,
* ask about the current lead process,
* identify required integrations.

### Expected outcome

The customer knows what information to prepare and when onboarding will begin.

---

## Day 1 — Workspace configuration

### Actions

* configure company settings,
* confirm time zone and language,
* confirm billing contact,
* create user roles,
* invite the administrator and core users.

### Customer check-in

```text
Were you able to log in successfully, and can all invited users access the correct workspace?
```

### Expected outcome

The workspace is active and the administrator can access the main settings.

---

## Day 2 — Contact import

### Actions

* review the import file,
* check field formatting,
* remove obvious duplicates,
* run a test import,
* confirm field mapping,
* complete the full import.

### Customer check-in

```text
Please review several imported records and confirm that names, email addresses, phone numbers and lead sources appear correctly.
```

### Expected outcome

Existing contacts and leads are available in the CRM.

---

## Day 3 — Pipeline and permissions

### Actions

* configure lead pipeline stages,
* define lost reasons,
* assign user roles,
* verify agent access,
* test lead assignment.

### Customer check-in

```text
Does the pipeline reflect the stages your team currently uses when working with buyers, tenants and property owners?
```

### Expected outcome

The team has a clear lead-management process and correct access levels.

---

## Day 4 — Integrations

### Actions

* connect the main email account,
* connect the website form or another lead source,
* connect the calendar,
* send one test lead,
* check whether automation and routing work correctly.

### Customer check-in

```text
Did the test lead appear in the correct pipeline and reach the expected agent?
```

### Expected outcome

At least one real lead source sends data into LeadNest CRM successfully.

---

## Day 5 — Team training

### Actions

* conduct a live training session,
* demonstrate lead creation,
* demonstrate lead assignment,
* demonstrate notes and follow-ups,
* demonstrate pipeline updates,
* explain support channels,
* send the quick-start guide.

### Customer check-in

```text
Which part of the workflow is still unclear or requires additional training?
```

### Expected outcome

Core users understand how to complete their daily tasks.

---

## Day 6 — First real workflow

### Actions

* ask the customer to process one real lead,
* confirm lead assignment,
* confirm that an agent contacted the lead,
* confirm that a follow-up task was created,
* verify that the lead status was updated,
* record any blocker.

### Customer check-in

```text
Was your team able to process the first real lead without assistance?
```

### Expected outcome

The customer completes the first end-to-end workflow.

---

## Day 7 — Onboarding review

### Actions

* review onboarding progress,
* check product usage,
* confirm active users,
* review open support tickets,
* identify missing integrations,
* document remaining tasks,
* agree on the next success milestone.

### Review questions

1. Were you able to import your contacts successfully?
2. Can all required users access the workspace?
3. Does the pipeline match your sales process?
4. Are your most important lead sources connected?
5. Has your team processed the first real lead?
6. Are there any blockers affecting daily use?
7. What result would you like to achieve during the next 30 days?

### Expected outcome

The first onboarding phase is completed, remaining risks are documented and the customer has a clear next goal.

---

# Onboarding status tracker

| Area           | Status                                | Owner                 | Next action              |
| -------------- | ------------------------------------- | --------------------- | ------------------------ |
| Account setup  | Not started / In progress / Completed | Customer / Onboarding | Confirm company settings |
| Contact import | Not started / In progress / Completed | Customer / Onboarding | Review import file       |
| User roles     | Not started / In progress / Completed | Administrator         | Invite users             |
| Pipeline       | Not started / In progress / Completed | Customer / Onboarding | Confirm stages           |
| Integrations   | Not started / In progress / Completed | Technical Support     | Run test lead            |
| Training       | Not started / In progress / Completed | Onboarding            | Schedule session         |
| First success  | Not started / In progress / Completed | Customer Success      | Process first real lead  |

---

# Risks and mitigation

## Poor data quality

**Risk:**
The customer imports duplicate, incomplete or incorrectly formatted contacts.

**Mitigation:**
Run a small test import and review data before importing the complete file.

## Incorrect permissions

**Risk:**
Users receive unnecessary access to customer data or administrative settings.

**Mitigation:**
Use role-based permissions and test access using a standard agent account.

## Low product adoption

**Risk:**
The customer completes setup but the team does not use the platform.

**Mitigation:**
Define a first success metric, monitor active users and follow up during the first seven days.

## Integration failure

**Risk:**
Leads from the website or advertising platforms do not reach the CRM.

**Mitigation:**
Test each important lead source and document a manual fallback process.

## Unclear ownership

**Risk:**
The customer does not know who is responsible for completing onboarding tasks.

**Mitigation:**
Assign an owner and next action to each onboarding area.

---

# What I learned

In this exercise, I learned how to:

* design a SaaS customer onboarding process,
* define the customer’s first success milestone,
* prepare account and data configuration checklists,
* plan user roles and permissions,
* test integrations,
* organize customer training,
* create a welcome email,
* prepare a structured seven-day follow-up plan,
* identify onboarding risks and mitigation actions.

---

# Portfolio summary

I created a complete customer onboarding checklist for a fictional real estate lead-management SaaS product.

The artifact covers account setup, contact import, user permissions, lead pipeline configuration, integrations, team training and the customer’s first success metric.

It also includes a professional welcome email, a seven-day follow-up plan, an onboarding status tracker and risk mitigation steps.
