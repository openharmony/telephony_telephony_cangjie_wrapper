/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

package ohos.telephony.radio

import ohos.labels.APILevel

@!APILevel[
    since: "24",
    permission: "ohos.permission.GET_NETWORK_INFO",
    syscap: "SystemCapability.Telephony.CoreService",
    throwexception: true,
    workerthread: true
]
public func getNetworkState(slotId!: Int32 = 0): NetworkState {
    return NetworkState("", "", "", true, RegState.RegStateNoService, RadioTechnology.RadioTechnologyUnknown,
        NsaState.NsaStateNotSupport, true, true)
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService",
    throwexception: true,
    workerthread: true
]
public func getSignalInformation(slotId: Int32): Array<SignalInformation> {
    return Array<SignalInformation>()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum RegState {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RegStateNoService
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RegStateInService
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RegStateEmergencyCallOnly
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RegStatePowerOff
    | ...
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum NsaState {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateNotSupport
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateNoDetect
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateConnectedDetect
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateIdleDetect
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateDualConnected
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NsaStateSaAttached
    | ...
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum RadioTechnology {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyUnknown
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyGsm
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnology1Xrtt
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyWcdma
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyHspa
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyHspap
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyTdScdma
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyEvdo
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyEhrpd
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyLte
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyLteCa
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyIwlan
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    RadioTechnologyNr
    | ...
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum NetworkType {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeUnknown
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeGsm
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeCdma
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeWcdma
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeTdscdma
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    NetworkTypeLte
    | ...
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public class NetworkState {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var longOperatorName: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var shortOperatorName: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var plmnNumeric: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var isRoaming: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var regState: RegState

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var cfgTech: RadioTechnology

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var nsaState: NsaState

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var isCaActive: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var isEmergency: Bool

    init(longOperatorName: String, shortOperatorName: String, plmnNumeric: String, isRoaming: Bool, regState: RegState,
        cfgTech: RadioTechnology, nsaState: NsaState, isCaActive: Bool, isEmergency: Bool) {
        super()
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

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService"
]
public class SignalInformation {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var signalType: NetworkType

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var signalLevel: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public var dBm: Int32

    init(signalType: NetworkType, signalLevel: Int32, dBm: Int32) {
        super()
        this.signalType = signalType
        this.signalLevel = signalLevel
        this.dBm = dBm
    }
}