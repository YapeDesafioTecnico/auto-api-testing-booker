Feature: Servicio web de Gestion de reservas

  Background:
    Given que el usuario administrador obtenien el token de seguridad

   @HappyPaths
   Scenario Outline: Creacion, modificacion, busqueda y eliminacion de la misma reserva
    Given que el usuario admin crea una reserva para un cliente llega el <checkin> y se va el <checkout> con un <additionalneeds>
    When el usuario admin corrigue el <lastname> del cliente
    Then el sistema debera de traer la reserva cuando la busca con filtro de apellido
    And  usando el BookingId
    Then el usuario admin elimina la reserva

     Examples:
     |checkin|checkout|additionalneeds|lastname|
     |"2023-02-02"|"2023-02-12"|"BreakFast"|"Marin|

  @UnhappyPaths
  Scenario Outline: Creacion y busqueda de una reserva usando el nombre del cliente
    Given que el usuario admin crea una reserva para un cliente llega el <checkin> y se va el <checkout> con un <additionalneeds>
    Then el sistema debera de traer la reserva cuando la busca con filtro de nombre
    Then el usuario admin elimina la reserva
    Examples:
      |checkin|checkout|additionalneeds|
      |"2023-02-02"|"2023-02-12"|"BreakFast"|

  @HappyPaths
  Scenario Outline: Creacion, busqueda de una reserva usando la fecha de checkin
    Given que el usuario admin crea una reserva para un cliente llega el <checkin> y se va el <checkout> con un <additionalneeds>
    Then el sistema debera de traer la reserva cuando la busca con filtro de checkin
    Examples:
      |checkin|checkout|additionalneeds|
      |"2023-02-02"|"2023-02-12"|"BreakFast"|

  @UnhappyPaths
  Scenario: Actualizacion total de reserva para cliente
    Given que el usuario admin obtiene el bookingId de una reserva existente
    And obtenie los datos completos de la reserva
    When El usuario  admin actualiza la reserva enviando los datos completos de la reserva
    Then Los datos de la reserva actualizada