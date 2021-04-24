# PSSophosUTM
<!-- [![GitHub release](https://img.shields.io/badge/release-v1.0.4-blue)](https://github.com/UpperM/guacamole-powershell/releases/latest) -->

This PowerShell module provides a series of cmdlets for interacting with Sophos UTM, performed by wrapping `Invoke-RestMethod` for the API calls.

<!-- TABLE OF CONTENTS -->
## Table of Contents
* [Getting Started](#getting-started)
  * [Requirements](#requirements)
  * [Installation](#installation)
* [Examples](#examples)
  * [Authentification](#authentification)
* [Functions](#functions)
  * [Connection](Documentation/Connection.md)
  * [Network](Documentation/Network.md)
* [Author](#author)

# Getting Started
## Requirements
Requires PowerShell 3.0 or above as this is when `Invoke-RestMethod` was introduced.

## Installation
Download the [latest release](https://github.com/UpperM/PSSophosUTM/releases/latest) and extract the folder to your module location (``$env:PSModulePath``).

Load the module
```PowerShell
Import-Module -Name PSSophosUTM
```
Once you've done this, all the cmdlets will be at your disposal.

# Examples

## Authentification
#### Get new token
```PowerShell
New-SophosToken -Username "admin"  -Password "Password" -Server "https://192.168.1.254:4444"
```
# Functions
## Connection
* New-SophosToken
## Network
* Get-UTMHost
* Get-UTMHosts
* Get-UTMHostsUnused
* Get-UTMHostUsedBy
* Get-UTMNetwork
* Get-UTMNetworks
* Get-UTMNetworkUsedBy
* GetUTMNetworksUnused
# Author
Author: [UpperM](https://twitter.com/UppperM)
