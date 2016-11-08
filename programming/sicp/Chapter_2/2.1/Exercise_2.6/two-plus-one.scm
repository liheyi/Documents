(+ 2 1)

;;expand +
((lambda (m)
  (lambda (n)
	(lambda (f)
	  (lambda (x)
		(m f (n f x))))))
 2
 1)

;;apply 2 to m
((lambda (n)
   (lambda (f)
	 (lambda (x)
	   (2 f (n f x)))))
 1)

;;apply 1 to n
(lambda (f)
   (lambda (x)
	 (2 f (1 f x))))

;;expand 1
(lambda (f)
  (lambda (x)
	(2 f (
		  (lambda (f)
			(lambda (x)
			  (f x)))
		  f
		  x))))

;;apply f to f
(lambda (f)
  (lambda (x)
	(2 f (
		  (lambda (x)
			(f x))
		  x))))

;;apply x to x
(lambda (f)
  (lambda (x)
	(2 f (f x))))

;;expand 2
(lambda (f)
  (lambda (x)
	(
	 (lambda (f)
	   (lambda (x)
		 (f (f x))))
	 f
	 (f x))))

;;apply f to f
(lambda (f)
  (lambda (x)
	(lambda (x)
	  (f (f x)))
	(f x)))

;;apply (f x) to x
(lambda (f)
  (lambda (x)
	(f (f (f x)))))
