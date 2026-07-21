# Networking Fundamentals for IT Support

## Project goal

The goal of this study artifact is to understand the networking concepts most useful in entry-level IT Support and SaaS Technical Support.

The material was selected from Course 2 of the Google IT Support Professional Certificate:

**The Bits and Bytes of Computer Networking**

Instead of completing the entire course in one day, I focused on the five-layer network model, TCP/IP, DNS, DHCP, routing, cloud computing and practical troubleshooting tools.

---

## Selected learning path

Approximate selected video time: **88 minutes**

### Module 1 — Introduction to Networking

- [ ] The TCP/IP Five-Layer Network Model — 5 minutes
- [ ] Routers — 2 minutes

### Module 2 — The Network Layer

- [ ] IPv4 Addresses — 3 minutes
- [ ] Basic Routing Concepts — 8 minutes
- [ ] Routing Tables — 3 minutes

### Module 3 — The Transport and Application Layers

- [ ] The Transport Layer — 3 minutes
- [ ] TCP Control Flags and the Three-way Handshake — 6 minutes
- [ ] The Application Layer — 3 minutes
- [ ] All the Layers Working in Unison — 11 minutes

### Module 4 — Networking Services

- [ ] Why Do We Need DNS? — 3 minutes
- [ ] The Many Steps of Name Resolution — 8 minutes
- [ ] Overview of DHCP — 5 minutes
- [ ] DHCP in Action — 5 minutes

### Module 6 — Troubleshooting and the Future of Networking

- [ ] Ping: Internet Control Message Protocol — 5 minutes
- [ ] Traceroute — 3 minutes
- [ ] Testing Port Connectivity — 2 minutes
- [ ] Name Resolution Tools — 2 minutes
- [ ] What Is the Cloud? — 6 minutes
- [ ] Everything as a Service — 3 minutes
- [ ] Cloud Storage — 2 minutes

---

# The five-layer network model

The five-layer model helps describe how data travels between applications and physical network devices.

| Layer | Main responsibility | Examples |
|---|---|---|
| Application | Provides network services to applications | HTTP, HTTPS, DNS, SMTP |
| Transport | Manages communication between applications | TCP, UDP, ports |
| Network | Moves packets between different networks | IP addresses, routers, routing |
| Data Link | Transfers frames inside a local network | Ethernet, Wi-Fi, MAC addresses |
| Physical | Transmits bits through physical media | Cables, radio signals, network ports |

Each layer performs a different task, but the layers work together.

## Example: opening a website

```text
User enters a domain name
→ DNS resolves the name to an IP address
→ TCP establishes communication with the server
→ IP packets are routed across networks
→ Ethernet or Wi-Fi carries frames through the local network
→ Physical signals transmit the data
```

The response travels back through the same layers in the opposite direction.

---

# TCP/IP fundamentals

TCP/IP is a collection of protocols used for communication across computer networks and the Internet.

## Internet Protocol

IP is responsible for addressing and routing packets.

Important concepts:

```text
source IP address
destination IP address
subnet mask
default gateway
routing table
```

IP does not guarantee that every packet will arrive successfully or in the correct order.

## Transmission Control Protocol

TCP provides connection-oriented communication.

TCP can:

- establish a connection,
- track transmitted data,
- retransmit missing data,
- maintain the correct order,
- close the connection.

## TCP three-way handshake

```text
Client → SYN → Server
Client ← SYN-ACK ← Server
Client → ACK → Server
```

After the handshake, application data can be exchanged.

## TCP and UDP

| TCP | UDP |
|---|---|
| Connection-oriented | Connectionless |
| Reliable delivery | No delivery guarantee |
| Maintains packet order | Lower overhead |
| Used when accuracy matters | Used when speed matters |

Common examples:

```text
HTTPS → usually TCP port 443
HTTP → usually TCP port 80
DNS → often UDP port 53
```

---

# IP addressing and routing

## IPv4 address

An IPv4 address identifies a device interface on an IP network.

Example:

```text
192.168.1.25
```

Private IPv4 address ranges are commonly used inside local networks.

A public IP address is used to communicate across the Internet.

## Subnet mask

The subnet mask helps determine which part of an IP address represents the network and which part represents the host.

Example:

```text
IP address: 192.168.1.25
Subnet mask: 255.255.255.0
```

Devices in the same subnet can normally communicate locally.

Traffic intended for another network is sent to the default gateway.

## Default gateway

The default gateway is usually a router that forwards traffic outside the local network.

Example:

```text
Computer: 192.168.1.25
Gateway: 192.168.1.1
```

## Routing table

A routing table contains rules that tell a device where packets should be sent.

A route may contain:

```text
destination network
subnet mask or prefix
next hop
network interface
route metric
```

When no more specific route exists, traffic normally uses the default route.

---

# DNS

DNS stands for Domain Name System.

DNS translates human-readable domain names into IP addresses.

Example:

```text
app.example.com
→ DNS lookup
→ 203.0.113.20
```

Without DNS, users would need to remember IP addresses instead of domain names.

## Common DNS records

| Record | Purpose |
|---|---|
| A | Maps a name to an IPv4 address |
| AAAA | Maps a name to an IPv6 address |
| CNAME | Creates an alias to another hostname |
| MX | Identifies mail servers |
| TXT | Stores text used for verification or policies |

## Simplified name-resolution process

```text
User requests app.example.com
→ Device checks local cache
→ Request goes to a DNS resolver
→ Resolver finds the appropriate DNS records
→ IP address is returned
→ Device connects to the destination server
```

## Typical DNS problem

Symptom:

```text
The website works when using an IP address,
but it does not work when using the domain name.
```

Likely area:

```text
DNS resolution
```

Useful tools:

```text
nslookup
dig
ipconfig /flushdns
```

---

# DHCP

DHCP stands for Dynamic Host Configuration Protocol.

DHCP automatically provides network configuration to devices.

The configuration can include:

```text
IP address
subnet mask
default gateway
DNS server
lease duration
```

Without DHCP, network settings would often need to be configured manually.

## DHCP lease process

The basic process is commonly remembered as DORA:

```text
Discover
Offer
Request
Acknowledge
```

### Discover

The client searches for a DHCP server.

### Offer

The server offers an available IP configuration.

### Request

The client requests the offered configuration.

### Acknowledge

The server confirms the lease.

## Common DHCP symptom

A Windows device may assign itself an address in this range when it cannot obtain an address from DHCP:

```text
169.254.x.x
```

Possible causes:

- disconnected cable or Wi-Fi,
- unavailable DHCP server,
- incorrect VLAN,
- exhausted DHCP address pool,
- blocked DHCP traffic.

Useful Windows commands:

```powershell
ipconfig /all
ipconfig /release
ipconfig /renew
```

---

# Cloud computing

Cloud computing provides computing resources through remote data centers and network services.

These resources may include:

- virtual machines,
- application platforms,
- databases,
- storage,
- networking,
- hosted software.

## Service models

### Infrastructure as a Service

IaaS provides infrastructure such as virtual machines, storage and networks.

The customer manages more of the operating system and application environment.

### Platform as a Service

PaaS provides a managed platform for deploying applications.

The provider manages more of the infrastructure and runtime environment.

### Software as a Service

SaaS provides a complete application accessed through a browser or client.

Examples include CRM, ticketing, email and project-management applications.

```text
IaaS → infrastructure
PaaS → application platform
SaaS → finished application
```

## Cloud storage

Cloud storage stores data on infrastructure managed by a service provider.

Benefits may include:

- remote access,
- synchronization,
- scalability,
- backup options,
- collaboration.

Cloud services still depend on working:

```text
local network
Internet connection
DNS
authentication
provider infrastructure
```

---

# Troubleshooting tools

## ipconfig

Windows command for displaying network configuration.

```powershell
ipconfig
ipconfig /all
```

Useful for checking:

- IP address,
- subnet mask,
- default gateway,
- DNS servers,
- DHCP status.

## ping

Tests basic IP connectivity and response time.

```powershell
ping 8.8.8.8
ping example.com
```

Interpretation:

```text
IP ping works, hostname ping fails
→ possible DNS problem
```

A failed ping does not always prove that a system is offline because ICMP traffic may be blocked.

## tracert / traceroute

Shows the network path toward a destination.

Windows:

```powershell
tracert example.com
```

Linux or macOS:

```bash
traceroute example.com
```

Useful for identifying where traffic begins to fail or experience delays.

## nslookup

Queries DNS information.

```powershell
nslookup example.com
```

Useful for checking:

- whether a hostname resolves,
- which IP address is returned,
- which DNS server answered.

## Testing a port

A server may respond to ping while a specific application port is unavailable.

PowerShell example:

```powershell
Test-NetConnection example.com -Port 443
```

This helps distinguish general connectivity from application-level connectivity.

## netstat

Displays active connections and listening ports.

```powershell
netstat -ano
```

Useful for checking whether:

- a local service is listening,
- a connection has been established,
- a process is using a port.

---

# Basic troubleshooting methodology

A structured troubleshooting process prevents random changes and makes support work easier to document.

```text
1. Identify the problem
2. Gather information
3. Establish a likely cause
4. Test the cause
5. Apply a fix
6. Verify the result
7. Document the resolution
```

Important questions:

- Is the problem affecting one user or many users?
- Is the device connected to the local network?
- Does the device have a valid IP address?
- Can it reach the default gateway?
- Can it reach an external IP address?
- Does DNS resolve the hostname?
- Is the required application port available?
- Did the problem begin after a specific change?

---

# Troubleshooting scenario 1 — No Internet access

## User report

```text
My laptop is connected to Wi-Fi, but no websites open.
```

## Suggested checks

### 1. Check the IP configuration

```powershell
ipconfig /all
```

Verify:

- valid IPv4 address,
- default gateway,
- DNS server,
- DHCP status.

### 2. Test the local gateway

```powershell
ping 192.168.1.1
```

If this fails, investigate the local connection, Wi-Fi, router or VLAN.

### 3. Test an external IP address

```powershell
ping 8.8.8.8
```

If the gateway works but the external IP fails, investigate routing or the Internet connection.

### 4. Test DNS

```powershell
nslookup example.com
```

If external IP connectivity works but DNS fails, investigate DNS configuration.

### 5. Trace the route

```powershell
tracert example.com
```

This can help identify where the path stops.

---

# Troubleshooting scenario 2 — SaaS application does not open

## User report

```text
I can use other websites, but our CRM does not load.
```

## Suggested checks

```text
1. Confirm the exact URL and error message.
2. Check whether other users are affected.
3. Resolve the hostname with nslookup.
4. Test connectivity to port 443.
5. Try another browser or private window.
6. Check VPN or proxy configuration.
7. Check whether the provider reports an outage.
8. Collect timestamps and screenshots for escalation.
```

Useful commands:

```powershell
nslookup crm.example.com
Test-NetConnection crm.example.com -Port 443
tracert crm.example.com
```

---

# Troubleshooting scenario 3 — Device has a 169.254 address

## Observation

```text
IPv4 address: 169.254.35.18
```

## Likely issue

The device did not receive a valid DHCP lease.

## Suggested actions

```text
1. Check the network cable or Wi-Fi connection.
2. Confirm that other devices can connect.
3. Run ipconfig /release.
4. Run ipconfig /renew.
5. Check whether the DHCP server or router is available.
6. Escalate with the IP configuration and timestamp if the problem continues.
```

---

# Information to include in a support ticket

```text
Affected user and device
Date and time
Location or network
Exact error message
IP configuration
Whether other users are affected
Results of ping, nslookup and port tests
Recent changes
Steps already attempted
Screenshots or logs
Business impact
```

Example escalation note:

```text
User cannot access crm.example.com from a Windows laptop.

Other websites are working.
DNS resolves crm.example.com to 203.0.113.20.
Ping is blocked, but Test-NetConnection to TCP 443 also fails.
The same issue affects three users on the office network.
The application works through a mobile hotspot.

Likely area: office firewall, proxy or routing configuration.
```

---

# Relationship to SaaS Technical Support

Networking knowledge helps a SaaS support specialist distinguish between:

```text
application problem
account or authentication problem
DNS problem
local network problem
routing problem
blocked port
cloud provider outage
```

This improves ticket quality and prevents unnecessary escalation to engineering.

A good support specialist does not only write:

```text
The application does not work.
```

A stronger ticket contains evidence:

```text
The domain resolves correctly, general Internet access works,
but TCP port 443 is unreachable from the office network.
The application works through a mobile hotspot.
```

---

# What I learned

In this exercise, I learned how to:

- describe networking with the five-layer model,
- explain the basic roles of TCP, IP and UDP,
- understand how routers and routing tables forward traffic,
- explain how DNS resolves names,
- explain how DHCP assigns network settings,
- distinguish IaaS, PaaS and SaaS,
- use basic connectivity and DNS troubleshooting tools,
- collect useful evidence before escalating a network issue.

---

# Portfolio summary

I completed a selective study of Course 2 from the Google IT Support Professional Certificate, focusing on networking concepts relevant to IT Support and SaaS Technical Support.

I documented the five-layer network model, TCP/IP, routing, DNS, DHCP, cloud service models and practical troubleshooting commands.

I also created example troubleshooting workflows for Internet connectivity, SaaS application access and DHCP failures.
