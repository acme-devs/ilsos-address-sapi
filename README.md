# ilsos-address-sapi
![Powered by](https://img.shields.io/badge/Powered%20by-Mulesoft-535597.svg)
<br>

Address System API

## Table of contents
1. [Description](#description)
1. [Endpoints](#endpoints)
    1. [GET /v1/address/verification](#get-v1addressverification)

## Description
The API provides the backend services for the Drivers Address business case. The next diagram shows the architecture

![architecture](./media/architecture.png)

This service implements the next API specification: https://anypoint.mulesoft.com/exchange/0fa744b1-1284-46c5-b23c-0eb98ea787e3/ilsos-address-sapi/minor/1.0/

## Endpoints
The service provides the following endpoints:

### GET /v1/address/verification
Verify the address with the USPS database.

The next diagram shows the business sequence of messages or events exchanged between the several backend systems.

```mermaid
sequenceDiagram
    autonumber
    participant ui as UI
    participant api as ilsos-drivers-sapi
    participant qas as QAS

    ui->>api:GET/drivers/address-verification <br>Input: idTransaction,dl,Id,last4ssn,DOB<br>Street,City,State,ZIP and County
    api-->>api:Dataweave - format records for QAS.
    api-->>qas:Address validation.
    qas-->>api:Retrieve response.
    api-->>api:Log response. If QAS access error, then send email to admin
    alt Success Scenario 
        api-->ui: Status 200 ,response from QAS
    end
    alt Error Scenario 
        api-->ui: Status 400 , detail error message
    end
  ```
