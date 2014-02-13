Object subclass: #Complex
    instanceVariableNames: 'real imaginary'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'examples'!


!Complex class methodsFor: 'instance creation'!

new
    ^super new real: 0 imaginary: 0
!

real: rFloat imaginary: iFloat
    ^super new real: rFloat imaginary: iFloat
!!


!Complex methodsFor: 'component access'!

real
    "Answer the real component of this number."
    ^real
!

imaginary
    "Answer the imaginary component of this number."
    ^imaginary
!

real: rFloat imaginary: iFloat
    "Set the real and imaginary components of this number."
    real := rFloat .
    imaginary := iFloat
!!


!Complex methodsFor: 'arithmetic'!

+ aComplex
    "Add two numbers and answer the result."
    ^Complex real: real + aComplex real
	imaginary: imaginary + aComplex imaginary
!

- aComplex
    "Subtract two numbers and answer the result."
    ^Complex real: real - aComplex real
	imaginary: imaginary - aComplex imaginary
!!


!Complex methodsFor: 'printing'!
printOn: aStream
    aStream print: real .
    imaginary < 0
	ifTrue: [aStream nextPutAll: ' - '; print: imaginary abs]
	ifFalse: [aStream nextPutAll: ' + '; print: imaginary] .
    aStream nextPutAll: 'i'
!!


Smalltalk at: #x put: nil!
Smalltalk at: #y put: nil!

x := Complex real: 4 imaginary: 1!
y := Complex real: 4 imaginary: 8 negated!

x printNl!
y printNl!
(x + y) printNl!
(x - y) printNl!
