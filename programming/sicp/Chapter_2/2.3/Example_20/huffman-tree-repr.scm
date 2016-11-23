;; Constructors of leaf
(define (make-leaf symbol weight) (list 'leaf symbol weight))

;; Selectors of leaf
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

;; Constructors of Huffman Tree
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

;; Selectors of Huffman Tree
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree) (list (symbol-leaf tree)) (caddr tree)))
(define (weight tree)
  (if (leaf? tree) (weight-leaf tree) (cadddr tree)))
