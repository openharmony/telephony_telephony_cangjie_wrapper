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
 * 测试NumberFormatOptions类的功能
 */
@Test
class Test_Number_FormatOptions_Add {
    /**
     * 测试NumberFormatOptions.init(countryCode: "CN")构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_NumberFormatOptions_init_countryCode_CN() {
        let options = NumberFormatOptions(countryCode: "CN")
        @Expect(options.countryCode == "CN")
    }

    /**
     * 测试NumberFormatOptions.init(countryCode: "US")构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_NumberFormatOptions_init_countryCode_US() {
        let options = NumberFormatOptions(countryCode: "US")
        @Expect(options.countryCode == "US")
    }

    /**
     * 测试NumberFormatOptions.init(countryCode: "JP")构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_NumberFormatOptions_init_countryCode_JP() {
        let options = NumberFormatOptions(countryCode: "JP")
        @Expect(options.countryCode == "JP")
    }

    /**
     * 测试NumberFormatOptions.init(countryCode: "")构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_NumberFormatOptions_init_countryCode_empty_string() {
        let options = NumberFormatOptions(countryCode: "")
        @Expect(options.countryCode == "")
    }

    /**
     * 测试NumberFormatOptions.init(countryCode: "INVALID")构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_NumberFormatOptions_init_countryCode_invalid_country_code() {
        let options = NumberFormatOptions(countryCode: "INVALID")
        @Expect(options.countryCode == "INVALID")
    }

    /**
     * 测试NumberFormatOptions.init(countryCode: "")边界值构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_NumberFormatOptions_init_countryCode_boundary_empty_string() {
        let options = NumberFormatOptions(countryCode: "")
        @Expect(options.countryCode == "")
    }

    /**
     * 测试NumberFormatOptions()默认构造函数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_NumberFormatOptions_init_countryCode_default() {
        let options = NumberFormatOptions()
        @Expect(options.countryCode == "CN")
    }


    /**
     * 测试NumberFormatOptions.countryCode属性读取US
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_NumberFormatOptions_countryCode_read_us() {
        let options = NumberFormatOptions(countryCode: "US")
        @Expect(options.countryCode == "US")
    }

    /**
     * 测试NumberFormatOptions.countryCode属性写入JP
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_NumberFormatOptions_countryCode_write_jp() {
        let options = NumberFormatOptions()
        options.countryCode = "JP"
        @Expect(options.countryCode == "JP")
    }
}