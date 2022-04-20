(define (problem problema_Actividad2_5)
    (:domain dominio_Actividad2_5)
    (:objects
        F1 F2 - fabrica
        A1 A2 - almacen
        P - puerto
        T - tren
        C1 C2 C3 C4 C5 C6 C7 C8 - contenedor
        ET1 ET2 ET3 ET4 EA1 EA2 EA3 EA1_2 EA2_2 EA3_2 F1_1 F1_2 F2_1 F2_2 F2_3 EP1 EP2 EP3 EP4 EP5 EP6 EP7 EP8 - espacio
    )

    (:init
        (conectado A1 P)
        (conectado P F2)
        (conectado F2 F1)
        (conectado F1 A1)
        (conectado F1 A2)
        (conectado F2 A2)

        (is_almacen A1)
        (is_almacen A2)
        (is_fabrica F1)
        (is_fabrica F2)
        (is_puerto P)

        (en C1 P)
        (en C2 P)
        (en C3 P)
        (en C4 P)
        (en C5 P)
        (en C6 P)
        (en C7 P)
        (en C8 P)

        (en T P)

        (ocupado EP1)
        (ocupado EP2)
        (ocupado EP3)
        (ocupado EP4)
        (ocupado EP5)
        (ocupado EP6)
        (ocupado EP7)
        (ocupado EP8)

        (de_tren ET1 T)
        (de_tren ET2 T)
        (de_tren ET3 T)
        (de_tren ET4 T)
        (de EA1 A1)
        (de EA2 A1)
        (de EA3 A1)
        (de EA1_2 A2)
        (de EA2_2 A2)
        (de EA3_2 A2)
        (de F1_1 F1)
        (de F1_2 F1)
        (de F2_1 F2)
        (de F2_2 F2)
        (de F2_3 F2)
        (de EP1 P)
        (de EP2 P)
        (de EP3 P)
        (de EP4 P)
        (de EP5 P)
        (de EP6 P)
        (de EP7 P)
        (de EP8 P)

    )
    (:goal
        (and
            (despachado C1) (despachado C2) (despachado C3) (despachado C4)
            (despachado C5) (despachado C6) (despachado C7) (despachado C8)
        )
    )
)