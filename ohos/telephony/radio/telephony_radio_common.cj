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

package ohos.telephony.radio

import ohos.telephony.call.getErrorMsg
import ohos.business_exception.BusinessException
import ohos.ffi.SUCCESS_CODE
import ohos.labels.APILevel
import ohos.hilog.HilogChannel

let TELEPHONY_RADIO_LOG = HilogChannel(0, 0xD001F04, "CJ-Telephony_Radio")

/**
 * Describes the network registration state.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum RegState {
    /**
     * Indicates a state in which a device cannot use any service.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RegStateNoService
    |
    /**
     * Indicates a state in which a device can use services properly.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RegStateInService
    |
    /**
     * Indicates a state in which a device can use only the emergency call service.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RegStateEmergencyCallOnly
    |
    /**
     * Indicates that the cellular radio is powered off.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RegStatePowerOff
    | ...

    func getValue(): Int32 {
        match (this) {
            case RegStateNoService => 0
            case RegStateInService => 1
            case RegStateEmergencyCallOnly => 2
            case RegStatePowerOff => 3
            case _ => throw BusinessException(8300001, "Parameter error.")
        }
    }

    protected static func parse(value: Int32): RegState {
        match (value) {
            case 0 => RegStateNoService
            case 1 => RegStateInService
            case 2 => RegStateEmergencyCallOnly
            case 3 => RegStatePowerOff
            case _ => throw BusinessException(8300001, "Parameter error.")
        }
    }
}

/**
 * Describes the nsa state.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum NsaState {
    /**
     * Indicates that a device is idle under or is connected to an LTE cell that does not support NSA.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateNotSupport
    |
    /**
     * Indicates that a device is idle under an LTE cell supporting NSA but not NR coverage detection.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateNoDetect
    |
    /**
     * Indicates that a device is connected to an LTE network under an LTE cell
     * that supports NSA and NR coverage detection.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateConnectedDetect
    |
    /**
     * Indicates that a device is idle under an LTE cell supporting NSA and NR coverage detection.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateIdleDetect
    |
    /**
     * Indicates that a device is connected to an LTE + NR network under an LTE cell that supports NSA.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateDualConnected
    |
    /**
     * Indicates that a device is idle under or is connected to an NG-RAN cell while being attached to 5GC.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateSaAttached
    | ...

    func getValue(): Int32 {
        match (this) {
            case NsaStateNotSupport => 1
            case NsaStateNoDetect => 2
            case NsaStateConnectedDetect => 3
            case NsaStateIdleDetect => 4
            case NsaStateDualConnected => 5
            case NsaStateSaAttached => 6
            case _ => throw BusinessException(8300001, "Parameter error.")
        }
    }

    protected static func parse(value: Int32): NsaState {
        match (value) {
            case 1 => NsaStateNotSupport
            case 2 => NsaStateNoDetect
            case 3 => NsaStateConnectedDetect
            case 4 => NsaStateIdleDetect
            case 5 => NsaStateDualConnected
            case 6 => NsaStateSaAttached
            case _ => throw BusinessException(8300001, "Parameter error.")
        }
    }
}

/**
 * Describes the radio access technology.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum RadioTechnology {
    /**
     * Indicates unknown radio access technology (RAT).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyUnknown
    |
    /**
     * Indicates that RAT is global system for mobile communications (GSM), including GSM, general packet
     * radio system (GPRS), and enhanced data rates for GSM evolution (EDGE).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyGsm
    |
    /**
     * Indicates that RAT is code division multiple access (CDMA), including Interim Standard 95 (IS95) and
     * Single-Carrier Radio Transmission Technology (1xRTT).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnology1Xrtt
    |
    /**
     * Indicates that RAT is wideband code division multiple address (WCDMA).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyWcdma
    |
    /**
     * Indicates that RAT is high-speed packet access (HSPA), including HSPA, high-speed downlink packet
     * access (HSDPA), and high-speed uplink packet access (HSUPA).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyHspa
    |
    /**
     * Indicates that RAT is evolved high-speed packet access (HSPA+), including HSPA+ and dual-carrier
     * HSPA+ (DC-HSPA+).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyHspap
    |
    /**
     * Indicates that RAT is time division-synchronous code division multiple access (TD-SCDMA).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyTdScdma
    |
    /**
     * Indicates that RAT is evolution data only (EVDO), including EVDO Rev.0, EVDO Rev.A, and EVDO Rev.B.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyEvdo
    |
    /**
     * Indicates that RAT is evolved high rate packet data (EHRPD).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyEhrpd
    |
    /**
     * Indicates that RAT is long term evolution (LTE).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyLte
    |
    /**
     * Indicates that RAT is LTE carrier aggregation (LTE-CA).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyLteCa
    |
    /**
     * Indicates that RAT is interworking WLAN (I-WLAN).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyIwlan
    |
    /**
     * Indicates that RAT is 5G new radio (NR).
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyNr
    | ...

    func getValue(): Int32 {
        match (this) {
            case RadioTechnologyUnknown => 0
            case RadioTechnologyGsm => 1
            case RadioTechnology1Xrtt => 2
            case RadioTechnologyWcdma => 3
            case RadioTechnologyHspa => 4
            case RadioTechnologyHspap => 5
            case RadioTechnologyTdScdma => 6
            case RadioTechnologyEvdo => 7
            case RadioTechnologyEhrpd => 8
            case RadioTechnologyLte => 9
            case RadioTechnologyLteCa => 10
            case RadioTechnologyIwlan => 11
            case RadioTechnologyNr => 12
            case _ => throw BusinessException(8300001, "Parameter error.")
        }
    }

    protected static func parse(value: Int32): RadioTechnology {
        match (value) {
            case 0 => RadioTechnologyUnknown
            case 1 => RadioTechnologyGsm
            case 2 => RadioTechnology1Xrtt
            case 3 => RadioTechnologyWcdma
            case 4 => RadioTechnologyHspa
            case 5 => RadioTechnologyHspap
            case 6 => RadioTechnologyTdScdma
            case 7 => RadioTechnologyEvdo
            case 8 => RadioTechnologyEhrpd
            case 9 => RadioTechnologyLte
            case 10 => RadioTechnologyLteCa
            case 11 => RadioTechnologyIwlan
            case 12 => RadioTechnologyNr
            case _ => throw BusinessException(8300001, "Parameter error.")
        }
    }
}

/**
 * Describes the network type.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum NetworkType {
    /**
     * Indicates unknown network type.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeUnknown
    |
    /**
     * Indicates that the network type is GSM.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeGsm
    |
    /**
     * Indicates that the network type is CDMA.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeCdma
    |
    /**
     * Indicates that the network type is WCDMA.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeWcdma
    |
    /**
     * Indicates that the network type is TD-SCDMA.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeTdscdma
    |
    /**
     * Indicates that the network type is LTE.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeLte
    | ...

    func getValue(): Int32 {
        match (this) {
            case NetworkTypeUnknown => 0
            case NetworkTypeGsm => 1
            case NetworkTypeCdma => 2
            case NetworkTypeWcdma => 3
            case NetworkTypeTdscdma => 4
            case NetworkTypeLte => 5
            case _ => throw BusinessException(8300001, "Parameter error.")
        }
    }

    protected static func parse(value: Int32): NetworkType {
        match (value) {
            case 0 => NetworkTypeUnknown
            case 1 => NetworkTypeGsm
            case 2 => NetworkTypeCdma
            case 3 => NetworkTypeWcdma
            case 4 => NetworkTypeTdscdma
            case 5 => NetworkTypeLte
            case _ => throw BusinessException(8300001, "Parameter error.")
        }
    }
}

/**
 * Describes the network registration state.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public class NetworkState {
    /**
     * Obtains the operator name in the long alphanumeric format of the registered network.
     *
     * Returns the operator name in the long alphanumeric format as a string;
     * returns an empty string if no operator name is obtained.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var longOperatorName: String

    /**
     * Obtains the operator name in the short alphanumeric format of the registered network.
     *
     * Returns the operator name in the short alphanumeric format as a string;
     * returns an empty string if no operator name is obtained.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var shortOperatorName: String

    /**
     * Obtains the PLMN code of the registered network.
     *
     * Returns the PLMN code as a string; returns an empty string if no operator name is obtained.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var plmnNumeric: String

    /**
     * Checks whether the device is roaming.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var isRoaming: Bool

    /**
     * Obtains the network registration status of the device.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var regState: RegState

    /**
     * Obtains the radio Access technology after config conversion.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var cfgTech: RadioTechnology

    /**
     * Obtains the NSA network registration status of the device.
     *
     * Returns the NSA network registration status NsaState.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var nsaState: NsaState

    /**
     * Obtains the status of CA.
     *
     * Returns true if CA is actived; returns false otherwise.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var isCaActive: Bool

    /**
     * Checks whether this device is allowed to make emergency calls only.
     *
     * Returns true if this device is allowed to make emergency calls only;
     * returns false otherwise.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var isEmergency: Bool

    init(longOperatorName: String, shortOperatorName: String, plmnNumeric: String, isRoaming: Bool, regState: RegState,
        cfgTech: RadioTechnology, nsaState: NsaState, isCaActive: Bool, isEmergency: Bool) {
        this.longOperatorName = longOperatorName
        this.shortOperatorName = shortOperatorName
        this.plmnNumeric = plmnNumeric
        this.isRoaming = isRoaming
        this.regState = regState
        this.cfgTech = cfgTech
        this.nsaState = nsaState
        this.isCaActive = isCaActive
        this.isEmergency = isEmergency
    }
}

/**
 * Returns child class objects specific to the network type.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public class SignalInformation {
    /**
     * Obtains the network type corresponding to the signal.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var signalType: NetworkType

    /**
     * Obtains the signal level of the current network.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var signalLevel: Int32

    /**
     * rsrp for LTE and NR; dbm for CDMA and EVDO; rscp for WCDMA; rssi for GSM.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var dBm: Int32

    init(signalType: NetworkType, signalLevel: Int32, dBm: Int32) {
        this.signalType = signalType
        this.signalLevel = signalLevel
        this.dBm = dBm
    }
}

func throwIfNotSuccess(code: Int32, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        TELEPHONY_RADIO_LOG.error("${funcName} failed: ${getErrorMsg(code)}")
        throw BusinessException(code, getErrorMsg(code))
    }
}
