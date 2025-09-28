# telephony_telephony_cangjie_wrapper

## Introduction

The telephony_telephony_cangjie_wrapper provides call management capabilities for developers using the Cangjie language for application development on OpenHarmony, including making calls, obtaining call properties, and formatting phone numbers. The currently open telephony_telephony_cangjie_wrapper only supports standard devices.

## System Architecture

**Figure 1** telephony_cangjie_wrapper architecture

![telephony_cangjie_wrapper architecture](figures/telephony_cangjie_wrapper_architecture_en.png)

As shown in the architecture diagram:

Interface Layer:
- Call: Provides call management capabilities for developers, including making calls, obtaining call properties, and formatting phone numbers.
  - Make Calls: Provides developers with the ability to make calls, enabling them to jump to the system dial interface and display the called number.
  - Obtain Call Properties: Provides developers with the ability to get the current call status, check if the current device has voice call capability, check if the current device is in a call, and determine if it is an emergency phone number.
  - Format Phone Number: Provides developers with the ability to format phone numbers, with the formatted numbers meeting standard numeric string or E.164 representation forms.

Framework Layer:
- Call wrapper: Implements Call wrapper based on underlying call_managemer capabilities, supporting making calls, obtaining call properties, and formatting phone numbers.

Dependencies Introduction in Architecture:

- call_manager: Call wrapper depends on the system call management capabilities of the call management module, used to handle call downlink operations (such as dialing, answering, hanging up, etc.) and uplink status (incoming call status, call waiting status, etc.) processing, and resolve conflicts that occur during calls.
- ability_cangjie_wrapper: Call wrapper depends on the application context capabilities provided by ability_cangjie_wrapper, used to jump to the dial interface when making calls.
- hiviewdfx_cangjie_wrapper: Call wrapper depends on HiLog capabilities for printing logs at key points.
- cangjie_ark_interop: Call wrapper depends on APILevel class definitions and BusinessException class definitions for API annotation and throwing exceptions to users in error branches.

## Directory Structure

```
base/telephony/telephony_cangjie_wrapper
├── figures          # architecture pictures
├── kit              # Cangjie TelephonyKit kit code
│   └── TelephonyKit # TelephonyKit module 
├── ohos             # Cangjie telephony service 
│   └── telephony    # Telephony module
│       └── call     # Call management module
└── test             # Cangjie telephony service test cases
    └── telephony_call # Call management test cases
```

## Usage

The current telephony_telephony_cangjie_wrapper provides the following functions:

- Call.

For telephony related APIs, please refer to [ohos.telephony.call](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/TelephonyKit/cj-apis-telephony-call.md). For related guidelines, please refer to: [Telephony Usage Guide](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_en/telephony/cj-telephony-call.md).

## Constraints

- The device to be equipped requires hardware support including a speaker or earpiece, a microphone, and also needs an inserted SIM card.

Compared to ArkTS API, the following functions are not supported:

  - Cellular Data
  - eSIM Card Management
  - Subscription Management
  - Network Search
  - SIM Card Management
  - Short Message Service (SMS)

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

[ability_ability_cangjie_wrapper](https://gitcode.com/openharmony-sig/ability_ability_cangjie_wrapper)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[telephony_call_manager](https://gitcode.com/openharmony/telephony_call_manager)