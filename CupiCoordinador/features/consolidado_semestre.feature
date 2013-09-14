Feature: Consolidado de un semestre
  Para optimizar la asignación de cursos por semestre
  El coordinador académico
  Debe poder ver un consolidado de posiles cupos de las materias que se van a dar en un semestre específicp

  Scenario: Ver el consolidado de un semestre
    Given El coordinador selecciono el semestre x

    When Presiona el boton de aceptar

    Then Se deberia verla informacion de las materias que se van a dar ese semestre

  Scenario: Aceptar sin ningun semestre seleccionado
    Given El coordinador no ha seleccionado ningun semestre

    When Presiona el boton de aceptar

    Then Se deberia ver un mensaje de error del semestre