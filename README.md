# telephony_cangjie_wrapper

## Introduction

The telephony_cangjie_wrapper is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the telephony subsystem. It provides call management functions, including making calls, jumping to the dialing interface, obtaining call status, and formatting phone numbers.
The currently open telephony Cangjie API only supports standard devices.

## System Architecture

**Figure 1** telephony_cangjie_wrapper architecture

![telephony_cangjie_wrapper architecture](figures/telephony_cangjie_wrapper_architecture_en.png)

As shown in the architecture diagram:

- makeCall: Provides dialing function, the capability to jump to the dialing interface, and display the number to be dialed.
- hasCall, getCallState, hasVoiceCapability, isEmergencyPhoneNumber: Provides the capabilities to determine whether there is a call, obtain the current call status, check whether the current device has voice call capability, and determine whether it is an emergency phone number.
- formatPhoneNumber, formatPhoneNumberToE164: Provides the capability to format phone numbers.
- Cangjie Telephony FFI interface: Responsible for defining C interoperation Cangjie interfaces, used to implement telephony service capabilities.
- call_manager: Responsible for providing call management basic functions, encapsulating C interfaces for interoperation with Cangjie.

## Directory Structure

```
base/telephony/telephony_cangjie_wrapper
├── figures          # architecture pictures
├── kit              # Cangjie TelephonyKit kit code
│   └── TelephonyKit # TelephonyKit module implementation
├── ohos             # Cangjie telephony service interface implementation
│   └── telephony    # Telephony module
│       └── call     # Call management module
└── test             # Cangjie telephony service test cases
    └── APILevel22
        └── telephony_call # Call management test cases
```

## Usage

As shown in the architecture diagram, the telephony Cangjie API provides the following functional interfaces. Developers can comprehensively use one or more types of interfaces according to their needs:

  - Make phone calls.

Compared to ArkTS API, the following functions are not supported:

  - Cellular Data
  - eSIM Card Management
  - Subscription Management
  - Network Search
  - SIM Card Management
  - Short Message Service (SMS)

For telephony related APIs, please refer to [ohos.telephony.call](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/TelephonyKit/cj-apis-telephony-call.md). For related guidelines, please refer to: [Make a Phone Call](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_en/telephony/cj-telephony-call.md).

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

[ability_ability_cangjie_wrapper](https://gitcode.com/openharmony-sig/ability_ability_cangjie_wrapper)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[telephony_call_manager](https://gitcode.com/openharmony/telephony_call_manager)