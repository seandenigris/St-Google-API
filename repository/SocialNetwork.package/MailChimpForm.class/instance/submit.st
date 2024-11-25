accessing
submit
	ZnClient new
		url: 'http://facebook.us11.list-manage.com/subscribe/post';
		formAt: 'u' put: self u;
		formAt: 'id' put: self id;
		formAt: 'MERGE0' put: self email;
		formAt: 'MERGE1' put: self firstName;
		formAt: 'MERGE2' put: self lastName;
		post.