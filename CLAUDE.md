# Instalaciones Domóticas · 2MT — I.E.S. Trinidad Arroyo (Palencia)

Web de clase del módulo de Instalaciones Domóticas (grupo 2MT): apuntes y prácticas en PDF, animaciones HTML de los esquemas y tests. Se publica con **GitHub Pages** desde la rama `main`, carpeta raíz:
**https://bernardotorio.github.io/domotica/** (repositorio `BernardoTorio/domotica`, carpeta local `C:\dev\domotica`).

Es la misma web que la de Automatismos (`BernardoTorio/automatismos`), con otros colores y otro contenido: **las tres webs (automatismos, domotica, maquinas) se tienen que mover igual**. Antes de cambiar la portada, la tira de las animaciones o el motor de los tests, mira cómo está hecho en Automatismos y copia de allí.

Los alumnos entran desde **códigos QR impresos**, que apuntan a `https://bernardotorio.github.io/domotica/<archivo>.html`. Por eso:
- **Los nombres de archivo no se cambian nunca**: al corregir algo se sobrescribe el mismo archivo.
- **Las animaciones y los tests se quedan en la raíz.**
- **Los nombres de las pestañas (`#animaciones`, `#temas`, `#practicas`, `#tests`) no se cambian.**

## Estructura del repositorio
```
index.html                 portada: «Ahora en clase», el curso tema a tema y las pestañas Apuntes, Prácticas, Animaciones y Tests
p1-1.html … p1-5.html      Práctica 1: soluciones animadas de los ejercicios 1.1 a 1.5
p2-1.html                  Práctica 2: solución animada del 2.1 (persiana), con «Solución antigua» y «Solución mejorada»
pnp-npn.html               Tema 2: sensores PNP y NPN
plc-entradas.html          Tema 2: cablear las entradas del autómata
plc-salidas.html           Tema 2: cablear las salidas del autómata
plc-cronograma.html        Tema 2: temporizadores del LOGO! (retardo a la conexión y a la desconexión) con el cronograma en directo; adaptada de cronograma_temporizadores.html de Automatismos
plc-usos.html              Tema 2: «Usos de retardos»; cinco usos, cada uno con su trozo de programa en FUP, su cronograma y para qué sirve; es la usos_temporizadores.html de Automatismos pasada al LOGO!
test_bloque1.html          Test Bloque 1 (Tema 1 y Prácticas 1 y 2): 89 preguntas, 9 figuras
test_bloque2.html          Test Bloque 2 (Tema 2 y Práctica 4): 100 preguntas (40 del tema y 60 de la práctica, con sus E/S), 16 figuras; sin letras de medida (no hay esquema de cableado: es el entregable 1 de la P4)
temas/                     apuntes en PDF (tema1-sensores-actuadores.pdf, tema2-automata-programable.pdf)
practicas/                 enunciados en PDF (2MT-P1.pdf, 2MT-P2.pdf, 2MT-P3.pdf, plantilla-logo-doble.pdf, 2MT-P4.pdf)
subir.bat                  publica todo con doble clic
.gitignore                 *.zip, *.docx y «Claude outputs/»: no se suben nunca
```
- Apuntes y prácticas se suben **solo en PDF**. Para actualizar uno, se sustituye el PDF con el **mismo nombre**.

## index.html
- Arriba, el bloque **«Ahora en clase»**: el tema que se está dando, con sus apuntes, sus prácticas (PDF) y sus animaciones en orden. Al pasar de tema solo se cambia un número: `var HOY = 2;`, al final del archivo. Los temas están en la lista `T` que va justo debajo (`chips`: lo que hay de cada tema; los que son PDF salen también como botones en «Ahora en clase»; `ruta`: sus animaciones, en orden).
- Después, una fila de pestañas: `#inicio` («Por temas», por defecto: el curso tema a tema, el último arriba), `#temas` (Apuntes), `#practicas`, `#animaciones` y `#tests`. Las secciones tienen id `sec-inicio`, `sec-temas`, `sec-practicas`, `sec-animaciones` y `sec-tests`, para que el navegador no salte al abrir con `#…`.
- Aspecto: el de la portada de Automatismos con los colores de Domótica. El raíl de arriba es **marrón con una «L»** y el de abajo, **azul con una «N»** (`--fase` y `--neutro`).
- En todas las páginas, la primera miga («Domótica») lleva a `index.html`.
- **Marca «✓ vista»**: las animaciones que ya se han abierto en ese navegador salen marcadas (clave `visto:<archivo>` en `localStorage`). La pone la portada al tocar una tarjeta y, además, cada animación al abrirse (también desde un QR). No se marca en los tests.
- Temas y Prácticas: un recuadro por PDF con enlace `download`. Si el PDF todavía no está en el servidor, un `fetch HEAD` lo marca en gris como «próximamente».
- Las soluciones animadas de las prácticas aparecen en dos sitios: en Prácticas y en Animaciones.
- Animaciones: un grupo por práctica o tema (Práctica 1, Práctica 2, Tema 2), en el orden en que se dan. Cada animación nueva se añade con una tarjeta (número, título y una línea) en su grupo y, si es del tema actual, en la `ruta` de la lista `T`.
- Tests: una tarjeta por test; el test vuelve a `index.html#tests`.

## Animaciones
- Un único archivo `.html` con todo dentro (solo Google Fonts de fuera), con modo claro y oscuro. Vuelven a `index.html#animaciones` (botón ←, Esc).
- Debajo de la barra de arriba, la tira `.tira` del grupo: «‹ anterior · Práctica 1 · k de N · siguiente ›» y todos los pasos del grupo. Al final de la página, botón grande «Siguiente» (`.nextbig`); en la última del grupo, «Has llegado al final de… · Volver a las animaciones». **Si se añade o se quita una animación de un grupo, hay que actualizar la tira en todas las del grupo.**
- En la tira, las animaciones ya abiertas llevan un ✓.
- La **corriente** se muestra de forma **sutil**, como en Automatismos: puntos pequeños y claros que se mueven por dentro del cable (`.flow`: `stroke:#FFE28A; stroke-width:3; stroke-linecap:round; stroke-dasharray:0.5 15.5`, a 0,9 s por ciclo), solo por los caminos cerrados hasta un consumo y sin huecos. Nada de la línea amarilla a trazos. Vale para las animaciones hechas y para las que se hagan.
- Las explicaciones van en cajones **debajo del dibujo**: «Qué está pasando» (cambia en cada momento) y, justo debajo, un cajón fijo **«Para qué sirve»** (`.pqs`, dos o tres frases). Después, IDEA CLAVE, ¡OJO!, EN EL TALLER…
- En `plc-entradas.html` y `plc-salidas.html` los cajones los monta `setText()`: el de «Para qué sirve» está en la constante `PQS`.
- En las animaciones de temporizadores, **el tiempo T va de 1 a 5 s** (por defecto, 3 s): con tiempos más largos se hace eterno esperar. «Pulsos cortos» son de medio segundo.
- `plc-usos.html` se llama **«Usos de retardos»** (título, tira y portada) y es **una animación aparte**, la 5.ª del Tema 2: los usos no van debajo de «Retardos». Lleva los mismos **cinco usos** que `usos_temporizadores.html` de Automatismos, con los mismos nombres y en el mismo orden: 1 Se para solo (relé autoenclavador + retardo a la conexión que le hace reset: la persiana del 4.5 y el 4.8), 2 Arranca más tarde (retardo a la conexión con una señal que se queda a 1: el crepuscular S2, I4, que se toca y se queda como lo dejas), 3 Sigue un rato más (a la desconexión; con un cajón con la diferencia con el caso 1: aquí cada pulsación reinicia el tiempo), 4 Hay que mantener pulsado (el mismo programa que el 2, con un pulsador) y 5 Filtro de señales dudosas (el mismo programa que el 3, con el detector S3, I7, y una señal que va y viene; allí lo normal son 20-90 s y aquí 0,5-2 s). Se abre en un caso con `#1`…`#5`. Cada caso lleva, de izquierda a derecha, **el trozo de programa en FUP**, **el cronograma** (uno de ejemplo ya dibujado, «Ver cómo funciona» y en directo; solo dos filas, la entrada y la salida) y **«Para qué sirve»**; debajo del programa y del cronograma, «Qué está pasando». Aquí «Para qué sirve» va a la derecha de cada caso y por eso no lleva el cajón fijo `.pqs` (en `tira_domotica.py`, `PQS = None`). **No lleva el extractor del 4.7** (conexión seguida de desconexión): su cronograma es lo que se entrega. Las clases propias empiezan por `us-` (no usar `ejs`: el guion de la tira borra ese nombre).
- Las del Tema 2 no llevan número: en la tira y en la portada se llaman «PNP y NPN», «Entradas», «Salidas», «Retardos» (el cronograma de los temporizadores; la P4 lleva un QR a `plc-cronograma.html`) y «Usos de retardos» (`plc-usos.html`). En el móvil (menos de 460 px), para que quepan cinco pasos, el ✓ de «ya vista» va debajo del nombre y las flechas largas se parten en dos líneas. En la portada, la fila de «Ahora en clase» con nombres (no números) pasa en el móvil a 3 columnas (`.ruta.pal`).

## Tests
Mismo motor que los tests de Automatismos (`DATA`, `IMGS`, `show`, `paint`, `answer`, `result`). Si se mejora el motor en un sitio, se lleva a todos.

### Mapa y test a medias
- A la izquierda, el mapa de preguntas con colores (verde, rojo, gris) y, a la derecha, «Cómo vas»; en el móvil, una barra abajo que abre el mapa.
- El test a medias **se guarda solo en ese navegador** (`localStorage`, clave `testProg:<archivo>`): al volver, la pantalla de inicio ofrece «Seguir donde lo dejé» o «Borrarlo». Se borra al terminarlo entero.
- Al fallar, el mensaje dice «La buena es la opción C».

### Letras en los puntos de medida
- En cada esquema sobre el que se mide, los tornillos donde se pone una punta van marcados con una **letra en una bolita amarilla** (A, B, C…), una serie por figura. No se usan I, L, N ni O (se confunden con el 1, la fase, el neutro y el 0).
- En `DATA` los puntos se escriben con la letra en círculo (`Ⓐ`, `Ⓑ`…): el test (`pts()`) la pinta como la bolita del dibujo, y así no se confunde con las opciones A-B-C-D.
- La pregunta lleva solo la letra («negra en N y roja en Ⓒ»); el **«¿Por qué?» empieza diciendo qué tornillo es** («Ⓒ es el A1 de KA1.»). `L`, `N`, `+` y `−` se siguen llamando así.
- Si la respuesta nombra los mismos puntos, también va con letras («Ⓑ → 230 V · Ⓒ → 0 V», «En el cable que va de Ⓐ a Ⓑ»).
- Al poner letras **no se cambia qué se mide**. Si un tornillo no está dibujado en el esquema, la pregunta se queda con números (la 54: el 14 de KA1 no sale en el esquema del 2.1).
- Las figuras con letras llevan al final del pie «Las letras marcan los puntos de medida.».
- Letras de cada figura de `test_bloque1.html`:
  - Ejercicio 1.1 (`f11.png`): Ⓐ el 12 del termostato S2 · Ⓑ el borne L de la toma TC1.
  - Ejercicio 1.4 (`f14.png`): Ⓐ la salida LS del detector S1.
  - Ejercicio 1.5 (`f15.png`): Ⓐ Ⓑ el 11 y el 12 del termostato S3 · Ⓒ Ⓓ el A1 y el A2 de KA1 · Ⓔ Ⓕ el 11 y el 14 de KA1.
  - Ejercicio 2.1 (`f21.png`): Ⓐ Ⓑ Ⓒ el 11, el 12 y el 14 del crepuscular S2 · Ⓓ Ⓔ Ⓕ el 11, el 14 y el 24 del pulsador S1 · Ⓖ Ⓗ el 11 y el 12 de KA1 · Ⓙ Ⓚ el A1A y el A2 del motor M1.
- Las figuras van dentro del test (`IMGS`, en base64).
- El modo **«En orden» coincide con el test en papel** (mismo número y mismo orden de respuestas). Si se cambia una pregunta, hay que generar de nuevo el Word de preguntas y el de soluciones a partir de `DATA`.

## Criterios de dibujo de los esquemas de Domótica (obligatorios)
- **Colores**: 230 Vca, fase **marrón** y neutro **azul**; 12 Vcc, positivo **rojo** y negativo **negro**. Símbolos, nombres y números en negro. Tierra en verde, discontinua.
- **Nombres** de los aparatos a la izquierda del símbolo; **números de bornes** pegados al símbolo y a la derecha del hilo.
- Todos los bornes con nombre: motor de persiana A1A (subir), A1B (bajar) y A2; válvulas y electroválvulas A1-A2; contactos conmutados 11-12-14; bombillas X1-X2; enchufes L/N/PE.
- Letras: bombilla E, señalización H, enchufe TC; sensores, pulsadores e interruptores S; relé auxiliar KA; magnetotérmico Q; motor M; electroválvula Y.
- Todo se dibuja en reposo. Consumos (bombillas, bobinas, motores) abajo del todo y a la misma altura.
- Relé auxiliar: común arriba (11, 21) y NC/NA abajo (12-14, 22-24).
- «Borne» = **tornillo** del aparato (así lo entienden mejor).

## Los Word originales: `C:\dev\originales`
Los PDF de esta web salen de un Word. Los Word no se suben a GitHub, pero **no se pierden**: están en `C:\dev\originales` (en el PC del profesor, fuera de git), con todas sus versiones. Es la misma carpeta para las tres webs (automatismos, domotica, maquinas).
```
C:\dev\originales\
  automatismos\  domotica\  maquinas\
    temas\  practicas\  ejercicios\  tests\  examenes\  programacion\  otros\
      tema2-automata-programable.docx                       ← la última versión
      versiones\tema2-automata-programable__2026-11-05_2245.docx      ← todas, con fecha y hora
  _sin_clasificar\   _registro\ (índice, log, pdf_sin_word.txt)   reglas.csv   LEEME.txt
```
- **El Word se llama igual que el PDF que se publica** (`temas\tema2-automata-programable.docx` → `temas/tema2-automata-programable.pdf`) y lleva la asignatura en el nombre (`…_Automatismos`, `2MT-…`, `…_Maquinas_2MB`), para que se coloque solo.
- **Para cambiar un PDF publicado se parte de su Word de `C:\dev\originales`** (la última versión o, si hace falta, una de `versiones\`). Nunca se rehace un Word a partir del PDF sin mirar antes ahí; si no está (lo dice `_registro\pdf_sin_word.txt`), se avisa al profesor antes de reconstruirlo.
- **Todo Word nuevo o cambiado se guarda en su sitio de `C:\dev\originales`** en cuanto está hecho. Antes de escribir encima de la última versión, si en `versiones\` no está ya `nombre__AAAA-MM-DD_HHMM.docx` con la fecha de esa última, se copia allí con ese nombre. Si la sesión no tiene la carpeta, se pide acceso; si no se puede, el Word se deja en esta carpeta o en «Claude outputs» y la tarea de la noche lo recoge. Si un Word se llama distinto que su PDF, se añade su línea en `C:\dev\originales\reglas.csv`.
- Una tarea de Windows («Archivo de Word de clase», cada día a las 23:00 o al encender) guarda en `versiones\` los Word nuevos o cambiados de las tres webs (también «Claude outputs»), de Descargas y del propio archivo, y pone arriba la última. No mueve ni borra nada. Para que pase ya: `C:\dev\originales\archivar_ahora.bat`.

## Cómo se trabaja y cómo se publica
- Los cambios de aspecto y de motor son de **forma**. Si un cambio toca lo que se explica o lo que se pregunta, se le pregunta antes al profesor.
- Cada cambio se prueba en escritorio y en móvil (400 px), en claro y en oscuro, y después en la web publicada.
- Un commit claro por bloque, a `main`. **No subir nunca zips ni .docx.**
- Con el `.bat`: doble clic en `subir.bat`. Si hay un `domotica*.zip` (aquí o en Descargas) lo descomprime y lo aparta; después hace `git add -A`, commit con fecha, `git pull` y `push`. Recargar con **Ctrl+F5** si se ve la versión vieja.
- **Ojo con `subir.bat`**: solo trae lo que hay en GitHub cuando en la carpeta hay cambios que subir y, si los dos lados han tocado lo mismo, **se queda con lo de la carpeta** (`-X ours`). Por eso, antes de editar nada en `C:\dev\domotica` hay que tenerla al día (`git pull`); si no, un archivo viejo de la carpeta puede deshacer lo publicado.
