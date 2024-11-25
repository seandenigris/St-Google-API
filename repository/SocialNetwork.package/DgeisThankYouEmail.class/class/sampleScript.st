as yet unclassified
sampleScript
	<script>
	
	| message commenter |
	commenter := Subscriber new
		email: 'sean.p.denigris@gmail.com';
		firstName: 'Mr.';
		lastName: 'Recipient';
		yourself.
	message := self to: commenter.
	message saveAsDraft.