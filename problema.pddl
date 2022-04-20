(define (problem problema_Actividad2)
 (:domain dominio_Actividad2)
 (:objects F1 F2 - fabrica
           A - almacen
           P - puerto
           T - tren
           C1 C2 C3 C4 C5 C6 C7 C8 - contenedor
)
 (:init 
    (conectado A P)
    (conectado P F2)
    (conectado F2 F1)
    (conectado F1 A)
    
    (en C1 P)
    (en C2 P)
    (en C3 P)
    (en C4 P)
    (en C5 P)
    (en C6 P)
    (en C7 P)
    (en C8 P)
    
    (en T P)
    
    (= (numero_contenedores_tren T) 0)
    (= (numero_contenedores_lugar A) 0)
    (= (numero_contenedores_lugar P) 8)
    (= (numero_contenedores_lugar F1) 0)
    (= (numero_contenedores_lugar F2) 0)
    
    (= (capacidad_tren T) 4)
    (= (capacidad_lugar A) 3)
    (= (capacidad_lugar P) 8)
    (= (capacidad_lugar F1) 2)
    (= (capacidad_lugar F2) 3)
    
 )
 (:goal (and 
            (despachado C1)
            (despachado C2)
            (despachado C3)
            (despachado C4)
            (despachado C5)
            (despachado C6)
            (despachado C7)
            (despachado C8)
        )
 )
)