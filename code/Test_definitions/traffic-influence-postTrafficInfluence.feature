Feature: CAMARA Traffic Influence API, v0.10.0 - Operation postTrafficInfluence and patchTrafficInfluence and getAllTrafficInfluences and deleteTrafficInfluence
  # Input to be provided by the implementation to the tester
  #
  # Implementation indications:
  #
  # Testing assets:
  # * The optimal routing must be activated for any device
  #
  # References to OAS spec schemas refer to schemas specifies in traffic-influence.yaml

  Background: Common traffic-influences setup
    Given the path "/traffic-influence/v0.10/traffic-influences"
    And the header "Content-Type" is set to "application/json"
    And the header "Authorization" is set to a valid access token
    And the header "x-correlator" complies with the schema at "#/components/schemas/XCorrelator"
    And the request body is set by default to a request body compliant with the schema

  # Happy path scenarios

  # Mandatory valid parameters

  # Mandatory valid parameters for POST
  @TI_Resource_LCM_Mandatory_Parameters_Valid_CREATE
  Scenario: Create Traffic Influence (TI) Resource with mandatory parameters
    Given the request body property with mandatory valid parameters ("$.apiConsumerId", "$.appId")
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

  # Optional valid parameters

  # Optional valid parameters for POST
  @TI_Resource_LCM_Optional_Parameters_Valid_CREATE
  Scenario: Create Traffic Influence (TI) Resource with also optional parameters
    Given the request body property with mandatory valid parameters ("$.apiConsumerId", "$.appId")
    And any other optional parameters (e.g. "$.appInstanceId", "$.edgeCloudZoneId" etc.)
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
    And the callback carries the information defined in "/components/schemas/CloudEvent"
    And "/components/schemas/CloudEvent" in the callback should contain the parameter ("$.state") set accordingly to the result

  # Optional valid parameters for PATCH
  @TI_Resource_LCM_Optional_Parameters_Valid_MODIFY
  Scenario: Update a Traffic Influence (TI) Resource with also optional parameters
    Given the request body property with the parameter "$.trafficInfluenceID" set per the response of the previous POST
    And and with some of the optional parameters updated (the mandatory parameters can not be updated)
    And potentially, some of the optional parameters still having the same value as before
    And the request body is set to a valid request body
    When the HTTP "PATCH" request is sent
    Then Response Code is 202
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response message is Accepted meaning that the resource deletion is accepted and in progress.
    And The status update can be retrieved with the GET method on that TI Resource. The final value of the parameter "state" is "deleted".
    And when the operation is completed by the network a callback is provided with the ("$.state") set according to the result.
    # The received callback must be compliant and should carry the aspected values
    And within a limited period of time I should receive a callback at "/components/schemas/NotificationSink/sink"
    And the callback body is compliant with the OAS schema at "/components/callbacks/onTrafficInfluenceChanged" with "x-correlator" having the same value as the request header "x-correlator"
    And the callback carries the information defined in "/components/schemas/CloudEvent"
    And "/components/schemas/CloudEvent" in the callback should contain the parameter "$.data" valorised with the results of the PATCH operation

  # Mandatory or Optional valid parameters

  # Mandatory or Optional valid parameters for GET
  @TI_Resource_LCM_Optional_Parameters_Valid_READ
  Scenario: Read Traffic Influence (TI) Resource with also optional parameters
    Given the request body property with the parameter "$.trafficInfluenceID" set per with the response of the previous POST
    And the request body is set to a valid request body
    When the HTTP "GET" request is sent
    Then Response code is 200
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And response contains a TI Resource with a potentially updated status ("$.state") reporting the current status of the traffic influence configuration (ordered, created, active, error, deleted)

  # Mandatory or Optional valid parameters for DELETE
  @TI_Resource_LCM_Optional_Parameters_Valid_DEL
  Scenario: Delete Traffic Influence (TI) Resource with mandatory or optional parameters
    Given the request body property with the parameter "$.trafficInfluenceID" set per the response of the previous POST
    And the request body is set to a valid request body
    When the HTTP "DELETE" request is sent
    Then Response Code is 202
    And the response header "x-correlator" has same value as the request header "x-correlator"
    And the response message is Accepted meaning that the resource deletion is accepted and in progress.
    # The received callback must be compliant and should carry the aspected values
    And within a limited period of time I should receive a callback at "/components/schemas/NotificationSink/sink"
    And the callback body is compliant with the OAS schema at "/components/callbacks/onTrafficInfluenceChanged" with "x-correlator" having the same value as the request header "x-correlator"
    And the callback carries the information defined in "/components/schemas/CloudEvent"
    And "/components/schemas/CloudEvent" in the callback should contain the parameter ("$.state") set according to the result