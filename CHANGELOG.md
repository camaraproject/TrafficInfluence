
# Changelog CAMARA TrafficInfluence

## Table of Contents

- **[r1.2](#r12)**
- **[r1.1](#r11)**

**Please be aware that the project will have frequent updates to the main branch. There are no compatibility guarantees associated with code in any branch, including main, until it has been released. For example, changes may be reverted before a release is published. For the best results, use the latest published release.**

The below sections record the changes for each API version in each release as follows:

* for an alpha release, the delta with respect to the previous release
* for the first release-candidate, all changes since the last public release
* for subsequent release-candidate(s), only the delta to the previous release-candidate
* for a public release, the consolidated changes since the previous public release

# r1.2

## Release Notes

This release contains the definition and documentation of:
* traffic-influence v0.9.0-rc.1

The API definition(s) are based on
* Commonalities v0.6.0-rc.1
* Identity and Consent Management v0.4.0-rc.1

## traffic-influence v0.9.0-rc.1
This is the release candidate for the CAMARA Traffic Influence API. This version provides the ability to influence the traffic flow from the user device toward the Edge instance of the Application providing the optimal routing.
The traffic can be influenced even when the user device moves to a different geographical location to always get the optimal routing toward the nearest instance of an Application.

- API definition **with inline documentation**:
  - OpenAPI [YAML spec file](https://github.com/camaraproject/TrafficInfluence/blob/r1.2/code/API_definitions/traffic-influence.yaml)
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/TrafficInfluence/r1.2/code/API_definitions/traffic-influence.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/TrafficInfluence/r1.2/code/API_definitions/traffic-influence.yaml)

## Please note:

- This pre-release contains a release-candidate API version, there are bug fixes to be expected and incompatible changes in upcoming versions 
- The release is suitable for implementers, but it is not recommended to use the API with customers in productive environments
- The release scope is defined here: https://github.com/camaraproject/TrafficInfluence/issues/14

## What's New

* Support for the following use cases: https://github.com/camaraproject/TrafficInfluence/discussions/15
* x-correlator update: https://github.com/camaraproject/EnergyFootprintNotification/pull/79


**Full Changelog**: https://github.com/camaraproject/TrafficInfluence/commits/r1.1...r1.2

# r1.1

## Release Notes

This release contains the definition and documentation of:
* traffic-influence v0.9.0-alpha.1

The API definition(s) are based on
* Commonalities v0.6.0-alpha.1
* Identity and Consent Management v0.4.0-alpha.1

## traffic-influence v0.9.0-alpha.1
This is an alpha release for the CAMARA Traffic Influence API. This version provides the ability to influence the traffic flow from the user device toward the Edge instance of the Application providing the optimal routing.
The traffic can be influenced even when the user device moves to a different geographical location to always get the optimal routing toward the nearest instance of an Application.

- API definition **with inline documentation**:
  - OpenAPI [YAML spec file](https://github.com/camaraproject/TrafficInfluence/blob/r1.1/code/API_definitions/traffic-influence.yaml)
  - [View it on ReDoc](https://redocly.github.io/redoc/?url=https://raw.githubusercontent.com/camaraproject/TrafficInfluence/r1.1/code/API_definitions/traffic-influence.yaml&nocors)
  - [View it on Swagger Editor](https://camaraproject.github.io/swagger-ui/?url=https://raw.githubusercontent.com/camaraproject/TrafficInfluence/r1.1/code/API_definitions/traffic-influence.yaml)

## Please note:

- This pre-release contains a release-candidate API version, there are bug fixes to be expected and incompatible changes in upcoming versions 
- The release is suitable for implementers, but it is not recommended to use the API with customers in productive environments
- The release scope is defined here: https://github.com/camaraproject/TrafficInfluence/issues/14

## What's New

* Support for the following use cases: https://github.com/camaraproject/TrafficInfluence/discussions/15

## New Contributors
* @FabrizioMoggio
* @gunjald
* @babunkj
* @nicolacdnll
* @Kevsy

**Full Changelog**: https://github.com/camaraproject/TrafficInfluence/commits/r1.1
