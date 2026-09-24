---
title: Hello, ComputingX!
date: 2026-09-24 10:00:00 +0800
category: Notes
tags: [test, computing]
---

这是本站的第一篇测试文章，用来验证文章排版、图片、代码高亮等各项效果。

## 1. 图片效果

下面是一张 SVG 绘制的计算栈分层示意图，带图注和阴影：

![Computing Stack](/assets/img/posts/2026-09-24-hello-computingx/stack.svg){: .shadow w="720" }
_图 1：经典的计算栈分层——从硬件到应用_

## 2. 代码高亮

```c
#include <stdio.h>

int main(void) {
    printf("Hello, ComputingX!\n");
    for (int i = 0; i < 3; i++) {
        printf("  layer %d is ready\n", i);
    }
    return 0;
}
```

## 3. 引用与列表

> Everything is computable.
> —— 本站信条

- 支持分类（Categories）与标签（Tags）归档
- 支持目录（TOC）、暗色模式、PWA 离线访问
- 支持 RSS 订阅

## 4. 表格

| 层级 | 关注点 | 举例 |
| ---- | ------ | ---- |
| Application | 业务逻辑 | Web 服务、推理服务 |
| Framework | 抽象与调度 | glibc、CUDA、ONNX Runtime |
| OS | 资源管理与隔离 | Linux、RTOS |
| Hardware | 算力与带宽 | CPU / GPU / NPU |

## 5. 数学公式

行内公式 $E = mc^2$，以及块级公式：

$$
\text{Speedup} = \frac{1}{(1 - p) + \dfrac{p}{n}}
$$

---

如果以上内容渲染都正常，说明博客平台已经完全就绪。🎉
