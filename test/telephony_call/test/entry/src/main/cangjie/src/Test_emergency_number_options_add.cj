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
 * 测试EmergencyNumberOptions类的功能
 */
@Test
class Test_Emergency_NumberOptions_Add {
    /**
     * 测试EmergencyNumberOptions.init(slotId: 0)构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_init_slotId_0() {
        let options = EmergencyNumberOptions(slotId: 0)
        @Expect(options.slotId == 0)
    }

    /**
     * 测试EmergencyNumberOptions.init(slotId: 1)构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_init_slotId_1() {
        let options = EmergencyNumberOptions(slotId: 1)
        @Expect(options.slotId == 1)
    }

    /**
     * 测试EmergencyNumberOptions.init(slotId: -1)构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_init_slotId_negative() {
        let options = EmergencyNumberOptions(slotId: -1)
        @Expect(options.slotId == -1)
    }

    /**
     * 测试EmergencyNumberOptions.init(slotId: 100)构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_init_slotId_out_of_range() {
        let options = EmergencyNumberOptions(slotId: 100)
        @Expect(options.slotId == 100)
    }

    /**
     * 测试EmergencyNumberOptions.init(slotId: 0)边界值构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_init_slotId_boundary_zero() {
        let options = EmergencyNumberOptions(slotId: 0)
        @Expect(options.slotId == 0)
    }

    /**
     * 测试EmergencyNumberOptions.init(slotId: 1)边界值构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_init_slotId_boundary_one() {
        let options = EmergencyNumberOptions(slotId: 1)
        @Expect(options.slotId == 1)
    }

    /**
     * 测试EmergencyNumberOptions()默认构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_init_slotId_default() {
        let options = EmergencyNumberOptions()
        @Expect(options.slotId == 0)
    }

    /**
     * 测试EmergencyNumberOptions.slotId属性读取卡槽0
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_slotId_read_slot_0() {
        let options = EmergencyNumberOptions(slotId: 0)
        @Expect(options.slotId == 0)
    }

    /**
     * 测试EmergencyNumberOptions.slotId属性读取卡槽1
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_slotId_read_slot_1() {
        let options = EmergencyNumberOptions(slotId: 1)
        @Expect(options.slotId == 1)
    }

    /**
     * 测试EmergencyNumberOptions.slotId属性写入卡槽0
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_slotId_write_slot_0() {
        let options = EmergencyNumberOptions()
        options.slotId = 0
        @Expect(options.slotId == 0)
    }

    /**
     * 测试EmergencyNumberOptions.slotId属性写入卡槽1
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_EmergencyNumberOptions_slotId_write_slot_1() {
        let options = EmergencyNumberOptions()
        options.slotId = 1
        @Expect(options.slotId == 1)
    }
}