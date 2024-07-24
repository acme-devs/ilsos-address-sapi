%dw 2.0
output application/java
---
{
	"grant_type": p('grant_type'),
	"client_id": p('client_id'),
	"client_secret": p('client_secret'),
	"code": p('code')
}