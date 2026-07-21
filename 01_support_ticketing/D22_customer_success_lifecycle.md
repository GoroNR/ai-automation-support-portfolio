# D22 — Customer Success Lifecycle

## Cel ćwiczenia

Celem tego artefaktu jest zrozumienie całej drogi klienta w firmie SaaS — od pierwszego kontaktu ze sprzedażą, przez onboarding i korzystanie z produktu, aż do odnowienia subskrypcji.

Customer Support zajmuje się głównie konkretnymi problemami i ticketami.

Customer Success patrzy szerzej na całą relację z klientem, wykorzystanie produktu, osiągane rezultaty, ryzyko odejścia i możliwość odnowienia współpracy.

---

# Najważniejsze pojęcia

## Customer journey

Customer journey to cała droga klienta i wszystkie jego kontakty z firmą.

Może obejmować:

```text
Prospect
→ Sales
→ Purchase
→ Onboarding
→ Product adoption
→ Support
→ Renewal
→ Expansion or churn
```

Customer journey pomaga zrozumieć:

* czego klient potrzebuje na każdym etapie,
* gdzie pojawiają się problemy,
* jakie zespoły odpowiadają za klienta,
* co może zatrzymać klienta przed osiągnięciem celu.

---

## Prospect

Prospect to potencjalny klient, który jeszcze nie kupił produktu.

Na tym etapie firma próbuje zrozumieć:

* jaki problem ma potencjalny klient,
* czy produkt jest dla niego odpowiedni,
* kto podejmuje decyzję zakupową,
* jakie rezultaty chce osiągnąć.

Typowi właściciele etapu:

```text
Marketing
Sales
```

---

## Customer

Prospect staje się customerem po zakupie produktu lub rozpoczęciu płatnej subskrypcji.

W CRM klient może być zapisany jako:

```text
contact
company
account
deal marked as closed won
```

Po sprzedaży informacje o kliencie powinny zostać przekazane do zespołu odpowiedzialnego za onboarding i Customer Success.

---

## Onboarding

Onboarding to proces wdrożenia nowego klienta.

Jego celem jest doprowadzenie klienta do pierwszej wartości z produktu możliwie szybko.

Przykładowe działania:

* utworzenie konta,
* konfiguracja użytkowników,
* import danych,
* połączenie integracji,
* prezentacja najważniejszych funkcji,
* ustalenie celów klienta,
* szkolenie administratora lub zespołu.

Dobry onboarding odpowiada na pytanie:

> Co musi się wydarzyć, żeby klient zaczął realnie korzystać z produktu?

---

## Adoption

Adoption oznacza, że klient nie tylko ma konto, ale rzeczywiście korzysta z produktu i jego najważniejszych funkcji.

Przykładowe sygnały adopcji:

* regularne logowania,
* aktywni użytkownicy,
* używanie kluczowych funkcji,
* ukończenie konfiguracji,
* korzystanie z integracji,
* osiągnięcie pierwszego mierzalnego rezultatu.

Niska adopcja może oznaczać, że klient:

* nie rozumie produktu,
* nie skonfigurował systemu,
* nie przeszkolił zespołu,
* nie widzi wartości,
* może zrezygnować z subskrypcji.

---

## Support

Customer Support pomaga klientowi rozwiązywać konkretne pytania i problemy.

Przykłady:

* użytkownik nie może się zalogować,
* integracja zwraca błąd,
* faktura jest nieprawidłowa,
* eksport danych nie działa,
* użytkownik nie wie, jak skonfigurować funkcję.

Support działa głównie na poziomie pojedynczego zgłoszenia.

Przykładowy proces:

```text
Ticket created
→ Triage
→ Troubleshooting
→ Resolution or escalation
→ Follow-up
```

Support może pojawić się na każdym etapie customer journey, a nie tylko po zakończeniu onboardingu.

---

## Ticket vs account

### Ticket

Ticket reprezentuje pojedynczy problem, pytanie lub prośbę klienta.

Przykład:

```text
User cannot connect the Slack integration.
```

Ticket zawiera zwykle:

```text
ticket_id
category
priority
status
summary
owner
next_action
```

### Account

Account reprezentuje całą relację z klientem lub firmą.

Przykład:

```text
Company: Example SaaS Ltd.
Plan: Enterprise
Users: 120
Renewal date: 30 September
Health status: At risk
Open tickets: 4
```

Jeden account może mieć wiele kontaktów i wiele ticketów.

### Najważniejsza różnica

```text
Ticket = pojedyncza sprawa
Account = cała relacja z klientem
```

Support może rozwiązać jeden ticket, ale Customer Success powinien sprawdzić, czy wiele podobnych ticketów nie oznacza większego problemu z całym accountem.

---

## Retention

Retention oznacza utrzymanie obecnych klientów.

Klient pozostaje z firmą, ponieważ:

* produkt daje mu wartość,
* korzysta z kluczowych funkcji,
* problemy są rozwiązywane,
* zespół rozumie jego cele,
* cena jest uzasadniona rezultatami.

Retention nie oznacza tylko zatrzymania rezygnacji. Oznacza regularne pomaganie klientowi w osiąganiu wartości.

---

## Churn

Churn oznacza utratę klienta lub zakończenie przez niego subskrypcji.

Możliwe przyczyny:

* brak wartości z produktu,
* słaby onboarding,
* niska adopcja,
* częste problemy techniczne,
* brak odpowiedniej funkcji,
* wysoka cena,
* zmiana sytuacji klienta,
* konkurencyjne rozwiązanie.

Wysoki churn oznacza, że firma traci dużą liczbę obecnych klientów.

---

## Customer health

Customer health to ogólna ocena kondycji relacji z klientem.

Może być prezentowana jako:

```text
Healthy
Needs attention
At risk
```

Albo jako wynik liczbowy:

```text
Customer health score: 78/100
```

Przykładowe dane wykorzystywane do oceny:

* częstotliwość logowania,
* liczba aktywnych użytkowników,
* wykorzystanie najważniejszych funkcji,
* liczba otwartych ticketów,
* priorytet ticketów,
* czas rozwiązania problemów,
* wyniki CSAT lub NPS,
* kontakt z Customer Success,
* zbliżająca się data odnowienia.

Przykład:

```text
Regular product usage + few support issues + positive feedback
= healthy account
```

```text
Falling usage + unresolved high-priority tickets + renewal soon
= account at risk
```

Customer health nie powinno być oceniane wyłącznie na podstawie jednego ticketu.

---

## Renewal

Renewal oznacza przedłużenie subskrypcji lub umowy.

Przed odnowieniem Customer Success powinien sprawdzić:

* czy klient korzysta z produktu,
* czy osiągnął zakładane rezultaty,
* czy ma nierozwiązane problemy,
* jaki jest jego customer health,
* czy istnieje ryzyko churnu,
* czy potrzebuje dodatkowego szkolenia lub wsparcia.

Dobry proces odnowienia zaczyna się wcześniej, a nie dopiero kilka dni przed zakończeniem umowy.

---

# Customer lifecycle map

```text
┌──────────────┐
│   PROSPECT   │
│ Potential    │
│ customer     │
└──────┬───────┘
       │ Sales qualification
       ▼
┌──────────────┐
│   CUSTOMER   │
│ Purchase or  │
│ subscription │
└──────┬───────┘
       │ Sales-to-CS handoff
       ▼
┌──────────────┐
│  ONBOARDING  │
│ Setup and    │
│ first value  │
└──────┬───────┘
       │ Configuration completed
       ▼
┌──────────────┐
│   ADOPTION   │
│ Regular use  │
│ and outcomes │
└──────┬───────┘
       │ Questions and problems
       ▼
┌──────────────┐
│   SUPPORT    │
│ Tickets and  │
│ resolutions  │
└──────┬───────┘
       │ Value confirmed
       ▼
┌──────────────┐
│   RENEWAL    │
│ Continue,    │
│ expand or    │
│ churn        │
└──────────────┘
```

---

# Lifecycle table

| Stage      | Customer goal                       | Company responsibility            | Main risk                  | Example data                    |
| ---------- | ----------------------------------- | --------------------------------- | -------------------------- | ------------------------------- |
| Prospect   | Understand whether the product fits | Qualify needs and explain value   | Poor product fit           | Lead source, company, use case  |
| Customer   | Start the relationship              | Complete handoff after purchase   | Missing customer context   | Plan, contract, goals           |
| Onboarding | Configure the product               | Guide setup and training          | Slow time-to-value         | Setup completion, users invited |
| Adoption   | Use the product successfully        | Track usage and remove blockers   | Low product usage          | Logins, feature usage           |
| Support    | Resolve questions and problems      | Triage and troubleshoot tickets   | Unresolved critical issues | Tickets, SLA, CSAT              |
| Renewal    | Decide whether to continue          | Demonstrate value and manage risk | Churn                      | Health score, renewal date      |

---

# Example SaaS customer journey

## Prospect

A company is looking for a support ticket management system.

## Customer

The company purchases a Pro subscription.

## Onboarding

The customer imports users, configures email forwarding and creates ticket categories.

## Adoption

The support team begins using the platform every day and creates reports.

## Support

The customer reports that the Slack integration has stopped working.

## Resolution

Technical Support identifies an expired integration token and helps reconnect Slack.

## Renewal

Customer Success reviews usage, resolved problems and business outcomes before the subscription renewal date.

---

# Practical relationship between Support and Customer Success

Customer Support focuses on:

```text
What problem does the customer have right now?
```

Customer Success focuses on:

```text
Is the customer receiving long-term value and likely to renew?
```

The teams should share information.

Example:

```text
Three high-priority integration tickets in one month
→ Support resolves individual problems
→ Customer Success reviews overall account risk
→ Additional training or technical review is arranged
```

---

# What I learned

In this exercise, I learned:

* how the customer lifecycle works in a SaaS company,
* the difference between a ticket and an account,
* the purpose of onboarding and product adoption,
* how retention differs from churn,
* how customer health can help identify risk,
* how Support and Customer Success cooperate,
* why renewal preparation should begin before the contract end date.

---

# Portfolio summary

I created a SaaS customer lifecycle map covering the complete journey from prospect to customer, onboarding, adoption, support and renewal.

The artifact explains the difference between ticket-level support and account-level Customer Success, as well as the role of customer health, retention and churn in managing long-term customer relationships.
