as yet unclassified
createApiNamed: apiName 
	| api categoryName |
	api:=GoogleApiList apiNamed: apiName.
	categoryName :=self apiNameAsCategory: apiName.
	self createApi: api inCategory: categoryName 