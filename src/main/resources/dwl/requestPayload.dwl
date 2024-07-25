%dw 2.0
output application/java
---
{
	"grant_type": p('api.grant_type'),
	"client_id": p('api.client_id'),
	"client_secret": p('api.client_secret'),
	"code": p('api.code')
}