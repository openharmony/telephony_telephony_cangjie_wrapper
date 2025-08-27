# telephony_cangjie_wrapper

## Introduction

The telephony_cangjie_wrapper is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Telephony subsystem. Provides call management functions, including making calls, jumping to the dialing interface, obtaining call status, and formatting phone numbers.

**Figure 1** Architecture of the telephony_cangjie_wrapper

![](figures/telephony_cangjie_wrapper_architecture_en.png)

## Directory Structure

```
base/telephony/telephony_cangjie_wrapper
├── ohos             # Cangjie Telephony code
├── kit              # Cangjie kit code
├── figures          # architecture pictures
```

## Constraints

1.  The open-source version currently provides the cellular call (CS call only), SMS & MMS, and cellular data services and supports the dual-SIM framework.
2.  The southbound HDI depends on the chip vendor.
3.  The currently open Ability Cangjie api only supports standard devices.

## Usage Guidelines

The following features are provided:

  - make a phone call

The following features are not provided yet:

  - Cellular Data
  - eSIM Card Management
  - Subscription Management
  - Network Search
  - SIM Card Management
  - Short Message Service (SMS)

## Repositories Involved

[call_manager](https://gitee.com/openharmony/telephony_call_manager/blob/master/README.md)
