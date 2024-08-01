%dw 2.0
output application/json
---
{
	
	grant_type: p('grant_type'),
	client_id: p('usps.clientid'),
	client_secret: p('usps.clientsecret'),
	code: p('code')
	
}