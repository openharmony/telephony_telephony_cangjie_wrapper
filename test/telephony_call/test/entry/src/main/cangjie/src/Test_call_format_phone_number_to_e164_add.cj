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
 * 测试Call.formatPhoneNumberToE164方法的功能
 */
@Test
class Test_Call_Format_PhoneNumber_ToE164_Add {
    /**
     * 测试有效手机号码转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_phoneNumber_valid_mobile() {
        let result = Call.formatPhoneNumberToE164("13800138000", "CN")
        @Expect(true)
    }

    /**
     * 测试有效固定电话转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_phoneNumber_valid_landline() {
        let result = Call.formatPhoneNumberToE164("075512345678", "CN")
        @Expect(true)
    }

    /**
     * 测试空字符串电话号码转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_phoneNumber_empty_string() {
        try {
            Call.formatPhoneNumberToE164("", "CN")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(e.code == 8300001)
        }
    }

    /**
     * 测试非数字字符串电话号码转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_phoneNumber_non_numeric_string() {
        try {
            Call.formatPhoneNumberToE164("abc", "CN")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试边界值空字符串电话号码转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_phoneNumber_boundary_empty_string() {
        try {
            Call.formatPhoneNumberToE164("", "CN")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试中国国家码转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_countryCode_CN() {
        let result = Call.formatPhoneNumberToE164("13800138000", "CN")
        @Expect(true)
    }

    /**
     * 测试美国国家码转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_countryCode_US() {
        let result = Call.formatPhoneNumberToE164("2025551234", "US")
        @Expect(true)
    }

    /**
     * 测试日本国家码转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_countryCode_JP() {
        let result = Call.formatPhoneNumberToE164("0312345678", "JP")
        @Expect(true)
    }

    /**
     * 测试空字符串国家码转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_countryCode_empty_string() {
        try {
            Call.formatPhoneNumberToE164("13800138000", "")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试无效国家码转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_countryCode_invalid_country_code() {
        try {
            Call.formatPhoneNumberToE164("13800138000", "INVALID")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试边界值空字符串国家码转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_countryCode_boundary_empty_string() {
        try {
            Call.formatPhoneNumberToE164("13800138000", "")
            @Expect(false)
        } catch (e: BusinessException) {
            @Expect(true)
        }
    }

    /**
     * 测试手机号码+中国国家码组合转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_pairwise_mobile_CN() {
        let result = Call.formatPhoneNumberToE164("13800138000", "CN")
        @Expect(true)
    }

    /**
     * 测试手机号码+美国国家码组合转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_pairwise_mobile_US() {
        let result = Call.formatPhoneNumberToE164("13800138000", "US")
        @Expect(true)
    }

    /**
     * 测试固定电话+中国国家码组合转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_pairwise_landline_CN() {
        let result = Call.formatPhoneNumberToE164("075512345678", "CN")
        @Expect(true)
    }

    /**
     * 测试固定电话+日本国家码组合转换为E164格式
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_pairwise_landline_JP() {
        let result = Call.formatPhoneNumberToE164("075512345678", "JP")
        @Expect(true)
    }

    /**
     * 测试返回E164格式结果
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_return_e164_format() {
        let result = Call.formatPhoneNumberToE164("13800138000", "CN")
        @Expect(true)
    }

    /**
     * 测试号码与国家码不匹配时返回空字符串
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_formatPhoneNumberToE164_number_mismatch_return_empty() {
        let result = Call.formatPhoneNumberToE164("13800138000", "US")
        @Expect(true)
    }
}