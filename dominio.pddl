(define (domain dominio_Actividad2)
    (:requirements :typing :negative-preconditions :equality :strips :disjunctive-preconditions :fluents)
    (:types 
       puerto almacen fabrica - lugar
       tren contenedor - objeto
    )
    (:functions 
       (numero_contenedores_tren ?tren - tren)
       (numero_contenedores_lugar ?lugar - lugar)
       (capacidad_tren ?tren - tren)
       (capacidad_lugar ?lugar - lugar)
    )
    (:predicates
        (en ?objeto - objeto ?lugar - lugar )
        (sobre ?contenedor - contenedor ?tren - tren )
        (conectado ?origen - lugar ?destino - lugar)
        (procesado ?contenedor - contenedor)
        (despachado ?contenedor - contenedor)
        
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
        :parameters (?lugar - lugar ?tren - tren ?contenedor - contenedor)
        :precondition ( and 
                            (en ?tren ?lugar) 
                            (en ?contenedor ?lugar) 
                            (not (sobre ?contenedor ?tren))
                            (<= (numero_contenedores_tren ?tren) (capacidad_tren ?tren))
                        )
        :effect ( and 
                    (not (en ?contenedor ?lugar))
                    (sobre ?contenedor ?tren)
                    (increase (numero_contenedores_tren ?tren) 1)
                    (decrease (numero_contenedores_lugar ?lugar) 1)
                )
    )
    (:action descargar
        :parameters (?lugar - lugar ?tren - tren ?contenedor - contenedor)
        :precondition ( and 
                            (en ?tren ?lugar) 
                            (sobre ?contenedor ?tren)
                        )
        :effect ( and 
                    (not (sobre ?contenedor ?tren))
                    (en ?contenedor ?lugar)
                    (decrease (numero_contenedores_tren ?tren) 1)
                    (increase (numero_contenedores_lugar ?lugar) 1)
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
        :parameters (?almacen - almacen ?contenedor - contenedor)
        :precondition ( and 
                            (en ?contenedor ?almacen) 
                            (not(despachado ?contenedor))
                            (procesado ?contenedor)
                        )
        :effect ( and 
                    (despachado ?contenedor)
                    (not(en ?contenedor ?almacen)) 
                    (decrease (numero_contenedores_lugar ?almacen) 1)
                )
    )

)