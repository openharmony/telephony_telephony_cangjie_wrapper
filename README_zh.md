# 电话服务仓颉接口<a name="ZH-CN_TOPIC_0000001162422291"></a>

## 简介<a name="section104mcpsimp"></a>

电话服务仓颉接口是在 OpenHarmony 上基于电话服务子系统能力之上封装的仓颉API。电话服务子系统，提供了一系列的API用于获取无线蜂窝网络和SIM卡相关的一些信息。应用可以通过调用API来获取当前注册网络名称、网络服务状态、信号强度以及SIM卡的相关信息。

各个模块主要作用如下：

-   核心服务模块：主要功能是初始化RIL管理、SIM卡和搜网模块。
-   通话管理模块：主要功能是管理CS（Circuit Switch，电路交换）、IMS（IP Multimedia Subsystem，IP多媒体子系统）和OTT（over the top，OTT解决方案）三种类型的通话，申请通话所需要的音视频资源，处理多路通话时产生的各种冲突。
-   蜂窝通话模块：主要功能是实现基于运营商网络的基础通话。
-   蜂窝数据模块：主要功能是实现基于运营商网络的蜂窝数据上网。
-   短彩信模块：主要功能是短信收发和彩信编解码。
-   状态订阅模块：主要功能是提供电话服务仓颉各种消息事件的订阅以及取消订阅的API。
-   数据存储模块：主要功能是持久化数据存储，提供DataAbility访问接口。
-   RIL Adapter模块： 主要功能是与modem通信接口的适配。

**图 1**   子系统架构图

![](figures/telephony_cangjie_wrapper_architecture.png)

## 目录<a name="section119mcpsimp"></a>

```
base/telephony/telephony_cangjie_wrapper
├── ohos             # 仓颉电话服务接口实现
├── kit              # 仓颉kit化代码
├── figures          # 存放readme中的架构图
```

## 约束<a name="section123mcpsimp"></a>

1.  目前开源的范围包括蜂窝通话（仅支持CS通话）、短信、数据上网，支持双SIM卡框架。
2.  南向HDI依赖芯片厂商适配。

## 相关仓<a name="section152mcpsimp"></a>

**电话服务仓颉**

[call_manager](https://gitee.com/openharmony/telephony_call_manager/blob/master/README_zh.md)
