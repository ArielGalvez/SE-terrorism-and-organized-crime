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
;;;;;;;;;;;;;; INICIO REGLAS BASE DEL CONOCIMIENTO CRIMEN ORGANIZADO ;;;;;;;;;;;

(defrule regla1
    (Elija_tipo_problema)
    =>
   
   (?*VENTANA* setMemoriaTrabajo " 
    ===== NUEVA CONSULTA DE CRIMEN ORGANIZADO =====
Sistema : Elija su tipo de problema:")

    (bind ?pregunta "Elija su tipo de problema:")
    (bind ?opciones (new ArrayList))
    ;;;;;;;;;;;;;;;; Aqui elejimos los diferentes problemas a tratar
    (?opciones add  "Narcoactividad (narcotrafico en distintos lugares del pais)")
    (?opciones add  "Lavado de activos (falsificación de dinero)")
    (?opciones add  "Contrabando")
    (?opciones add  "Secuestros")
    (?opciones add  "Robo de vehiculos")
    ; Aquie esta la respuesta obtenida y nos muestra el cuadro de informacion
    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    ;Aqui la opcion seleccionada de la interface preguntas
    (if (eq ?respuesta "Narcoactividad (narcotrafico en distintos lugares del pais)")
         then (assert(Narcoactividad)))
    (if (eq ?respuesta "Lavado de activos (falsificación de dinero)")
             then (assert(Lavado)))
    (if (eq ?respuesta "Contrabando")
             then (assert(Contrabando)))
    (if (eq ?respuesta "Secuestros")
             then (assert(Secuestro)))
    (if (eq ?respuesta "Robo de vehiculos")
             then (assert(Robo)))
)

;;;;;;;;;;;;;;;;;;;;;; REGLAS DE NARCOACTIVIDAD ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule regla2
    (Narcoactividad)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : De que tipo de crimen estamos hablando?")

    (bind ?pregunta "De que tipo de crimen estamos hablando?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Narcoactividad leve")
    (?opciones add  "Narcoactividad media")
    (?opciones add  "Narcoactividad de alto riezgo")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Narcoactividad leve")
            then (assert(Narcoactividad_baja) ))
    (if (eq ?respuesta "Narcoactividad media")
            then (assert(Narcoactividad_media) ))
    (if (eq ?respuesta "Narcoactividad de alto riezgo")
            then (assert(Narcoactividad_alta) ))
)
(defrule regla3
    (Narcoactividad_baja)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe una división del trabajo, con lineas de")
    (?*VENTANA* setMemoriaTrabajo "                 roles de liderazgo claramente definidos?")
    (bind ?pregunta "Existe una división del trabajo, con lineas de
roles de liderazgo claramente definidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Narcoactividad_baja_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Narcoactividad_baja_no) ))
)
(defrule regla4
    (Narcoactividad_media)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe una división del trabajo, con lineas de")
    (?*VENTANA* setMemoriaTrabajo "                 roles de liderazgo claramente definidos?")
    (bind ?pregunta "Existe una división del trabajo, con lineas de
roles de liderazgo claramente definidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Narcoactividad_media_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Narcoactividad_media_no) ))
)

(defrule regla5
    (Narcoactividad_alta)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe una división del trabajo, con lineas de")
    (?*VENTANA* setMemoriaTrabajo "                 roles de liderazgo claramente definidos?")
    (bind ?pregunta "Existe una división del trabajo, con lineas de
roles de liderazgo claramente definidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Narcoactividad_alta_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Narcoactividad_alta_no) ))
)

(defrule regla6
    (Narcoactividad_baja_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : Conclusion final
1. Trabajar con los niños y jóvenes para detener la distribución de micro 
    trafico de drogas
2. Politicas de Prevención Social de la Drogadicción y Rehabilitación del 
    Adicto
3. Politicas de Prevención Educativa 
4. Politicas de Seguridad 
5. Politicas de prevención, detección y sanción del lavado de dinero 
    proveniente del narcotrafico 
6. Fortalecimiento del Poder Judicial y del Ministerio Publico Fiscal
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : Conclusion final
1. Politicas de Prevención Educativa
2. Fortalecimiento del Poder Judicial y del Ministerio Publico Fiscal
3. Efectuar un diagnóstico de los recursos disponibles necesarios 
    para realizar una adecuada labor en los juzgados y fiscalias en
    cada jurisdicción.
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla7
    (Narcoactividad_baja_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : Conclusion final
1. Trabajar con los niños y jóvenes para detener la distribución de micro
    trafico de drogas
2. Elaborar un plan integral de prevención universal (marketing social preventivo)
    , selectivo (grupos de riesgo) e indicado (grupos de consumo problematico)
3. Adecuar los recursos tecnicos y materiales para abordar los
    tratamientos que demanden las nuevas sustancias.
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : Conclusion final
1. Politicas de Seguridad 
2. Politicas de prevención, detección y sanción del lavado de dinero 
    proveniente del narcotrafico 
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla8
    (Narcoactividad_media_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Crear una Agencia Nacional de Inteligencia Narcocriminal o Agencia 
    Federal Antidrogas, cuya función sea la de servir como instrumento 
    de investigación para la Justicia y el Ministerio Publico
2. Instaurar unidades seleccionadas de policia de proximidad social, 
    ya que resulta ser en esencia el verdadero policia preventivo quien 
    identifica al adicto y lo diferencia del narcomenudista, colaborando 
    y orientando al primero y asegurando al segundo, entre otras funciones.
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")  
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Establecer redes de cooperación internacional, de caracter regional, 
    partiendo de la base del Consejo Suramericano sobre el Problema Mundial 
    de las Drogas, instancia permanente de la Unión de Naciones Suramericanas 
    (UNASUR). Y proponer una instancia similar en el MERCOSUR.
2. Radarizar la totalidad del espacio aereo argentino, de manera similar
    a lo ya realizado por Brasil, con una superficie mucho mayor que la nuestra.
3. Que retorne la DEA a Bolivia
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla9
    (Narcoactividad_media_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Crear una Agencia Nacional de Inteligencia Narcocriminal o Agencia 
    Federal Antidrogas, cuya función sea la de servir como instrumento 
    de investigación para la Justicia y el Ministerio Publico
2. Que retorne la DEA a Bolivia
3. Crear Consejos Barriales de Participación Ciudadana como herramientas 
    clave para combatir el narcomenudeo a partir de la reconstitución del 
    tejido sociocomunitario, priorizando la concientización sobre la nocividad 
    del consumo y brindando espacios seguros y anónimos para la realización de denuncias.
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Controlar el trafico ilicito
2. Reprimir el trafico ilicito
3. Cooperar entre los órganos nacionales de seguridad
4. Armonizar las normas penales y civiles
5. Prevenir la drogadicción
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla10
    (Narcoactividad_alta_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Adecuar los hospitales generales para la atención de usuarios problematicos
    de sustancias psicoactivas y reconvertir los centros monovalentes en 
    polivalentes, asegurando los recursos materiales, asi como tambien la 
    capacitación necesaria para el cuerpo profesional y tecnico, de acuerdo 
    con lo establecido en la ley.
2. Adecuar los recursos tecnicos y materiales para abordar los tratamientos 
    que demanden las nuevas sustancias.
3. Elaborar un plan integral de prevención universal (marketing social 
    preventivo), selectivo (grupos de riesgo) e indicado (grupos de consumo problematico)
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Elaborar un proceso para la rapida incorporación de nuevos estupefacientes
    a la normativa, facilitando los peritajes y las condenas correspondientes.
    Para ello, tambien deberan adquirirse nuevas tecnologias y capacitar al 
    recurso humano en su utilización
2. Efectuar un diagnóstico de los recursos disponibles necesarios para realizar 
    una adecuada labor en los juzgados y fiscalias en cada jurisdicción.
3. Politicas de Seguridad
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla11
    (Narcoactividad_alta_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Crear Consejos Barriales de Participación Ciudadana como herramientas 
    clave para combatir el narcomenudeo a partir de la reconstitución del 
    tejido sociocomunitario, priorizando la concientización sobre la nocividad 
    del consumo y brindando espacios seguros y anónimos para la realización de denuncias.
2. Crear una Agencia Nacional de Inteligencia Narcocriminal o Agencia 
    Federal Antidrogas, cuya función sea la de servir como instrumento de 
    investigación para la Justicia y el Ministerio Publico
3. Que regrese la DEA a Bolivia
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "narcotrafico.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Reformular las resoluciones de la Unidad de Información Financiera (UIF) 
    en el marco de los limites constitucionales, incluyendo un sistema de 
    premios y castigos para los sujetos obligados que contribuyan activamente 
    en la prevención del crimen organizado.
2. Elaborar un plan integral de prevención universal (marketing social preventivo),
    selectivo (grupos de riesgo) e indicado (grupos de consumo problematico).
3. Adecuar los hospitales generales para la atención de usuarios problematicos
     de sustancias psicoactivas y reconvertir los centros monovalentes en 
    polivalentes, asegurando los recursos materiales, asi como tambien la 
    capacitación necesaria para el cuerpo profesional y tecnico, de acuerdo 
    con lo establecido en la ley.
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

;;;;;;;;;;;;;;;;;;;;;; REGLAS DE LAVADO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule regla12
    (Lavado)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : De que tipo de crimen estamos hablando?")

    (bind ?pregunta "De que tipo de crimen estamos hablando?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Lavado de dinero leve")
    (?opciones add  "Lavado de dinero medio")
    (?opciones add  "Lavado de dinero alto")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Lavado de dinero leve")
            then (assert(Lavado_baja) ))
    (if (eq ?respuesta "Lavado de dinero medio")
            then (assert(Lavado_media) ))
    (if (eq ?respuesta "Lavado de dinero alto")
            then (assert(Lavado_alta) ))
)
(defrule regla13
    (Lavado_baja)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe una división del trabajo, con lineas de")
    (?*VENTANA* setMemoriaTrabajo "                 roles de liderazgo claramente definidos?")
    (bind ?pregunta "Existe una división del trabajo, con lineas de
roles de liderazgo claramente definidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Lavado_baja_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Lavado_baja_no) ))
)
(defrule regla14
    (Lavado_media)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe una división del trabajo, con lineas de")
    (?*VENTANA* setMemoriaTrabajo "                 roles de liderazgo claramente definidos?")
    (bind ?pregunta "Existe una división del trabajo, con lineas de
roles de liderazgo claramente definidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Lavado_media_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Lavado_media_no) ))
)

(defrule regla15
    (Lavado_alta)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe una división del trabajo, con lineas de")
    (?*VENTANA* setMemoriaTrabajo "                 roles de liderazgo claramente definidos?")
    (bind ?pregunta "Existe una división del trabajo, con lineas de
roles de liderazgo claramente definidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Lavado_alta_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Lavado_alta_no) ))
)

(defrule regla16
    (Lavado_baja_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Evitar el riesgo sobre el servicio ofrecido
2. Dar recomendaciones sobre este servicio a los clientes
3. Recomendaciones para las empresas que ofrezcan servicio de seguridad de billetes
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Dar recomendaciones sobre los riesgos de distribución
2. Dar recomendaciones sobre los canales de distribución
3. Evitar riesgos en los mercados
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla17
    (Lavado_baja_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Dar recomendaciones para evitar recibir recursos ilicitos por medio 
    de cuentas por cobrar
2. Dar recomendaciones para la financiación de clientes, al momento 
    d retirar dinero
3. Contrarrestar el riesgo de operaciones de comercio exterior
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Mejorar la politica de manejo de divisas
2. Luchar contra el lavado de activos; financiamiento del terrorismo 
    y financiamiento de la proliferación
3. Aplicar medidas preventivas para el sector financiero y otros 
    sectores designados
4. Establecer poderes y responsabilidades (por ejemplo. autoridades 
    investigativas, de orden publico y de supervisión) y otras 
    medidas institucionales
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla18
    (Lavado_media_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Mejorar la transparencia y la disponibilidad de la información de 
    titularidad de beneficio de las personas y estructuras juridicas
2. Debe prohibirse a las instituciones financieras que mantengan 
    cuentas anónimas o cuentas con nombres obviamente ficticios.
3. Identificar al cliente y verificar la identidad del cliente 
    utilizando documentos, datos o información confiable, de fuentes independientes.
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")  
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Aplicar medidas preventivas para el sector financiero y otros 
    sectores designados
2. Dar recomendaciones para la financiación de clientes, al 
    momento d retirar dinero
3. Contrarrestar el riesgo de operaciones de comercio exterior
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla19
    (Lavado_media_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Asegurar que el lavado de activos y el financiamiento del 
    terrorismo sean delitos extraditables
2. Establecer poderes y responsabilidades (por ejemplo. 
    autoridades investigativas, de orden publico y de supervisión) 
    y otras medidas institucionales
3. Evitar el riesgo sobre el servicio ofrecido
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Prohibir a las instituciones financieras el establecimiento 
    de sucursales u oficinas representativas en el pais en 
    cuestión o tomar en consideración el hecho de que la 
    sucursal u oficina representativa estaria en un pais 
    que no cuenta con adecuados sistemas
2. Exigir a las instituciones financieras que revisen y enmienden, 
    o si es necesario terminen, las relaciones corresponsales con 
    instituciones financieras en el pais dado
3. Exigir requisitos de auditoria externa mas profundos para los 
    grupos financieros con respecto a cualquiera de sus sucursales 
    y filiales ubicadas en el pais en cuestión
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla20
    (Lavado_alta_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Limitar las relaciones comerciales o transacciones financieras 
    con el pais identificado o personas identificadas en esa nación
2. Exigir requisitos de auditoria externa mas profundos para 
    los grupos financieros con respecto a cualquiera de sus sucursales 
    y filiales ubicadas en el pais en cuestión.
3. Mejorar la transparencia y la disponibilidad de la información de
     titularidad de beneficio de las personas y estructuras juridicas
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Dar recomendaciones para la financiación de clientes, al 
    momento d retirar dinero
2. Aplicar medidas preventivas para el sector financiero y 
    otros sectores designados
3. Exigir requisitos de auditoria externa mas profundos para 
    los grupos financieros con respecto a cualquiera de sus 
    sucursales y filiales ubicadas en el pais en cuestión.
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla21
    (Lavado_alta_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Identificar el alcance de las redes criminales y/o la escala de 
    la criminalidad
2. Identificar y rastrear activos del crimen, fondos terroristas u 
    otros activos que estan sujetos, o pudieran estar sujetos, a decomiso
3. Desarrollar evidencia que pueda ser utilizada en procesos penales
4. mejorar la transparencia y la disponibilidad de la información de 
    titularidad de beneficio de las personas y estructuras juridicas
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Prohibir a las instituciones financieras el establecimiento de 
    sucursales u oficinas representativas en el pais en cuestión 
    o tomar en consideración el hecho de que la sucursal u oficina 
    representativa estaria en un pais que no cuenta con adecuados sistemas
2. Debe prohibirse a las instituciones financieras que mantengan 
    cuentas anónimas o cuentas con nombres obviamente ficticios.
3. Aplicar medidas preventivas para el sector financiero y otros 
    sectores designados
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

;;;;;;;;;;;;;;;;;;;;;; REGLAS DE CONTRABANDO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule regla22
    (Contrabando)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : De que tipo de crimen estamos hablando?")

    (bind ?pregunta "De que tipo de crimen estamos hablando?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "Contrabando leve")
    (?opciones add  "Contrabando medio")
    (?opciones add  "Contrabando alto")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "Contrabando leve")
            then (assert(Contrabando_baja) ))
    (if (eq ?respuesta "Contrabando medio")
            then (assert(Contrabando_media) ))
    (if (eq ?respuesta "Contrabando alto")
            then (assert(Contrabando_alta) ))
)
(defrule regla23
    (Contrabando_baja)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe una división del trabajo, con lineas de")
    (?*VENTANA* setMemoriaTrabajo "                 roles de liderazgo claramente definidos?")
    (bind ?pregunta "Existe una división del trabajo, con lineas de
roles de liderazgo claramente definidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Contrabando_baja_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Contrabando_baja_no) ))
)
(defrule regla24
    (Contrabando_media)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe una división del trabajo, con lineas de")
    (?*VENTANA* setMemoriaTrabajo "                 roles de liderazgo claramente definidos?")
    (bind ?pregunta "Existe una división del trabajo, con lineas de
roles de liderazgo claramente definidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Contrabando_media_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Contrabando_media_no) ))
)

(defrule regla25
    (Contrabando_alta)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Existe una división del trabajo, con lineas de")
    (?*VENTANA* setMemoriaTrabajo "                 roles de liderazgo claramente definidos?")
    (bind ?pregunta "Existe una división del trabajo, con lineas de
roles de liderazgo claramente definidos?")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
            then (assert(Contrabando_alta_si) ))
    (if (eq ?respuesta "NO")
            then (assert(Contrabando_alta_no) ))
)

(defrule regla26
    (Contrabando_baja_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Evitar que personas inescrupulosas se dediquen a ese tipo de acto criminal.
2. Dar incentivos a personas ajenas para dar apoyo a militares en 
    cuestión a seguridad
3. Tener mas control en los puestos fronterizos por los militares
4. Incrementar los patrullajes en la zona de la frontera
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Realizar un control minucioso a la mercaderia que ingresa a Bolivia
2. Control en la aduana del pais de exportación, asi como el pais 
    de importación
3. Mas control en la aduana
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla27
    (Contrabando_baja_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Turnos mas rigurosos de control
2. Verificación con animales como perros para el control
3. Importaciones correctas y sin demoras
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Compra y venta de productos nacionales
2. Fomentar la calidad de productos de la mano de obra de Bolivia
3. Precios acordes a la oferta y demanda de nuestro pais en cuanto 
    a los productos nacionales contra los productos extranjeros
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla28
    (Contrabando_media_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Implementar con materiales e insumos de armas a los militares 
    para contrarrestar a los grandes contrabandeares
2. Implementar de luces infrarrojos en las fronteras y detectar 
    los camiones de contrabando
3. Dar un inventario de los camiones que salen con mercaderia 
    de la aduana extranjera
4. Tener controles en distintos puntos de la carretera
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")  
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Que los militares tengan turnos de control en puestos fronterizos
2. Instalación de camaras en lugares fundamentales
3. Que las camaras estan conectados a un servidor
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla29
    (Contrabando_media_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "lavado.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Concientizar a la población y proponer un incentivo para 
    denunciar este crimen
2. Elaborar un plan tanto educativo como militar para la 
    captura de estos criminales
3. Dotación de armamiento y perros q detectan lugares o 
    cosas similares
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion
1. Tener una bdd de los criminales y asi a ser seguimiento 
    a las familias q ue tienen sus datos reconocidos.
2. Actualizar las tecnologias de comunicación y dotar de 
    mejor implementación de comunicación(radios, brujulas , etc)
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla30
    (Contrabando_alta_si)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))

    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Realizar acuerdos entre paises para contrarrestar el contrabando
2. Medidas de seguridad mas acordes al tipo de frontera 
3. Militares y policias trabajar en conjunto
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Las personas esten mas comprometidas con el pais y asi poder 
    denunciar este acto crimina listico
2. Inversión del estado para el enfoque de matar el crimen 
    organizado de raiz
3. Mejorar la administracion entre empresas y asi poder 
    contrarrestar el crimen y mejorar los productos q se nos piden
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)

(defrule regla31
    (Contrabando_alta_no)
    =>
    (?*VENTANA* setMemoriaTrabajo "Sistema : Tiene la organización capacidad para obligar a")
    (?*VENTANA* setMemoriaTrabajo "                 otros, sean delincuentes o no? (intimidación)")
    (bind ?pregunta "Tiene la organización capacidad para obligar a
otros, sean delincuentes o no? (intimidación)")
    (bind ?opciones (new ArrayList))
    (?opciones add  "SI")
    (?opciones add  "NO")

    (bind ?respuesta (?*VENTANA* preguntar ?pregunta ?opciones))
    (?*VENTANA* setMemoriaTrabajo (str-cat "Usuario : " ?respuesta))
    
    (if (eq ?respuesta "SI")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final
1. Mejorar la producción y mediar los precios de los productos 
    con los precios de productos del exterior
2. Brindar información acerca de nuestro pais y de las cosas 
    que producen el crimen del contrabando
3. Equipamiento de punta a los militares ..para mejorar sus 
    destrezas y aptitudes en la lucha contra el contrabando
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )

    (if (eq ?respuesta "NO")
           then (?*VENTANA* setImagenResp "contrabando.png" )
       (?*VENTANA* setMemoriaTrabajo "Sistema : La conclusion final revisar
1. Mejorar la producción y mediar los precios de los productos 
    con los precios de productos del exterior
2. Brindar información acerca de nuestro pais y de las cosas 
    que producen el crimen del contrabando
3. Equipamiento de punta a los militares ..para mejorar sus 
    destrezas y aptitudes en la lucha contra el contrabando
    ===== FIN CONSULTA DE CRIMEN ORGANIZADO =====")   
    )
)