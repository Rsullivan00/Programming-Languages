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
    |result|
    data = anObject
        ifTrue: [result := true]
        ifFalse: [
                data >= anObject
                    ifTrue:		[left isNil
                                    ifTrue: [result := false]
                                    ifFalse: [result := left member: anObject]
                                ]
                    ifFalse:	[right isNil
                                    ifTrue: [result := false]
                                    ifFalse: [result := right member: anObject]
                                ]
                ].
    ^result
!!



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

root
    ^root
!

insert: anObject
	root isNil
		ifTrue:		[root := Node data: anObject]
		ifFalse:	[root insert: anObject]
!

member: anObject
    |result output|
    root isNil
        ifTrue:     [result := false]
        ifFalse:    [result := root member: anObject].
    ^result
!!


Smalltalk at: #x put: nil!
Smalltalk at: #y put: nil!
Smalltalk at: #z put: nil!

x := Tree new!

y := stdin nextLine asInteger!

[y = -1] whileFalse: [x insert: y. y := stdin nextLine asInteger]!

y := stdin nextLine asInteger!

[y = -1] whileFalse: [z := x member: y. z printNl.
                       y := stdin nextLine asInteger]!
