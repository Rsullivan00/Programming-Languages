Object subclass: #Tree
	instanceVariableNames: 'root'
	classVariableNames: ''
	poolDictionaries: ''!

!Tree class methodsFor: 'instance creation'!
new
	^super new initialize
!!

!Tree methodsFor: 'initialization'!
initialize
	root := nil 
!

insert: anObject
	root isNil
		ifTrue:		[root := Node data: anObject]
		ifFalse:	[root insert: anObject]
!!

Object subclass: #Node
	instanceVariableNames: 'data left right'
	classVariableNames: ''
	poolDictionaries: ''!

!Node class methodsFor: 'instance creation'!
data: anObject
	^self new initialize: anObject
!!

!Node methodsFor: 'access'!
data
	^data
!

left
	^left
!

right
	^right
!

initialize: anObject
	data := anObject
!

insert:	anObject 
	data >= anObject 
		ifTrue: 	[left isNil
						ifTrue:		[left := Node data: anObject]
						ifFalse: 	[left insert: anObject]
					]
		ifFalse:	[right isNil
						ifTrue:		[right := Node data: anObject]
						ifFalse: 	[right insert: anObject]
					]
!

member: anObject
	data >= anObject
		ifTrue:		[left isNil
						ifTrue: [false]
						ifFalse: [left member: anObject]
					]
		ifFalse:	[right isNil
						ifTrue: [false]
						ifFalse: [right member: anObject]
					]
!!
