%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "street": "831 CHRISTOPHER ROBIN RD",
  "secondary": null,
  "city": "ALPHARETTA",
  "state": "GA",
  "zipcode": "30005",
  "zipplus4": "8365"
})