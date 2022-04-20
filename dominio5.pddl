(define (domain dominio_Actividad2_5)
    (:requirements :typing :negative-preconditions :equality :strips :disjunctive-preconditions :conditional-effects)
    (:types
        puerto almacen fabrica - lugar
        tren contenedor - objeto
        espacio
    )

    (:predicates
        (en ?objeto - objeto ?lugar - lugar)
        (sobre ?contenedor - contenedor ?tren - tren)
        (conectado ?origen - lugar ?destino - lugar)
        (procesado ?contenedor - contenedor)
        (despachado ?contenedor - contenedor)
        (ocupado ?espacio - espacio)
        (de ?espacio - espacio ?lugar - lugar)
        (de_tren ?espacio - espacio ?tren - tren)
        (is_almacen ?lugar - lugar)
        (is_fabrica ?lugar - lugar)
        (is_puerto ?lugar - lugar)
    )
    (:action mover
        :parameters (?origen - lugar ?tren - tren ?destino - lugar)
        :precondition ( and
            (en ?tren ?origen)
            (or (conectado ?origen ?destino)
                (conectado ?destino ?origen)
            )
        )
        :effect ( and
            (not (en ?tren ?origen))
            (en ?tren ?destino)

            (forall
                (?contenedor - contenedor)
                (when
                    ;Antecedent
                    ( and
                        (en ?contenedor ?origen)
                        (not (procesado ?contenedor))
                        (is_fabrica ?origen)
                    )
                    ;Consequence
                    (and (procesado ?contenedor))
                )
            )
        )
    )
    (:action cargar
        :parameters (?lugar - lugar ?tren - tren ?contenedor - contenedor ?espacio_tren - espacio ?espacio_lugar - espacio)
        :precondition ( and
            (en ?tren ?lugar)
            (en ?contenedor ?lugar)
            (de_tren ?espacio_tren ?tren)
            (de ?espacio_lugar ?lugar)
            (not (sobre ?contenedor ?tren))
            (not (ocupado ?espacio_tren))
            (ocupado ?espacio_lugar)
        )
        :effect ( and
            (not (en ?contenedor ?lugar))
            (sobre ?contenedor ?tren)
            (ocupado ?espacio_tren)
            (not (ocupado ?espacio_lugar))
        )
    )
    (:action descargar
        :parameters (?lugar - lugar ?tren - tren ?contenedor - contenedor ?espacio_tren - espacio ?espacio_lugar - espacio)
        :precondition ( and
            (en ?tren ?lugar)
            (sobre ?contenedor ?tren)
            (de_tren ?espacio_tren ?tren)
            (de ?espacio_lugar ?lugar)
            (ocupado ?espacio_tren)
            (not (ocupado ?espacio_lugar))
            (not (is_puerto ?lugar))
        )
        :effect ( and
            (not (sobre ?contenedor ?tren))
            (not (ocupado ?espacio_tren))

            (when
                ;Antecedent
                ( or
                    (not (procesado ?contenedor))
                    (not (is_almacen ?lugar))
                )
                ;Consequence
                ( and
                    (en ?contenedor ?lugar)
                    (ocupado ?espacio_lugar)
                )
            )

            (when
                ;Antecedent
                ( and
                    (not(despachado ?contenedor))
                    (procesado ?contenedor)
                    (is_almacen ?lugar)
                )
                ;Consequence
                ( and
                    (despachado ?contenedor)
                )
            )
        )
    )

)