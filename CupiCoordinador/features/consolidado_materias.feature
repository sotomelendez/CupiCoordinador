Feature: Consolidado de materias
  Para optimizar la asignación de cursos por semestre
  El coordinador académico
  Debe poder ver un consolidado de posiles cupos de una materia en los semestres que se tenga información

  Scenario: Ver el consolidado de una materia
    Given El coordinador selecciono la materia x

    When Presiona el boton de aceptar

    Then Se deberia verla informacion de la materia

  Scenario: Aceptar sin ninguna materia seleccionada
    Given El coordinador no ha seleccionado ninguna materia

    When Presiona el boton de aceptar

    Then Se deberia ver un mensaje de error