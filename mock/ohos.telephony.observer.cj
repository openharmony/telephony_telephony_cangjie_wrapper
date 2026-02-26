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

package ohos.telephony.observer

import ohos.business_exception.BusinessException
import ohos.ffi.SUCCESS_CODE
import ohos.labels.APILevel
import ohos.telephony.call.CallState
import ohos.hilog.HilogChannel
import std.collection.ArrayList
import ohos.ffi.Callback1Param
import ohos.callback_invoke.{CallbackObject, Callback1Argument}
import std.sync.Mutex

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.StateRegistry",
    throwexception: true
]
public func onCallStateChange(callback: Callback1Argument<CallStateInfo>): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.StateRegistry",
    throwexception: true
]
public func onCallStateChange(options: ObserverOptions, callback: Callback1Argument<CallStateInfo>): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.StateRegistry",
    throwexception: true
]
public func offCallStateChange(callback!: ?Callback1Argument<CallStateInfo> = None): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public class CallStateInfo {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public var state: CallState

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public var number: String

    init(state: CallState, number: String) {
        super()
        this.state = state
        this.number = number
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public class ObserverOptions {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public var slotId: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public init(slotId: Int32) {
        super()
        this.slotId = slotId
    }
}