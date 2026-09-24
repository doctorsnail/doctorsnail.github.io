---
# ===== 文章模板：复制到 _posts/ 并重命名为 YYYY-MM-DD-标题.md =====
# 标题（显示在页面上的标题，可以和文件名不同，支持中文）
title: 文章标题
# 发布日期（默认取文件名中的日期，这里可精确到时间）
date: 2026-09-24 10:00:00 +0800

# ===== 以下均为可选，删掉则使用默认值 =====

# 分类（一篇文章一个分类；改用 categories 可多个）
category: Computing
# 标签（可多个）
tags: [systems, notes]

# 文章顶部大图（可选，放文章同名图片目录下）
# image: /assets/img/posts/<文章目录>/cover.png

# 作者（默认取 _config.yml 中的 social.name，无需填）
# author: Victor.Chen

# 关闭目录 / 评论（默认已全局开启，无需填）
# toc: false
# comments: false

# 置顶（Pinned，可选）
# pin: true

# 数学公式（LaTeX，可选）
# math: true

# Mermaid 图表（可选）
# mermaid: true
---

正文从这里开始。支持 Markdown 全部语法。

## 插入图片

图片放到 `assets/img/posts/<文章同名目录>/` 下，然后这样引用（推荐用 `/:...` 绝对路径的形式，例如：`/assets/img/posts/2026-09-24-my-first-post/arch.png`）：

```markdown
![架构图](/assets/img/posts/2026-09-24-my-first-post/arch.png)
```

图注 + 居中的写法：

```markdown
![架构图](/assets/img/posts/2026-09-24-my-first-post/arch.png){: .shadow w="720" }
_图 1：整体架构_
```

## 代码块

```python
def hello():
    print("Hello, ComputingX")
```
