"
This is a converter where the conversion is specified by two blocks.

Instance Variables
	dbToSt	<BlockClosure>	The block to run to convert from the database representation to the Smalltalk representation. Takes one argument, the value to be converted.
	stToDb	<BlockClosure>	The block to run to convert from the Smalltalk representation to the database representation. Takes one argument, the value to be converted.


"
Class {
	#name : #PluggableDatabaseConverter,
	#superclass : #DatabaseConverter,
	#instVars : [
		'stToDb',
		'dbToSt'
	],
	#category : #'Glorp-Database'
}

{ #category : #converting }
PluggableDatabaseConverter >> convert: anObject fromDatabaseRepresentationAs: aDatabaseType [

	^ dbToSt isNil
		  ifTrue: [ anObject ]
		  ifFalse: [ dbToSt value: anObject ]
]

{ #category : #converting }
PluggableDatabaseConverter >> convert: anObject toDatabaseRepresentationAs: aDatabaseType [

	^ stToDb isNil
		  ifTrue: [ anObject ]
		  ifFalse: [ stToDb value: anObject ]
]

{ #category : #accessing }
PluggableDatabaseConverter >> dbToSt [

	^ dbToSt
]

{ #category : #accessing }
PluggableDatabaseConverter >> dbToStConverter: aBlock [

	dbToSt := aBlock
]

{ #category : #accessing }
PluggableDatabaseConverter >> stToDb [

	^ stToDb
]

{ #category : #accessing }
PluggableDatabaseConverter >> stToDbConverter: aBlock [

	stToDb := aBlock
]
