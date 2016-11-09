(square-list '(1 2 3 4))

(iter '(1 2 3 4) '())

(iter '(2 3 4) (cons '() 1))

(iter '(3 4) (cons (cons '() 1) 4))

(iter '(4) (cons (cons (cons '() 1) 4) 9))

(iter '() (cons (cons (cons (cons '() 1) 4) 9) 16))

(cons (cons (cons (cons '() 1) 4) 9) 16)
