Feature: CAMARA Traffic Influence API, vwip - Operation postTrafficInfluenceDevice
  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  #
  # Testing assets:
  # * The optimal routing for a device must be activated
  #
  # References to OAS spec schemas refer to schemas specifies in traffic-influence.yaml

  Background: Common traffic-influence-devices setup
    Given the path "/traffic-influence/vwip/traffic-influence-devices"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"
    And the request body is set by default to a request body compliant with the schema

  # Happy path scenarios

  # Mandatory valid parameters

  # Mandatory valid parameters for POST with 2-legs authentication
  @TI_Resource_LCM_Mandatory_Parameters_Valid_CREATE_2-legs
  Scenario: Create Traffic Influence (TI) Resource with mandatory parameters with 2 legs
    Given the request body property with mandatory valid parameters ("$.apiConsumerId", "$.appId", "$.device")
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then it should be created a new TI Resource and the optimal routing will be activated for any user on any location
    And Response Code is 201
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And response contains the TI Resource with the resource identifier ("$.trafficInfluenceID") set to a unique value
    And the status of the request ("$.state=ordered")
    And the previously used parameters set as in the POST request
    # The received callback must be compliant and should carry the aspected values
    And within a limited period of time I should receive a callback at "/components/schemas/NotificationSink/sink"
    And the callback body is compliant with the OAS schema at "/components/callbacks/onTrafficInfluenceChanged" with "x-correlator" having the same value as the request header "x-correlator"
    And the callback carries the information defined in "/components/schemas/CloudEvent"
    And "/components/schemas/CloudEvent" in the callback should contain the parameter ("$.state") set accordingly to the result
    And if ("$.device") is used with multiple identifiers, only the one used by the network is returned

  # Mandatory valid parameters for POST with 3-legs authentication
  @TI_Resource_LCM_Mandatory_Parameters_Valid_CREATE_3-legs
  Scenario: Create Traffic Influence (TI) Resource with mandatory parameters with 3 legs
    Given the request body property with mandatory valid parameters ("$.apiConsumerId", "$.appId")
    And the request body is set to a valid request body
    And The header "Authorization" is set to a valid access token identifying a device
    When the HTTP "POST" request is sent
    Then it should be created a new TI Resource and the optimal routing will be activated for any user on any location
    And Response Code is 201
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And response contains the TI Resource with the resource identifier ("$.trafficInfluenceID") set to a unique value
    And the status of the request ("$.state=ordered")
    And the previously used parameters set as in the POST request
    # The received callback must be compliant and should carry the aspected values
    And within a limited period of time I should receive a callback at "/components/schemas/NotificationSink/sink"
    And the callback body is compliant with the OAS schema at "/components/callbacks/onTrafficInfluenceChanged" with "x-correlator" having the same value as the request header "x-correlator"
    And the callback carries the information defined in "/components/schemas/CloudEvent"
    And "/components/schemas/CloudEvent" in the callback should contain the parameter ("$.state") set accordingly to the result
    And if the device in the authorization token included multiple identifier, only the one used by the network is returned

  # Optional valid parameters

  # Optional valid parameters for POST with 2-legs authentication
  @TI_Resource_LCM_Optional_Parameters_Valid_CREATE_2-legs
  Scenario: Create Traffic Influence (TI) Resource with also optional parameters with 2 legs
    Given the request body property with mandatory valid parameters ("$.apiConsumerId", "$.appId", "$.device")
    And any other optional parameters (e.g. "$.AppInstanceId", "$.zone" etc.)
    And the request body is set to a valid request body
    When the HTTP "POST" request is sent
    Then it should be created a new TI Resource
    And the optimal routing will be activated according to the optional parameters specified (e.g. only in a specific zone or for a specific user)
    And Response Code is 201
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And response contains the TI Resource with the resource identifier ("$.trafficInfluenceID") set to a unique value
    And the status of the request ("$.state=ordered")
    And the previously used parameters set as in the POST request
    # The received callback must be compliant and should carry the aspected values
    And within a limited period of time I should receive a callback at "/components/schemas/NotificationSink/sink"
    And the callback body is compliant with the OAS schema at "/components/callbacks/onTrafficInfluenceChanged" with "x-correlator" having the same value as the request header "x-correlator"
    And the callback carries the information defined in "/components/schemas/CloudEvent" with the parameter ("$.state") set accordingly to the result
    And if ("$.device") is used with multiple identifier, only the one used by the network is returned

  # Optional valid parameters for POST with 3-legs authentication
  @TI_Resource_LCM_Optional_Parameters_Valid_CREATE_3-legs
  Scenario: Create Traffic Influence (TI) Resource with also optional parameters with 3 legs
    Given the request body property with mandatory valid parameters ("$.apiConsumerId", "$.appId")
    And any other optional parameters (e.g. "$.AppInstanceId", "$.zone" etc.) with the request body set to a valid request body
    And The header "Authorization" is set to a valid access token identifying a device
    When the HTTP "POST" request is sent
    Then it should be created a new TI Resource
    And the optimal routing will be activated according to the optional parameters specified (e.g. only in a specific zone or for a specific user)
    And Response Code is 201
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And response contains the TI Resource with the resource identifier ("$.trafficInfluenceID") set to a unique value
    And the status of the request ("$.state=ordered")
    And the previously used parameters set as in the POST request
    # The received callback must be compliant and should carry the aspected values
    And within a limited period of time I should receive a callback at "/components/schemas/NotificationSink/sink"
    And the callback body is compliant with the OAS schema at "/components/callbacks/onTrafficInfluenceChanged" with "x-correlator" having the same value as the request header "x-correlator"
    And the callback carries the information defined in "/components/schemas/CloudEvent" with the parameter ("$.state") set accordingly to the result
    And if the device in the authorization token included multiple identifier, only the one used by the network is returned