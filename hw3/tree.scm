(define (insert node-list node)
    (cond
        ((null? node-list) 
            node
        )

        ((> (car node-list) node) 
            (append 
                (cons (car node-lst) (insert (cadr node-list) node)) 
                (cadr (cdr node-list))
            )
        )

        (else 
            (append 
                (cons (car node-lst) (cadr node-lst)) 
                (insert (cadr (cdr node-lst)) node)
            )
        )
    )
) 

(define (member tree node)
    (cond 
        ((null? tree)
            #f    
        )
    
        ((> node (car tree))
            member (cadr tree) node
        )

        ((< node (car tree))
            member (cadr (cdr tree)) node
        )

        (else
            #t
        )
    )
)

(define (inorder node)
    (cond
        ((null? node) '())

        (else 
            (append 
                (inorder (cadr node)) 
                (cons (car node) (inorder (cadr (cdr node))))
            )
        )
    )
)
