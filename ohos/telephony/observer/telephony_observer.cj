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

import std.collection.ArrayList
import ohos.ffi.Callback1Param
import ohos.callback_invoke.{CallbackObject, Callback1Argument}
import ohos.labels.APILevel
import std.sync.Mutex

let CALLBACK_LIST = ArrayList<(CallbackObject, String, Int64)>()
let ON_OFF_MUTEX = Mutex()

func unregisterCallStateChange(callback: Callback1Argument<CallStateInfo>): Unit {
    synchronized(ON_OFF_MUTEX) {
        for (idx in 0..CALLBACK_LIST.size) {
            let item = CALLBACK_LIST[idx]
            if (refEq(callback, item[0]) && item[1] == "callStateChange") {
                let errCode = unsafe { FfiTelephonyObserverOffCallStateChange(item[2]) }
                throwIfNotSuccess(errCode, "TelephonyObserver", "callStateChange")
                CALLBACK_LIST.remove(at: idx)
                return
            }
        }
        TELEPHONY_OBSERVER_LOG.info("Telephony Observer off callStateChange: This function cannot be found.")
    }
}

func unregisterCallStateChange(): Unit {
    synchronized(ON_OFF_MUTEX) {
        unsafe {
            let errCode = FfiTelephonyObserverOffAllCallStateChange()
            throwIfNotSuccess(errCode, "TelephonyObserver", "offCallStateChange")
            CALLBACK_LIST.removeIf({item => item[1] == "callStateChange"})
        }
    }
}

func registerCallStateChange(options: CObserverOptions, callback: Callback1Argument<CallStateInfo>): Unit {
    synchronized(ON_OFF_MUTEX) {
        for (item in CALLBACK_LIST) {
            if (refEq(callback, item[0]) && item[1] == "callStateChange") {
                TELEPHONY_OBSERVER_LOG.info(
                    "Telephony Observer on callStateChange failed: The same function has registered.")
                return
            }
        }
        unsafe {
            let wrapper = {
                value: CPointer<Unit> =>
                let stateInfo = CPointer<CCallStateInfo>(value).read()
                let callStateInfo = stateInfo.toCallStateInfo()
                stateInfo.free()
                callback.invoke(None, callStateInfo)
            }
            let lambdaData = Callback1Param<CPointer<Unit>, Unit>(wrapper)
            let errCode = FfiTelephonyObserverOnCallStateChange(options, lambdaData.getID())
            throwIfNotSuccess(errCode, "TelephonyObserver", "onCallStateChange")
            CALLBACK_LIST.add((callback, "callStateChange", lambdaData.getID()))
        }
    }
}

/**
 * Callback when the call state corresponding to the monitored slotId is updated.
 *
 * @param { Callback1Argument<CallStateInfo> } callback - Indicates the callback for
 * getting the call state and the called number.
 * @throws { BusinessException } 8300001 - Invalid parameter value.
 * @throws { BusinessException } 8300002 - Service connection failed.
 * @throws { BusinessException } 8300003 - System internal error.
 * @throws { BusinessException } 8300999 - Unknown error.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.StateRegistry",
    throwexception: true
]
public func onCallStateChange(callback: Callback1Argument<CallStateInfo>): Unit {
    let observerOptions = CObserverOptions(0)
    registerCallStateChange(observerOptions, callback)
}

/**
 * Callback when the call state corresponding to the monitored slotId is updated.
 *
 * @param { ObserverOptions } options - Indicates the options for observer.
 * @param { Callback1Argument<CallStateInfo> } callback - Indicates the callback for
 * getting the call state and the called number.
 * @throws { BusinessException } 8300001 - Invalid parameter value.
 * @throws { BusinessException } 8300002 - Service connection failed.
 * @throws { BusinessException } 8300003 - System internal error.
 * @throws { BusinessException } 8300999 - Unknown error.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.StateRegistry",
    throwexception: true
]
public func onCallStateChange(options: ObserverOptions, callback: Callback1Argument<CallStateInfo>): Unit {
    let observerOptions = options.toCObserverOptions()
    registerCallStateChange(observerOptions, callback)
}

/**
 * Cancel callback when the call state is updated.
 *
 * @param { ?Callback1Argument<CallStateInfo> } [ callback ] - Indicates the callback to
 * unsubscribe from the callStateChange event.
 * @throws { BusinessException } 8300001 - Invalid parameter value.
 * @throws { BusinessException } 8300002 - Service connection failed.
 * @throws { BusinessException } 8300003 - System internal error.
 * @throws { BusinessException } 8300999 - Unknown error.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.StateRegistry",
    throwexception: true
]
public func offCallStateChange(callback!: ?Callback1Argument<CallStateInfo> = None): Unit {
    match (callback) {
        case Some(cb) => unregisterCallStateChange(cb)
        case None => unregisterCallStateChange()
    }
}
