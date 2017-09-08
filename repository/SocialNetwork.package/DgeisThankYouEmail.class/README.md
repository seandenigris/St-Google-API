# Initial Setup
```
| account |
account := GoogleAccount new
	nickname: 'Sean';
	email: 'sean.p.denigris@gmail.com';
	yourself.
account := GoogleAccount new
	nickname: 'Firefighters';
	email: 'uffalocal273nrfd@gmail.com';
	yourself.
GoogleAccount chart add: account.
```

# Change Account
```
| account |
account := GoogleAccount detectNamed: 'Sean' "or 'Firefighters'".
DgeisThankYouEmail senderAccount: account
```