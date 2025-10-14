/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.telephony.call

import ohos.app.ability.ui_ability.*
import ohos.app.ability.want.*
import ohos.encoding.json.*
import ohos.ffi.*
import ohos.labels.*
import ohos.business_exception.BusinessException

import std.collection.*

/**
 * Provides methods related to call management.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.Telephony.CallManager"
]
public class Call {
    init() {}

    static init() {
        unsafe {
            FfiOHOSTelephonyCallInit()
        }
    }

    /**
     * Formats a phone number into an E.164 representation.
     *
     * @param { String } phoneNumber - Indicates the phone number to format.
     * @param { String } countryCode - Indicates a two-digit country code defined in ISO 3166-1.
     * @returns { String } Returns an E.164 number. Returns an empty string if the input phone number is invalid.
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func formatPhoneNumberToE164(phoneNumber: String, countryCode: String): String {
        unsafe {
            var result = ""
            try (
                cPhoneNumber = LibC.mallocCString(phoneNumber).asResource(),
                cCountryCode = LibC.mallocCString(countryCode).asResource()
            ) {
                var errCode = 0i32
                let formatNumber = FfiOHOSTelephonyCallFormatPhoneNumberToE164(cPhoneNumber.value, cCountryCode.value,
                    inout errCode)
                result = formatNumber.toString()
                LibC.free(formatNumber)
                if (errCode != SUCCESS_CODE) {
                    TELEPHONY_CALL_LOG.error("Telephony_Call formatPhoneNumberToE164 failed: ${getErrorMsg(errCode)}")
                    throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
                }
            }
            return result
        }
    }

    /**
     * Go to the dial screen and the called number is displayed.
     *
     * @param { String } phoneNumber - Indicates the called number.
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Applications.Contacts"
    ]
    public static func makeCall(phoneNumber: String): Unit {
        unsafe {
            try (cNumber = LibC.mallocCString(phoneNumber).asResource()) {
                let errCode = FfiOHOSTelephonyCallMakeCall(cNumber.value)
                if (errCode != SUCCESS_CODE) {
                    TELEPHONY_CALL_LOG.error("Telephony_Call makeCall failed: ${getErrorMsg(errCode)}")
                    throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
                }
            }
        }
    }

    /**
     * Go to the dial screen and the called number is displayed.
     *
     * @param { UIAbilityContext } context - The context that initiates the call.
     * @param { String } phoneNumber - Indicates the called number.
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Applications.Contacts"
    ]
    public static func makeCall(context: UIAbilityContext, phoneNumber: String): Unit {
        let parametersMap = HashMap<String, WantValueType>()
        parametersMap.add("phoneNumber", StringValue(phoneNumber))
        parametersMap.add("pageFlag", StringValue("page_flag_edit_before_calling"))
        context.startAbility(
            Want(bundleName: "com.ohos.contacts", abilityName: "com.ohos.contacts.MainAbility",
                parameters: parametersMap))
    }

    /**
     * Checks whether a phone number is on the emergency number list.
     *
     * @param { String } phoneNumber - Indicates the phone number to check.
     * @param { EmergencyNumberOptions } [options] - Indicates the additional information for emergency numbers.
     * @returns { Bool } Returns true if the phone number is on the emergency number list. Returns false otherwise.
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func isEmergencyPhoneNumber(phoneNumber: String, options!: EmergencyNumberOptions = EmergencyNumberOptions(slotId: 0)): Bool {
        unsafe {
            var result = true
            try (cNumber = LibC.mallocCString(phoneNumber).asResource()) {
                var errCode = 0i32
                result = FfiOHOSTelephonyCallIsEmergencyPhoneNumber(cNumber.value, options.slotId, inout errCode)
                if (errCode != SUCCESS_CODE) {
                    TELEPHONY_CALL_LOG.error("Telephony_Call isEmergencyPhoneNumber failed: ${getErrorMsg(errCode)}")
                    throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
                }
            }
            return result
        }
    }

    /**
     * Checks whether a call is ongoing.
     *
     * @returns { Bool } Returns true if at least one call is not in the CALL_STATE_IDLE state; returns false otherwise.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func hasCall(): Bool {
        return unsafe { FfiOHOSTelephonyCallHasCall() }
    }

    /**
     * Obtains the call state.
     *
     * If an incoming call is ringing or waiting, the system returns CALL_STATE_RINGING.
     * If at least one call is in the active, hold, or dialing state, the system returns CALL_STATE_OFFHOOK.
     * In other cases, the system returns CALL_STATE_IDLE.
     *
     * @returns { CallState } Returns the call state.
     * @throws { BusinessException } 8300001 - Parameter error.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func getCallState(): CallState {
        let enumCode = unsafe { FfiOHOSTelephonyCallGetCallState() }
        return CallState.parse(enumCode)
    }

    /**
     * Checks whether a device supports voice calls.
     *
     * @returns { Bool } Returns true if the device supports voice calls; returns false otherwise.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func hasVoiceCapability(): Bool {
        unsafe {
            return FfiOHOSTelephonyCallHasVoiceCapability()
        }
    }

    /**
     * Formats a phone number according to the Chinese Telephone Code Plan. Before the formatting,
     * a phone number is in the format of country code (if any) + 3-digit service provider code
     * + 4-digit area code + 4-digit subscriber number. After the formatting,
     * each part is separated by a space.
     *
     * @param { String } phoneNumber - Indicates the phone number to format.
     * @param { NumberFormatOptions } [options] - Indicates the country code option.
     * @returns { String } Returns the phone number after being formatted. Returns an empty string if the input phone number is invalid.
     * @throws { BusinessException } 8300001 - Invalid parameter value.
     * @throws { BusinessException } 8300002 - Operation failed. Cannot connect to service.
     * @throws { BusinessException } 8300003 - System internal error.
     * @throws { BusinessException } 8300999 - Unknown error code.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public static func formatPhoneNumber(
        phoneNumber: String,
        options!: NumberFormatOptions = NumberFormatOptions()
    ): String {
        unsafe {
            var result = ""
            try (
                cPhoneNumber = LibC.mallocCString(phoneNumber).asResource(),
                cCountryCode = LibC.mallocCString(options.countryCode).asResource()
            ) {
                var errCode = 0i32
                let formatNumber = FfiOHOSTelephonyCallFormatPhoneNumber(cPhoneNumber.value, cCountryCode.value,
                    inout errCode)
                result = formatNumber.toString()
                LibC.free(formatNumber)
                if (errCode != SUCCESS_CODE) {
                    TELEPHONY_CALL_LOG.error("Telephony_Call formatPhoneNumber failed: ${getErrorMsg(errCode)}")
                    throw BusinessException(getErrorCode(errCode), getErrorMsg(errCode))
                }
            }
            return result
        }
    }
}
