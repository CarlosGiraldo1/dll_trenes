(define (domain dominio_Actividad2_6)
    (:requirements :typing :negative-preconditions :equality :strips :disjunctive-preconditions :fluents)
    (:types 
       lugar
       tren 
    )
    (:predicates
        (en ?tren - tren ?lugar - lugar )
        (conectado ?origen - lugar ?destino - lugar)
        
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
   

)