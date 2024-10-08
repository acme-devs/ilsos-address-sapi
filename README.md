# ilsos-address-sapi
![Powered by](https://img.shields.io/badge/Powered%20by-Mulesoft-535597.svg)
<br>

Address System API

## Table of contents
1. [Description](#description)
1. [Endpoints](#endpoints)
    1. [GET /addresses](#get-addresses)

## Description
The API provides the backend services for the Drivers Address business case. The next diagram shows the architecture



This service implements the next API specification: https://anypoint.mulesoft.com/exchange/0fa744b1-1284-46c5-b23c-0eb98ea787e3/ilsos-address-sapi/minor/1.0/

## Endpoints
The service provides the following endpoints:

### GET /addresses
Verify the address with the USPS database.

The next diagram shows the business sequence of messages or events exchanged between the several backend systems.

```mermaid
sequenceDiagram
    autonumber
    participant eapi as ilsos-addresschange-eapi
    participant api as ilsos-address-sapi
    participant usps as USPS

    eapi->>api:GET/addresses <br>Input: street,city,state and zipCode
    api-->>api:Scheduler - put the authorization token in object store every 30 minutes.
    api-->>usps:Authorization token
    usps-->>api:token retrieve
    api-->>api:Dataweave - format records for USPS.
    api-->>usps:Address validation.
    usps-->>api:Retrieve response.
    api-->>api:Log response. If USPS access error, then send email to admin
    alt Success Scenario 
        api-->eapi: Status 200 ,response from USPS
    end
    alt Error Scenario 
        api-->eapi: Status 400 or 500, detail error message
    end
  ```
