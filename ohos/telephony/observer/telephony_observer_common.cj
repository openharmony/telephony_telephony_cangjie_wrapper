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

package ohos.telephony.observer

import ohos.telephony.call.getErrorMsg
import ohos.business_exception.BusinessException
import ohos.ffi.SUCCESS_CODE
import ohos.labels.APILevel
import ohos.telephony.call.CallState
import ohos.hilog.HilogChannel

let TELEPHONY_OBSERVER_LOG = HilogChannel(0, 0xD001F07, "CJ-Telephony_Observer")

/**
 * Indicates call state and number.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public class CallStateInfo {
    /**
     * Indicates call state.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public var state: CallState

    /**
     * Indicates call number.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public var number: String

    init(state: CallState, number: String) {
        this.state = state
        this.number = number
    }
}

/**
 * Indicates observer options.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public class ObserverOptions {
    /**
     * Indicates the ID of the target card slot.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public var slotId: Int32

    /**
     * ObserverOptions constructor.
     *
     * @param { Int32 } slotId - Indicates the ID of the target card slot.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public init(slotId: Int32) {
        this.slotId = slotId
    }

    func toCObserverOptions(): CObserverOptions {
        CObserverOptions(this.slotId)
    }
}

func throwIfNotSuccess(code: Int32, className: String, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        TELEPHONY_OBSERVER_LOG.info("${className}: ${funcName} failed: ${code}: ${getErrorMsg(code)}")
        throw BusinessException(code, getErrorMsg(code))
    }
}
