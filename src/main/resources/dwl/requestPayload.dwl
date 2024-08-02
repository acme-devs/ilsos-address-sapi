%dw 2.0
output application/json
---
{
	
	grant_type: p('usps.granttype'),
	client_id: p('usps.clientid'),
	client_secret: p('usps.clientsecret')
	
	
}