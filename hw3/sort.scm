(define (filter f lst)
    (if ((null? lst) '())
        (else (if (f (car lst)) (cons (car lst)(f (cdr lst)))
                (else (f (cdr lst))))
        )
    )
)

(define (quicksort f)
    (if (null? f) '())
    (else )
) 
            
