(import java.util.*)
(defglobal ?*VENTANA* = (fetch VENTANA))

(deffacts hechos_iniciales
    (Tarea ES iniciada)
)

(defrule reglaInicial
    (Tarea ES iniciada)
    =>
    (assert(Elija_tipo_problema)
)
)
;;;;;;;;;;;;;; INICIO REGLAS BASE DEL CONOCIMIENTO TERRORISMO ;;;;;;;;;;;

(defrule regla1
    (Elija_tipo_problema)
    =>
   
   (?*VENTANA* setMemoriaTrabajo " 
    ===== NUEVA CONSULTA DE TERRORISMO =====
Sistema : Elija su tipo de problema:")

    (bind ?pregunta "Elija su tipo de problema:")
    (bind ?opciones (new ArrayList))
    ;;;;;;;;;;;;;;;; Aqui elejimos los diferentes problemas a tratar
    (?opciones add  "Destrucciones masivas a un gobierno, instalaciones públicas o privadas")
    (?opciones add  "Atentados contra la integridad física de personas, rehenes")
    (?opciones add  "Liberación de sustancias peligrosas o provocar incendios")
    (?opciones add  "Apoderamiento de medios de transporte colectivo")
    (?opciones add  "Interrupción de suministro de agua o recursos fundamentales")
    ; Aquie esta la respuesta obtenida y nos muestra el cuadro de informacion
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    ;Aqui la opcion seleccionada de la interface preguntas
    (if (eq ?respuesta "Destrucciones masivas a un gobierno, instalaciones públicas o privadas")
         then (assert(Destruccion)))
    (if (eq ?respuesta "Atentados contra la integridad física de personas, rehenes")
             then (assert(Atentado)))
    (if (eq ?respuesta "Liberación de sustancias peligrosas o provocar incendios")
             then (assert(Liberacion)))
    (if (eq ?respuesta "Apoderamiento de medios de transporte colectivo")
             then (assert(Apoderamiento)))
    (if (eq ?respuesta "Interrupción de suministro de agua o recursos fundamentales")
             then (assert(Interrupcion)))
)

;;;;;;;;;;;;;;;;;;;;;; REGLAS DE DESTRUCCION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule regla2
    (Destruccion)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : De que tipo de terrorismo estamos hablando?")

    (bind ?pregunta "De que tipo de terrorismo estamos hablando?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Destruccion leve")
    (?opciones add  "Destruccion media")
    (?opciones add  "Destruccion de alto riezgo")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Destruccion leve")
            then (assert(Destruccion_baja) ))
    (if (eq ?respuesta "Destruccion media")
            then (assert(Destruccion_media) ))
    (if (eq ?respuesta "Destruccion de alto riezgo")
            then (assert(Destruccion_alta) ))
)
(defrule regla3
    (Destruccion_baja)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe presencia de armas de fuego?")
    (bind ?pregunta "Existe presencia de armas de fuego?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Destruccion_baja_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Destruccion_baja_no) ))
)
(defrule regla4
    (Destruccion_media)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe presencia de armas de fuego?")
    (bind ?pregunta "Existe presencia de armas de fuego?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Destruccion_media_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Destruccion_media_no) ))
)

(defrule regla5
    (Destruccion_alta)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe presencia de armas de fuego?")
    (bind ?pregunta "Existe presencia de armas de fuego?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Destruccion_alta_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Destruccion_alta_no) ))
)

(defrule regla6
    (Destruccion_baja_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Se presentaron amenazas de cualquier")
    (?*VENTANA* setMemoriaTrabajo "                 tipo con anterioridad (reincidencia)?")
    (bind ?pregunta "Se presentaron amenazas de cualquier tipo con 
anterioridad (reincidencia)?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : Conclusion final
1. Realizar un rastrillaje en el área de conflicto
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : Conclusion final
1. Recopilación de información para un posterior análisis de 
    los puntos críticos en la instalación
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla7
    (Destruccion_baja_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Se presentaron amenazas de cualquier")
    (?*VENTANA* setMemoriaTrabajo "                 tipo con anterioridad (reincidencia)?")
    (bind ?pregunta "Se presentaron amenazas de cualquier tipo con 
anterioridad (reincidencia)?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : Conclusion final
1.  Al no existir presencia de armas ni reincidencias, podemos 
    tomar como irrelevante pero sin descuidar el resguardo al 
    afectado.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : Conclusion final
1.  Sin armas de fuego y con un grado de dificultad bajo existe
    una probabilidad mayor de que no se realice el crimen, asi 
    que no podemos enviar tropas especiales para realizar un 
    trabajo de poca probabilidad, recurriremos a la supervisión 
    o resguardo mediante cámaras de seguridad.  
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla8
    (Destruccion_media_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Se presentaron amenazas de cualquier")
    (?*VENTANA* setMemoriaTrabajo "                 tipo con anterioridad (reincidencia)?")
    (bind ?pregunta "Se presentaron amenazas de cualquier tipo con 
anterioridad (reincidencia)?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Incrementar al doble resguardo con efectivos policiales armados a las
     instalaciones en cuestión, registro de personal cercano al gobierno. 
    ===== FIN CONSULTA DE TERRORISMO =====")  
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Asignar grupos de  10 efectivos para registro de la instalación
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla9
    (Destruccion_media_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Se presentaron amenazas de cualquier")
    (?*VENTANA* setMemoriaTrabajo "                 tipo con anterioridad (reincidencia)?")
    (bind ?pregunta "Se presentaron amenazas de cualquier tipo con 
anterioridad (reincidencia)?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Al no existir presencia de armas se debe tomar medidas flexibles
2. verificar la cantidad de reincidencia registrada en los historiales 
    de  terrorismo
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1.  Con dificultad media y sin la presencia de armas de fuego, 
    podemos considerar una situación de terrorismo de bajo nivel 
    es decir realizar un sondeo de seguridad a la instalación 
    periódicamente regular para evitar el acto terrorista. 
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla10
    (Destruccion_alta_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Se presentaron amenazas de cualquier")
    (?*VENTANA* setMemoriaTrabajo "                 tipo con anterioridad (reincidencia)?")
    (bind ?pregunta "Se presentaron amenazas de cualquier tipo con 
anterioridad (reincidencia)?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Coordinar con los diferentes órganos y entes competentes a nivel 
    nacional e internacional, las diversas operaciones a que hubiere 
    lugar para hacer efectiva la prevención y represión de los delitos 
    de delincuencia organizada y financiamiento al terrorismo
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Incrementar al doble resguardo con efectivos policiales 
    armados a las instalaciones en cuestión
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla11
    (Destruccion_alta_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Se presentaron amenazas de cualquier")
    (?*VENTANA* setMemoriaTrabajo "                 tipo con anterioridad (reincidencia)?")
    (bind ?pregunta "Se presentaron amenazas de cualquier tipo con 
anterioridad (reincidencia)?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Realizar la revisión, informes guardados de anteriores casos 
    de amenazas y analizar el modus operandi del terrorista.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "destrucion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Al no portar armas y con un grado de dificultad alta podríamos 
    esperar o no un ataque al afectado (gobierno), de tal manera 
    que se debe realizar pequeños  grupos de militares para un 
    control periódico en las instalaciones.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

;;;;;;;;;;;;;;;;;;;;;; REGLAS DE ATENTADO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule regla12
    (Atentado)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : De que tipo de terrorismo estamos hablando?")

    (bind ?pregunta "De que tipo de terrorismo estamos hablando?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Atentado leve")
    (?opciones add  "Atentado medio")
    (?opciones add  "Atentado alto")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Atentado leve")
            then (assert(Atentado_baja) ))
    (if (eq ?respuesta "Atentado medio")
            then (assert(Atentado_media) ))
    (if (eq ?respuesta "Atentado alto")
            then (assert(Atentado_alta) ))
)
(defrule regla13
    (Atentado_baja)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Provoca  la muerte o lesiones corporales ")
    (?*VENTANA* setMemoriaTrabajo "                 graves a otra persona o personas?")
    (bind ?pregunta "Provoca  la muerte o lesiones corporales 
graves a otra persona o personas?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Atentado_baja_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Atentado_baja_no) ))
)
(defrule regla14
    (Atentado_media)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Provoca  la muerte o lesiones corporales ")
    (?*VENTANA* setMemoriaTrabajo "                 graves a otra persona o personas?")
    (bind ?pregunta "Provoca  la muerte o lesiones corporales 
graves a otra persona o personas?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Atentado_media_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Atentado_media_no) ))
)

(defrule regla15
    (Atentado_alta)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Provoca  la muerte o lesiones corporales ")
    (?*VENTANA* setMemoriaTrabajo "                 graves a otra persona o personas?")
    (bind ?pregunta "Provoca  la muerte o lesiones corporales 
graves a otra persona o personas?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Atentado_alta_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Atentado_alta_no) ))
)

(defrule regla16
    (Atentado_baja_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe la participación de personajes")
    (?*VENTANA* setMemoriaTrabajo "                 con un cargo gubernamental / político?")
    (bind ?pregunta "Existe la participación de personajes con 
un cargo gubernamental / político?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Con grado de dificultad baja y participación de políticos/gubernamentales  
    tenemos una probabilidad baja de que se realice el acto terrorista, 
    por el cual  tomaremos medidas leves. 
2. Asignar resguardo policial  regular al  afectado 
3. Por ser participe políticos, existe sustento 
    económico al terrorismo, tendremos que  equipar al cuerpo policial 
    de armas de fuego y chalecos antibalas.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Podríamos estar frente a un caso de poca probabilidad de ocurrencia, 
    por lo cual realizaremos un  resguardo policial al lugar donde se
    encuentre el afectado.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla17
    (Atentado_baja_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe la participación de personajes")
    (?*VENTANA* setMemoriaTrabajo "                 con un cargo gubernamental / político?")
    (bind ?pregunta "Existe la participación de personajes con un 
cargo gubernamental / político?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Realizar un estudio del caso, para encontrar las posibles causas 
    del atentado y contrarrestar el daño en curso.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Podríamos estar frente a un acto terrorista como no podría serlo, 
    la probabilidad de serlo es menor a 20 % por tanto pasa por alto 
    pero queda registrado la poca información encontrada.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla18
    (Atentado_media_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe la participación de personajes")
    (?*VENTANA* setMemoriaTrabajo "                 con un cargo gubernamental / político?")
    (bind ?pregunta "Existe la participación de personajes con un 
cargo gubernamental / político?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Al existir un grado de dificultad media  podemos asumir  que 
    el acto terrorista podría no contar con financiamiento , de 
    forma que  podríamos  realizar la prevención del acto.
2. procedemos a 3 equipos de seguridad  de 9 militares equipados 
    con armas de fuego.
    ===== FIN CONSULTA DE TERRORISMO =====")  
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Podríamos estar frente a un caso a efectuarse a largo plazo por 
    el cual procedemos a la protección del involucrado, asignando 
    efectivos policiales bien equipados
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla19
    (Atentado_media_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe la participación de personajes")
    (?*VENTANA* setMemoriaTrabajo "                 con un cargo gubernamental / político?")
    (bind ?pregunta "Existe la participación de personajes con un 
cargo gubernamental / político?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Asignamos personal policial equipo, para salvaguardar la seguridad 
    de la posible victima, y control del entorno mediante cámaras de 
    seguridad en el perímetro.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Se realizara un estudio superficial, ya que no nos es significante 
    el caso con una dificultad media, registrar caso en expedientes.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla20
    (Atentado_alta_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe la participación de personajes")
    (?*VENTANA* setMemoriaTrabajo "                 con un cargo gubernamental / político?")
    (bind ?pregunta "Existe la participación de personajes con un 
cargo gubernamental / político?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Las fuerzas armadas nacionales y multinacionales deben jugar 
    en prioridad un    papel preventivo y disuasivo.
2. Se debe distinguir el imperativo de actuar por un mundo mejor, 
    de manera que no existen cargos políticos al mometo de cuidar 
    el valor de la vida de una persona. 
3. El militar deberá  realizar una estrategia de emboscada al terrorista, 
    priorizando la seguridad del afectado, debe de estar preparado 
    físicamente con equipos de fuego y  chalecos antibalas.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Al no existir la participación de políticos/gubernamentales , existe 
    menos sustento económico para el acto terrorista, que nos facilita 
    la tarea del cuerpo policial
2. Realizar patrullajes de manera  regular 
3. Contar con presencia de cámaras de seguridad en el perímetro tanto como 
    dentro de la instalación en cuestión.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla21
    (Atentado_alta_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe la participación de personajes")
    (?*VENTANA* setMemoriaTrabajo "                 con un cargo gubernamental / político?")
    (bind ?pregunta "Existe la participación de personajes con un 
cargo gubernamental / político?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Podríamos estar frente a un caso de terrorismo financiado por 
    personas con poder, por tanto procedemos al estudio del caso, 
    resguardo policial al afectado y su entorno.
2. Control por cámaras de seguridad 
3. Seguimiento de todos los posibles sospechosos
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "atentado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Nos vemos frente a un caso de terrorismo sin información, pero de 
    posible realización, por tanto realizamos un mayor estudio y 
    documentación del entorno, para verificar donde y quien es la 
    posible victima.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

;;;;;;;;;;;;;;;;;;;;;; REGLAS DE LIBERACION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule regla22
    (Liberacion)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : De que tipo de terrorismo estamos hablando?")

    (bind ?pregunta "De que tipo de terrorismo estamos hablando?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Liberacion de sustancias leve")
    (?opciones add  "Liberacion de sustancias medio")
    (?opciones add  "Liberacion de sustancias alto")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Liberacion de sustancias leve")
            then (assert(Liberacion_baja) ))
    (if (eq ?respuesta "Liberacion de sustancias medio")
            then (assert(Liberacion_media) ))
    (if (eq ?respuesta "Liberacion de sustancias alto")
            then (assert(Liberacion_alta) ))
)
(defrule regla23
    (Liberacion_baja)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe la presencia de agentes químicos en gran cantidad?")
    (bind ?pregunta "Existe la presencia de agentes químicos en gran cantidad?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Liberacion_baja_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Liberacion_baja_no) ))
)
(defrule regla24
    (Liberacion_media)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe la presencia de agentes químicos en gran cantidad?")
    (bind ?pregunta "Existe la presencia de agentes químicos en gran cantidad?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Liberacion_media_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Liberacion_media_no) ))
)

(defrule regla25
    (Liberacion_alta)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe la presencia de agentes químicos en gran cantidad?")
    (bind ?pregunta "Existe la presencia de agentes químicos en gran cantidad?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Liberacion_alta_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Liberacion_alta_no) ))
)

(defrule regla26
    (Liberacion_baja_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?pregunta "los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Agentes especiales realizan el análisis de dichos agentes 
    para saber la gravedad del daño
2. Hasta no tener certeza de que agentes se encontraron, se 
    realiza la detención de los participantes o autores del hecho
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Se realiza un pequeño control de  frecuencia en cuanto al 
    movimiento de venta de químicos en gran cantidad
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla27
    (Liberacion_baja_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?pregunta "los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Presentamos un caso de terrorismo con agentes químicos con menor 
    incidencia, en el cual emplearemos un equipo especial militar 
    para el  resguardo del lugar afectado.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Se realiza la documentación del caso, y un control policial 
    eventual
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla28
    (Liberacion_media_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?pregunta "los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Efectivos militares especiales en el caso  deben realizar la 
    búsqueda del lugar donde se realiza dicha actividad ilegal
2. Se debe evitar que  se infiltre dichos agentes en nuestro entorno
    ===== FIN CONSULTA DE TERRORISMO =====")  
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Efectivos policiales realizan un control periódico, de transporte y 
    comercialización de agentes químicos, y sus posibles combinacione 
2. Para contrarestar el alto índice de este delito se procede a 
    incautar compuestos legales pero en una cantidad extremadamente 
    alta comparado a lo normal.
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla29
    (Liberacion_media_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?pregunta "los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Tenemos un caso de terrorismo con agentes químicos con probabilidad
     de 60 %  certero, por tanto procedemos inmediatamente a realizar 
    la búsqueda de la central que elabora estos químicos ilegales
2. Procedemos al allanamiento e incautación y destruccion de los agentes 
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Se realiza un control policial eventualmente al 
    lugar afectado
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla30
    (Liberacion_alta_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?pregunta "los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Efectivos militares especiales en el caso, armados son asignados 
2. Se debe realizar la búsqueda del lugar donde se encuentran 
    realizando las actividades  ilegales.
3. Se realiza el respectivo análisis y reconocimiento de  todo el 
    lugar y los materiales hallados
4. Se realiza la incautación de todos los componentes materiales 
    allí encontrados
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Estamos tratando con agentes legales, entonces debemos realizar 
    un análisis de que tipo de preparados se están realizando
2. Una vez realizado el estudio de los preparado, por ser en 
    una cantidad muy significante  se procede a incautar los 
    elementos principales
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)

(defrule regla31
    (Liberacion_alta_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?pregunta "los agentes químicos son ilegales y  tienen fines desconocidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Tenemos un caso de terrorismo con agentes químicos con probabilidad 
    de 95 %  certero, por tanto procedemos inmediatamente a  realizar 
    la búsqueda de la central que elabora estos químicos ilegales
2. Realizamos la incautación de los agentes y  detención de los 
    partícipes del hecho, para ello enviamos efectivos militares 
    bien armados y un grupo especial en agentes quimicos
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "liberacion.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final revisar
1. Se realiza un control policial eventualmente al 
    lugar afectado
    ===== FIN CONSULTA DE TERRORISMO =====")   
    )
)