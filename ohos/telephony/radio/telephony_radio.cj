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

import ohos.labels.APILevel

/**
 * Obtains the network state of the registered network.
 *
 * @param { Int32 } [slotId] - Indicates the card slot index number,
 * ranging from 0 to the maximum card slot index number supported by the device.
 * if no slotId is provided, the default slotId is 0.
 * @returns { NetworkState } Returns the NetworkState object.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 8300001 - Invalid parameter value.
 * @throws { BusinessException } 8300002 - Service connection failed.
 * @throws { BusinessException } 8300003 - System internal error.
 * @throws { BusinessException } 8300999 - Unknown error.
 */
@!APILevel[
    since: "24",
    permission: "ohos.permission.GET_NETWORK_INFO",
    syscap: "SystemCapability.Telephony.CoreService",
    throwexception: true,
    workerthread: true
]
public func getNetworkState(slotId!: Int32 = 0): NetworkState {
    var errCode = 0i32
    let ret = unsafe { FfiTelephonyRadioGetNetworkState(slotId, inout errCode) }
    let result = ret.toNetworkState()
    ret.free()
    throwIfNotSuccess(errCode, "getNetworkState")
    return result
}

/**
 * Obtains the list of signal strength information of the registered network corresponding to a specified SIM card.
 *
 * @param { Int32 } slotId - Indicates the card slot index number, ranging from 0 to the maximum card slot
 * index number supported by the device.
 * @returns { Array<SignalInformation> } Returns the instance list of
 * the child classes derived from SignalInformation.
 * @throws { BusinessException } 8300001 - Invalid parameter value.
 * @throws { BusinessException } 8300002 - Service connection failed.
 * @throws { BusinessException } 8300003 - System internal error.
 * @throws { BusinessException } 8300999 - Unknown error.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Telephony.CoreService",
    throwexception: true,
    workerthread: true
]
public func getSignalInformation(slotId: Int32): Array<SignalInformation> {
    unsafe {
        var errCode = 0i32
        let ret = FfiTelephonyRadioGetSignalInfoList(slotId, inout errCode)
        let signalInformations = ret.toArraySignalInformation()
        ret.free()
        throwIfNotSuccess(errCode, "getSignalInformation")
        return signalInformations
    }
}
