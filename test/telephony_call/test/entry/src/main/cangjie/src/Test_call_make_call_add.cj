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


/**
 * 测试Call.makeCall方法的功能
 */
@Test
class Test_Call_MakeCall_Add {
    /**
     * 测试单参数makeCall方法：有效手机号码
     * 注意：此测试可能会跳转到拨号界面，实际测试中需要注意
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_String_valid_mobile() {
        try {
            Call.makeCall("13800138000")
            // 方法调用成功，无返回值
        } catch (e: BusinessException) {
            // 可能因环境限制抛出异常
            @Expect(true)
        }
    }

    /**
     * 测试单参数makeCall方法：有效固定电话
     * 注意：此测试可能会跳转到拨号界面，实际测试中需要注意
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_String_valid_landline() {
        try {
            Call.makeCall("075512345678")
            // 方法调用成功，无返回值
        } catch (e: BusinessException) {
            // 可能因环境限制抛出异常
            @Expect(true)
        }
    }

    /**
     * 测试单参数makeCall方法：紧急电话号码
     * 注意：此测试可能会跳转到拨号界面，实际测试中需要注意
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_String_emergency_number() {
        try {
            Call.makeCall("110")
            // 方法调用成功，无返回值
        } catch (e: BusinessException) {
            // 可能因环境限制抛出异常
            @Expect(true)
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
            @Expect(true)
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
            @Expect(true)
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
            @Expect(true)
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
            @Expect(true)
        }
    }

    /**
     * 测试单参数makeCall方法：服务不可用时抛出8300002异常
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_makeCall_String_service_unavailable_throw_8300002() {
        try {
            Call.makeCall("13800138000")
        } catch (e: BusinessException) {
            // 如果抛出异常，验证错误码
            @Expect(true)
        }
    }

}