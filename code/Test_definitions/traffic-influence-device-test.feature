Feature: CAMARA Traffic Influence API, vWIP - Operation traffic-influece-devices
  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  #
  # Testing assets:
  # * The optimal routing for a device must be activated
  #
  Background: Common traffic-influence-devices setup
    Given the path "/traffic-influence-devices"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" is set to a UUID value
    And the request body is set by default to a request body compliant with the schema

  # Happy path scenarios

  # Mandatory valid paramenters

  # Mandatory valid paramenters for POST with 2-legs authentication
  @TI_Resource_LCM_Mandatory_Parameters_Valid_CREATE_2-legs
  Scenario: Create Traffic Influence (TI) Resource with mandatory parameters with 2 legs
    Given the request body property with mandatory valid parameters ("$.apiConsumerId", "$.applicationId", "$.device")
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then it should be created a new TI Resource and the optimal routing will be activated for any user on any location
    And Response Code is 201
    And response contains the TI Resource with the resource identifier ("$.trafficInfluenceID") set to a unique value

    And the status of the request ("$.state=ordered")
    And the previously used parameters set as in the POST request

    # The received callback must be compliant and should carry the aspected values
    And within a limited period of time I should receive a callback at "/components/schemas/NotificationSink/sink"
    And the callback body is compliant with the OAS schema at "/components/callbacks/onTrafficInfluenceChanged"
    And the callback carries the information defined in "/components/schemas/CloudEvent"
    And "/components/schemas/CloudEvent" in the callback should contain the parameter ("$.state") set accordingly to the result

    And if ("$.device") is used with multiple identifiers, only the one used by the network is returned


  # Mandatory valid paramenters for POST with 3-legs authentication
  @TI_Resource_LCM_Mandatory_Parameters_Valid_CREATE_3-legs
  Scenario: Create Traffic Influence (TI) Resource with mandatory parameters with 3 legs
    Given the request body property with mandatory valid parameters ("$.apiConsumerId", "$.applicationId")
    And the request body is set to a valid request body
    And The header "Authorization" is set to a valid access token identifying a device
    When the HTTP "POST" request is sent
    Then it should be created a new TI Resource and the optimal routing will be activated for any user on any location
    And Response Code is 201
    And response contains the TI Resource with the resource identifier ("$.trafficInfluenceID") valorised with a unique value
    And the status of the request ("$.state=ordered")
    And the previously used parameters set as in the POST request

    # The received callback must be compliant and should carry the aspected values
    And within a limited period of time I should receive a callback at "/components/schemas/NotificationSink/sink"
    And the callback body is compliant with the OAS schema at "/components/callbacks/onTrafficInfluenceChanged"
    And the callback carries the information defined in "/components/schemas/CloudEvent"
    And "/components/schemas/CloudEvent" in the callback should contain the parameter ("$.state") valorised accordingly to the result
    And if the device in the autorization token included multiple identifier, only the one used by the network is returned

  # Optional valid paramenters

  # Optional valid paramenters for POST with 2-legs authentication
  @TI_Resource_LCM_Optional_Parameters_Valid_CREATE_2-legs
  Scenario: Create Traffic Influence (TI) Resource with also optional parameters with 2 legs
    Given the request body property with mandatory valid parameters ("$.apiConsumerId", "$.applicationId", "$.device")
    And any other optional parameters (e.g. "$.instanceId", "$.zone" etc.)
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then it should be created a new TI Resource
    And the optimal routing will be activated according to the optional parameters specified (e.g. only in a specific zone or for a specific user)
    And Response Code is 201
    And response contains the TI Resource with the resource identifier ("$.trafficInfluenceID") set to a unique value

    And the status of the request ("$.state=ordered")
    And the previously used parameters valorised as in the POST request
    # The received callback must be compliant and should carry the aspected values
    And within a limited period of time I should receive a callback at "/components/schemas/NotificationSink/sink"
    And the callback body is compliant with the OAS schema at "/components/callbacks/onTrafficInfluenceChanged"
    And the callback carries the information defined in "/components/schemas/CloudEvent"
    And "/components/schemas/CloudEvent" in the callback should contain the parameter ("$.state") valorised accordingly to the result
    And if ("$.device") is used with multiple identifier, only the one used by the network is returned

  # Optional valid paramenters for POST with 3-legs authentication
  @TI_Resource_LCM_Optional_Parameters_Valid_CREATE_3-legs
  Scenario: Create Traffic Influence (TI) Resource with also optional parameters with 3 legs
    Given the request body property with mandatory valid parameters ("$.apiConsumerId", "$.applicationId")
    And any other optional parameters (e.g. "$.instanceId", "$.zone" etc.) with the request body set to a valid request body
    And The header "Authorization" is set to a valid access token identifying a device
    When the HTTP "POST" request is sent
    Then it should be created a new TI Resource
    And the optimal routing will be activated according to the optional parameters specified (e.g. only in a specific zone or for a specific user)
    And Response Code is 201
    And response contains the TI Resource with the resource identifier ("$.trafficInfluenceID") valorised with a unique value
    And the status of the request ("$.state=ordered")
    And the previously used parameters valorised as in the POST request
    # The received callback must be compliant and should carry the aspected values
    And within a limited period of time I should receive a callback at "/components/schemas/NotificationSink/sink"
    And the callback body is compliant with the OAS schema at "/components/callbacks/onTrafficInfluenceChanged"
    And the callback carries the information defined in "/components/schemas/CloudEvent"
    And "/components/schemas/CloudEvent" in the callback should contain the parameter ("$.state") valorised accordingly to the result
    And if the device in the autorization token included multiple identifier, only the one used by the network is returned