# 电话服务仓颉封装

## 简介

电话服务仓颉封装是在OpenHarmony上面向开发者使用仓颉语言进行应用开发时提供的呼叫管理能力，包括拨打电话、获取通话属性、格式化电话号码。
当前开放的电话服务仓颉封装仅支持standard设备。

## 系统架构

**图 1**  电话服务仓颉封装架构图

![电话服务仓颉封装架构图](figures/telephony_cangjie_wrapper_architecture.png)

如架构图所示：

接口层：
- 呼叫管理：面向开发者提供呼叫管理能力，包括拨打电话、获取通话属性、格式化电话号码。
  - 拨打电话：面向开发者提供拨打电话的能力，能够跳转到系统拨号界面，并显示被叫号码。
  - 获取通话属性：面向开发者提供获取当前通话状态，检查当前设备是否具备语音通话能力，检查当前设备是否正在通话以及判断是否是紧急电话号码的能力。
  - 格式化电话号码：面向开发者提供格式化电话号码的能力，格式化后的号码满足标准数字字串或者E.164表示形式。

框架层：
- 呼叫管理封装：基于底层通话管理能力实现呼叫管理封装，能够支持拨打电话，获取通话属性以及格式化电话号码。

架构图中依赖部件引入说明：
- 通话管理：呼叫管理封装依赖通话管理的系统通话管理能力，用于处理通话下行操作（如拨号、接听、挂断等）和上行状态（来电状态、呼叫等待状态等）的处理，并解决通话过程中产生的冲突。
- ability_cangjie_wrapper：呼叫管理封装依赖ability_cangjie_wrapper提供的应用上下文能力，用于拨打电话时跳转到拨号界面。
- hiviewdfx_cangjie_wrapper：呼叫管理封装依赖hiviewdfx_cangjie_wrapper提供的HiLog日志能力，用于在关键路径打印日志。
- cangjie_ark_interop：呼叫管理封装依赖cangjie_ark_interop提供的仓颉注解类定义和BusinessException异常类定义，用于对API进行标注，及在错误分支向用户抛出异常。

## 目录

```
base/telephony/telephony_cangjie_wrapper
├── figures          # 存放README中的架构图
├── kit              # 仓颉TelephonyKit的kit化代码
│   └── TelephonyKit # TelephonyKit模块实现
├── ohos             # 仓颉电话服务接口实现
│   └── telephony    # 电话服务模块
│       └── call     # 呼叫管理模块
└── test             # 测试用例
    └── telephony_call # 呼叫管理测试用例
```

## 使用说明

当前电话服务仓颉封装提供了以下功能：

- 呼叫管理。

电话服务相关接口请参见[电话服务API文档](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/apis/TelephonyKit/cj-apis-telephony-call.md)，相关开发指导请参见[电话服务开发指南](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_zh_cn/telephony/cj-telephony-call.md)。

## 约束

- 硬件上，需要搭载的设备支持扬声器或听筒、麦克风以及插入SIM卡。

与ArkTS提供的API能力相比，暂不支持以下功能：

  - 蜂窝数据。
  - eSIM卡管理。
  - 订阅管理。
  - 网络搜索。
  - SIM卡管理。
  - 短信服务。

## 参与贡献

欢迎广大开发者贡献代码、文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[ability_ability_cangjie_wrapper](https://gitcode.com/openharmony-sig/ability_ability_cangjie_wrapper)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[telephony_call_manager](https://gitcode.com/openharmony/telephony_call_manager)
