/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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


/**
 * 测试Call.makeCall方法的功能
 */
@Test
class Test_Call_MakeCall_Add {
    /**
     * 测试单参数makeCall方法：有效固定电话
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_String_valid_landline() {
        try {
            Call.makeCall("075512345678")
            // 方法调用成功，无返回值
        } catch (e: BusinessException) {
            // 可能因环境限制抛出异常
            @Expect(e.code, 8300001)
        }
    }

    /**
     * 测试单参数makeCall方法：紧急电话号码
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_String_emergency_number() {
        try {
            Call.makeCall("110")
            // 方法调用成功，无返回值
        } catch (e: BusinessException) {
            // 可能因环境限制抛出异常
            @Expect(e.code, 8300001)
        }
    }

    /**
     * 测试单参数makeCall方法：空字符串
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_String_empty_string() {
        try {
            Call.makeCall("")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(e.code, 8300001)
        }
    }

    /**
     * 测试单参数makeCall方法：非数字字符串
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_String_non_numeric_string() {
        try {
            Call.makeCall("abc")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(e.code, 8300001)
        }
    }

    /**
     * 测试单参数makeCall方法：边界值空字符串
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_String_boundary_empty_string() {
        try {
            Call.makeCall("")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(e.code, 8300001)
        }
    }

    /**
     * 测试单参数makeCall方法：无返回值
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_String_no_return_value() {
        try {
            let result: Unit = Call.makeCall("13800138000")
            // 验证无返回值
        } catch (e: BusinessException) {
            // 可能因环境限制抛出异常
           @Expect(e.code, 8300001)
        }
    }

    /**
     * 测试双参数makeCall方法：有效手机号码
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_Context_valid_mobile() {
        try {
            Call.makeCall(getAbilityContext(), "13800138000")
            // 方法调用成功，无返回值
        } catch (e: BusinessException) {
            // 可能因环境限制抛出异常
            if (DeviceInfo.deviceType == "TV") {	 
  	            @Expect(true)	 
  	        } else {	 
  	            @Expect(e.code == 8300002 || e.code == 8300003 || e.code == 201 || e.code == 2097177)
  	        }
        }
    }

    /**
     * 测试双参数makeCall方法：紧急电话号码
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_Context_emergency_number() {
        try {
            Call.makeCall(getAbilityContext(), "110")
            // 方法调用成功，无返回值
        } catch (e: BusinessException) {
             // 可能因环境限制抛出异常
            if (DeviceInfo.deviceType == "TV") {	 
  	            @Expect(true)	 
  	        } else {	 
  	            @Expect(e.code == 8300002 || e.code == 8300003 || e.code == 201 || e.code == 2097177)
  	        }
        }
    }

    /**
     * 测试双参数makeCall方法：空phoneNumber,参数没做限制
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_Context_empty_phoneNumber() {
        try {
            Call.makeCall(getAbilityContext(), "")
            @Expect(true)
        } catch (e: BusinessException) {
            // 可能因环境限制抛出异常
            if (DeviceInfo.deviceType == "TV") {	 
  	            @Expect(true)	 
  	        } else {	 
  	            @Expect(e.code == 8300001)
  	        }
        }
    }

    /**
     * 测试双参数makeCall方法：非数字phoneNumber，参数没做限制
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_Context_no_phoneNumber() {
        try {
            Call.makeCall(getAbilityContext(), "abc")
            @Expect(true)
        } catch (e: BusinessException) {
            // 可能因环境限制抛出异常
            if (DeviceInfo.deviceType == "TV") {	 
  	            @Expect(true)	 
  	        } else {	 
  	            @Expect(e.code == 8300001)
  	        }
        }
    }

    /**
     * 测试双参数makeCall方法：无返回值
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_Context_no_return_value() {
        try {
            let result: Unit = Call.makeCall(getAbilityContext(), "13800138000")
            // 验证无返回值，方法调用成功
        } catch (e: BusinessException) {
            // 可能因环境限制抛出异常
           if (DeviceInfo.deviceType == "TV") {	 
  	            @Expect(true)	 
  	        } else {	 
  	            @Expect(e.code == 8300002 || e.code == 8300003 || e.code == 201 || e.code == 2097177)
  	        }
        }
    }


}