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
 * 测试Call.formatPhoneNumber方法的功能
 */
@Test
class Test_Call_Format_PhoneNumber_Add {
    /**
     * 测试有效手机号码格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_phoneNumber_valid_mobile() {
        let result = Call.formatPhoneNumber("13800138000")
        @Expect(result.size > 0)
    }

    /**
     * 测试有效固定电话格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_phoneNumber_valid_landline() {
        let result = Call.formatPhoneNumber("075512345678")
        @Expect(result.size > 0)
    }

    /**
     * 测试带国际区号的电话号码格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_phoneNumber_with_country_code() {
        let result = Call.formatPhoneNumber("+8613800138000")
        @Expect(result.size > 0)
    }

    /**
     * 测试空字符串电话号码格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_phoneNumber_empty_string() {
        try {
            Call.formatPhoneNumber("")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(e.code == 8300001)
        }
    }

    /**
     * 测试边界值空字符串电话号码格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_phoneNumber_boundary_empty_string() {
        try {
            Call.formatPhoneNumber("")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试默认options参数格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_options_default() {
        let result = Call.formatPhoneNumber("13800138000")
        @Expect(result.size > 0)
    }

    /**
     * 测试中国国家码options参数格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_options_china_country_code() {
        let result = Call.formatPhoneNumber("13800138000", options: NumberFormatOptions(countryCode: "CN"))
        @Expect(result.size > 0)
    }

    /**
     * 测试美国国家码options参数格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_options_us_country_code() {
        let result = Call.formatPhoneNumber("2025551234", options: NumberFormatOptions(countryCode: "US"))
        @Expect(result.size > 0)
    }

    /**
     * 测试日本国家码options参数格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_options_japan_country_code() {
        let result = Call.formatPhoneNumber("0312345678", options: NumberFormatOptions(countryCode: "JP"))
        @Expect(result.size > 0)
    }

    /**
     * 测试空国家码options参数格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_options_empty_country_code() {
        try {
            Call.formatPhoneNumber("13800138000", options: NumberFormatOptions(countryCode: ""))
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试边界值空国家码options参数格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_options_boundary_empty_country_code() {
        try {
            Call.formatPhoneNumber("13800138000", options: NumberFormatOptions(countryCode: ""))
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试手机号码+中国国家码组合格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_pairwise_mobile_cn() {
        let result = Call.formatPhoneNumber("13800138000", options: NumberFormatOptions(countryCode: "CN"))
        @Expect(result.size > 0)
    }

    /**
     * 测试手机号码+美国国家码组合格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_pairwise_mobile_us() {
        let result = Call.formatPhoneNumber("13800138000", options: NumberFormatOptions(countryCode: "US"))
        @Expect(result.size > 0)
    }

    /**
     * 测试固定电话+中国国家码组合格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_pairwise_landline_cn() {
        let result = Call.formatPhoneNumber("075512345678", options: NumberFormatOptions(countryCode: "CN"))
        @Expect(result.size > 0)
    }

    /**
     * 测试固定电话+日本国家码组合格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_pairwise_landline_jp() {
        let result = Call.formatPhoneNumber("075512345678", options: NumberFormatOptions(countryCode: "JP"))
        @Expect(result.size > 0)
    }

    /**
     * 测试国际号码+中国国家码组合格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_pairwise_international_cn() {
        let result = Call.formatPhoneNumber("+8613800138000", options: NumberFormatOptions(countryCode: "CN"))
        @Expect(result.size > 0)
    }

    /**
     * 测试国际号码+默认options组合格式化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_pairwise_international_default_options() {
        let result = Call.formatPhoneNumber("+8613800138000", options: NumberFormatOptions())
        @Expect(result.size > 0)
    }

    /**
     * 测试返回格式化结果
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumber_return_formatted_result() {
        let result = Call.formatPhoneNumber("13800138000", options: NumberFormatOptions(countryCode: "CN"))
        @Expect(result.size > 0)
    }
}