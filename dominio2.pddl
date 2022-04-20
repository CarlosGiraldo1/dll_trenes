(define (domain dominio_Actividad2_2)
    (:requirements :typing :negative-preconditions :equality :strips :disjunctive-preconditions :fluents)
    (:types 
       puerto almacen fabrica - lugar
       tren contenedor - objeto
       espacio
    )
    (:predicates
        (en ?objeto - objeto ?lugar - lugar )
        (sobre ?contenedor - contenedor ?tren - tren )
        (conectado ?origen - lugar ?destino - lugar)
        (procesado ?contenedor - contenedor)
        (despachado ?contenedor - contenedor)
        (ocupado ?espacio - espacio)
        (de ?espacio - espacio ?lugar - lugar)
        (de_tren ?espacio - espacio ?tren - tren)
        
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
                        )
        :effect ( and 
                    (not (sobre ?contenedor ?tren))
                    (en ?contenedor ?lugar)
                    (not (ocupado ?espacio_tren))
                    (ocupado ?espacio_lugar)
                )
    )
    (:action procesar
        :parameters (?fabrica - fabrica ?contenedor - contenedor)
        :precondition ( and 
                            (en ?contenedor ?fabrica) 
                            (not(procesado ?contenedor))
                        )
        :effect ( and 
                    (procesado ?contenedor)
                )
    )
    (:action despachar
        :parameters (?almacen - almacen ?contenedor - contenedor ?espacio - espacio)
        :precondition ( and 
                            (en ?contenedor ?almacen) 
                            (not(despachado ?contenedor))
                            (de ?espacio ?almacen)
                            (procesado ?contenedor)
                            (ocupado ?espacio)
                        )
        :effect ( and 
                    (despachado ?contenedor)
                    (not(en ?contenedor ?almacen)) 
                    (not (ocupado ?espacio))
                )
    )

)