;   Rick Sullivan
;   Programming Lanugeages HW 3
;   Binary Search Tree in Scheme

(define (insert tree node)
    (cond
        ((null? tree) 
            (list node '() '())
        )

        ((> (car tree) node) 
            (list
                (car tree) (insert (cadr tree) node)
                (caddr tree)
            )
        )

        (else 
            (list
                (car tree) (cadr tree)
                (insert (caddr tree) node)
            )
        )
    )
) 

(define (member? tree node)
    (cond 
        ((null? tree)
            #f    
        )
    
        ((< node (car tree))
            (member? (cadr tree) node)
        )

        ((> node (car tree))
            (member? (caddr tree) node)
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
            (list
                (inorder (cadr node)) 
                (car node) (inorder (caddr node))
            )
        )
    )
)

(define (helper x tree)
    (foldl insert tree x))

(define (listToTree lst)
    (helper lst '()))

;;http://acm3.wustl.edu/functional/scm-breads.php
(define (foldl f cur lst)
    (if (null? lst)
    cur
    (foldl f (f cur (car lst)) (cdr lst))))
