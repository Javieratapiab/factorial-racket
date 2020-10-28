#lang racket

; Recursión natural
(define factorial (lambda  (n)
                    ; caso base
                    (if (= n 0)
                        1 ; solución conocida
                        (* n (factorial (- n 1)))))) ; descomposición recursiva

(factorial 5)

; Recursión cola
; Queremos construir la solución de manera progresiva, demandará una variable
; a la que le iremos pasando el cálculo en cada llamado recursivo (result).
; (result) es circunstancial / auxiliar, resulta contraproducente para el usuario
; conocer esta variable.

(define (factorialEnvoltorio n)
  (define (factorialCola n result)
    ;caso base
    (if (= n 0) ; condición de borde
        result ; solución conocida
        (factorialCola (- n 1)(* n result)) ; descomposición recursiva (sin estados pendientes)
        )
    )
  (factorialCola n 1)
)

(factorialEnvoltorio 5)
