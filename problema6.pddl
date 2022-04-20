(define (problem problema_Actividad2_6)
    (:domain dominio_Actividad2_6)
    (:objects
        L1 L2 - lugar
        T - tren
    )

    (:init
        (conectado L1 L2)

        (en T L1)

    )
    (:goal
        (and
            (en T L2) 
        )
    )
)