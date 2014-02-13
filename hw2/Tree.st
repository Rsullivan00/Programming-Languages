Object subclass: #Tree
	instanceVariableNames: 'root'
	classVariableNames: ''
	poolDictionaries: ''!

!Tree class methodsFor: 'instance creation'!
new
	^super new initialize
!!

!Stack methodsFor: 'initialization'!
initialize
	contents := Node new
!!

Object subclass: #Node
	instanceVariableNames: 'data link'
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

link
	^link
!
initialize: anObject
	data := anObject
!
linkTo: aNode
	link := aNode
!!

