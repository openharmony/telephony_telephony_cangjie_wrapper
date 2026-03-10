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
 * 测试Call.isEmergencyPhoneNumber方法的功能
 */
@Test
class Test_Call_IsEmergency_PhoneNumber_Add {
    /**
     * 测试中国报警电话110
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_phoneNumber_110() {
        let result = Call.isEmergencyPhoneNumber("110")
        @Expect(result == true)
    }

    /**
     * 测试中国急救电话120
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_phoneNumber_120() {
        let result = Call.isEmergencyPhoneNumber("120")
        @Expect(result == true)
    }

    /**
     * 测试中国火警电话119
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_phoneNumber_119() {
        let result = Call.isEmergencyPhoneNumber("119")
        @Expect(result == true)
    }

    /**
     * 测试美国紧急电话911
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_phoneNumber_911() {
        let result = Call.isEmergencyPhoneNumber("911")
        @Expect(result == true)
    }

    /**
     * 测试普通手机号码
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_phoneNumber_normal_number() {
        let result = Call.isEmergencyPhoneNumber("13800138000")
        @Expect(result == false)
    }

    /**
     * 测试空字符串电话号码
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_phoneNumber_empty_string() {
        try {
            Call.isEmergencyPhoneNumber("")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试非数字字符串电话号码
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_phoneNumber_non_numeric_string() {
        try {
            Call.isEmergencyPhoneNumber("abc")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试边界值空字符串电话号码
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_phoneNumber_boundary_empty_string() {
        try {
            Call.isEmergencyPhoneNumber("")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试卡槽0
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_options_slot_0() {
        let result = Call.isEmergencyPhoneNumber("110", options: EmergencyNumberOptions(slotId: 0))
        @Expect(result == true)
    }

    /**
     * 测试卡槽1
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_options_slot_1() {
        let result = Call.isEmergencyPhoneNumber("110", options: EmergencyNumberOptions(slotId: 1))
        @Expect(result == true)
    }

    /**
     * 测试负数slotId
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_options_negativeslotId() {
        try {
            Call.isEmergencyPhoneNumber("110", options: EmergencyNumberOptions(slotId: -1))
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试超范围slotId
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_options_out_of_rangeslotId() {
        try {
            Call.isEmergencyPhoneNumber("110", options: EmergencyNumberOptions(slotId: 100))
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试边界值卡槽0
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_options_boundary_slot_0() {
        let result = Call.isEmergencyPhoneNumber("110", options: EmergencyNumberOptions(slotId: 0))
        @Expect(result == true)
    }

    /**
     * 测试边界值卡槽1
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_options_boundary_slot_1() {
        let result = Call.isEmergencyPhoneNumber("110", options: EmergencyNumberOptions(slotId: 1))
        @Expect(result == true)
    }

    /**
     * 测试110+卡槽0组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_pairwise_110_slot_0() {
        let result = Call.isEmergencyPhoneNumber("110", options: EmergencyNumberOptions(slotId: 0))
        @Expect(result == true)
    }

    /**
     * 测试120+卡槽1组合
     */
    /*
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_pairwise_120_slot_1() {
        let result = Call.isEmergencyPhoneNumber("120", options: EmergencyNumberOptions(slotId: 1))
        @Expect(result == true)
    }
    */

    /**
     * 测试119+卡槽0组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_pairwise_119_slot_0() {
        let result = Call.isEmergencyPhoneNumber("119", options: EmergencyNumberOptions(slotId: 0))
        @Expect(result == true)
    }

    /**
     * 测试911+卡槽1组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_pairwise_911_slot_1() {
        let result = Call.isEmergencyPhoneNumber("911", options: EmergencyNumberOptions(slotId: 1))
        @Expect(result == true)
    }

    /**
     * 测试普通号码+卡槽0组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_pairwise_normal_number_slot_0() {
        let result = Call.isEmergencyPhoneNumber("13800138000", options: EmergencyNumberOptions(slotId: 0))
        @Expect(result == false)
    }

    /**
     * 测试普通号码+卡槽1组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_pairwise_normal_number_slot_1() {
        let result = Call.isEmergencyPhoneNumber("13800138000", options: EmergencyNumberOptions(slotId: 1))
        @Expect(result == false)
    }

    /**
     * 测试紧急号码返回true
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_emergency_number_return_true() {
        let result = Call.isEmergencyPhoneNumber("110")
        @Expect(result == true)
    }

    /**
     * 测试非紧急号码返回false
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_non_emergency_number_return_false() {
        let result = Call.isEmergencyPhoneNumber("13800138000")
        @Expect(result == false)
    }

    /**
     * 测试依赖电话服务
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_isEmergencyPhoneNumber_depend_on_phone_service() {
        try {
            let result = Call.isEmergencyPhoneNumber("110")
            @Expect(result == true)
        } catch (e: BusinessException) {
            // 服务不可用时可能抛出异常
            @Expect(true)
        }
    }
}