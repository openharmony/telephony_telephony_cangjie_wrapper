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

///**
// * Created on 2024/1/29
// */
package ohos_app_cangjie_entry

internal import kit.PerformanceAnalysisKit.*
internal import kit.TelephonyKit.*
internal import kit.TestKit.*
internal import ohos.base.*
internal import std.collection.*
import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import ohos.ui_test.*
import kit.AbilityKit.*
internal import ohos.business_exception.BusinessException


@Test
class Test_telephony_call {

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_hasCall() {
        Call.hasCall()
        @Expect(true)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_getCallState() {
        Call.getCallState()
        @Expect(true)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_hasVoiceCapability() {
        Call.hasVoiceCapability()
        @Expect(true)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isEmergencyPhoneNumber() {
        Call.isEmergencyPhoneNumber("19574113803")
        Call.isEmergencyPhoneNumber("19574113803",  options: EmergencyNumberOptions(slotId: 0))
        @Expect(true)

        try {
            Call.isEmergencyPhoneNumber("",  options: EmergencyNumberOptions(slotId: 0))
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(e.code, 8300001)
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_formatPhoneNumber() {
        Call.formatPhoneNumber("19574113803",  options: NumberFormatOptions(countryCode: "CN"))
        Call.formatPhoneNumberToE164("19574113803", "CN")
        @Expect(true)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_formatPhoneNumber_error() {
        try {
            Call.formatPhoneNumberToE164("", "CN")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(e.code, 8300001)
        }

        try {
            Call.formatPhoneNumber("", options: NumberFormatOptions(countryCode: "CN"))
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(e.code, 8300001)
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_makeCall_error() {
        // makeCall 在息屏时会抛异常 2097177
        try {
             Hilog.info(1111,"test"," CangjieTest  getAbilityDelegator")
            let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
             sleepFor(5.second)
             Hilog.info(11111,"test","CangjieTest  getCurrentTopAbilit")
            let ability = delegator.getCurrentTopAbility()

             Hilog.info(11111,"test","CangjieTest  doAbilityBackground")
            delegator.doAbilityBackground(ability)

            sleepFor(1.second)
             Hilog.info(11111,"test","CangjieTest makeCall")
             Call.makeCall(getAbilityContext(), "19574113803")
        } catch (e: BusinessException) {
            Hilog.info(11111,"test","CangjieTest  ${e.message}")
            @Expect(e.code == 201 || e.code == 2097177)

        }
  }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_makeCallWithContext() {
            //let call =Call()
          try{
             Hilog.info(11111,"test","test_makeCallWithContext 111")
            Call.makeCall(getAbilityContext(), "19574113803")
            Hilog.info(2222,"test","test_makeCallWithContext 222")

          } catch(e: BusinessException) {
            Hilog.info(3333,"test","test_makeCallWithContext 111")
          }
        @Expect(true)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_makeCall() {
        try {
            Call.makeCall("19574113803")
        } catch (e: BusinessException) {
           // logger.info("error code is : ${e.code}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_EmergencyNumberOptions_getValue() {
        Call.isEmergencyPhoneNumber("11111111111", options: EmergencyNumberOptions(slotId: 0))
        Call.isEmergencyPhoneNumber("22222222222", options: EmergencyNumberOptions(slotId: 1))
        @Expect(true)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_CallState() {
        let enumArray: Array<CallState> = [
            CallState.CallStateUnknown,
            CallState.CallStateIdle,
            CallState.CallStateRinging,
            CallState.CallStateOffhook,
            CallState.CallStateAnswered
        ]
        let strArray: Array<String> = [
            "CallState.CallStateUnknown",
            "CallState.CallStateIdle",
            "CallState.CallStateRinging",
            "CallState.CallStateOffhook",
            "CallState.CallStateAnswered"
        ]
        for (i in 0..enumArray.size) {
            @Expect(enumArray[i] == enumArray[i])
            @Expect(enumArray[i].toString() == strArray[i])
            @Expect(enumArray[i] != enumArray[(i + 1) % enumArray.size])
        }
    }
}
