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

package ohos.telephony.call

import ohos.app.ability.ui_ability.*
import ohos.app.ability.want.*
import ohos.business_exception.BusinessException
import ohos.labels.*

@!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
public class Call {
    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager", throwexception: true, workerthread: true]
    public static func formatPhoneNumberToE164(phoneNumber: String, countryCode: String): String {
        return String()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Applications.Contacts", throwexception: true, workerthread: true]
    public static func makeCall(phoneNumber: String): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Applications.Contacts", throwexception: true, workerthread: true]
    public static func makeCall(context: UIAbilityContext, phoneNumber: String): Unit {
        return ()
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager", throwexception: true, workerthread: true]
    public static func isEmergencyPhoneNumber(phoneNumber: String,
        options!: EmergencyNumberOptions = EmergencyNumberOptions(slotId: 0)): Bool {
        return true
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager", workerthread: true]
    public static func hasCall(): Bool {
        return true
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager", throwexception: true, workerthread: true]
    public static func getCallState(): CallState {
        return CallState.CallStateUnknown
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    public static func hasVoiceCapability(): Bool {
        return true
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager", throwexception: true, workerthread: true]
    public static func formatPhoneNumber(
        phoneNumber: String,
        options!: NumberFormatOptions = NumberFormatOptions()
    ): String {
        return String()
    }
    
    public init() {
        super()
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
public class EmergencyNumberOptions {
    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    public var slotId: Int32

    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    public init(slotId!: Int32 = 0) {
        super()
        this.slotId = 0
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
public enum CallState {
    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    CallStateUnknown
    | @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    CallStateIdle
    | @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    CallStateRinging
    | @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    CallStateOffhook
    | @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    CallStateAnswered
    | ...
}

extend CallState <: ToString {
    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    public func toString(): String {
        return String()
    }
}

extend CallState <: Equatable<CallState> {
    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    public operator func ==(other: CallState): Bool {
        return true
    }

    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    public operator func !=(other: CallState): Bool {
        return true
    }
}

@!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
public class NumberFormatOptions {
    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    public var countryCode: String

    @!APILevel[since: "22", syscap: "SystemCapability.Telephony.CallManager"]
    public init(countryCode!: String = "CN") {
        super()
        this.countryCode = String()
    }
}