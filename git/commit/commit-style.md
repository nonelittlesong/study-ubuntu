# Commit 风格规范

>**Tips**  
>`git commit`，不加 `-m`，会跳出文本编辑器，用于编写多行的 commit message。  
>`git config core.editor "vim"`，修改 git message 的默认编辑器

```
(\ /)
(O.o)
(> <) Bunny approves these changes. 
```

<details>
<summary>References</summary>

- [git commit 编写风格模板 | yulijia](https://yulijia.net/cn/%E6%A0%BC%E5%BC%8F%E6%8A%80%E5%B7%A7/2016/01/21/git-commit-style.html)
- [Commit message 和 Change log 编写指南 | 阮一峰](http://www.ruanyifeng.com/blog/2016/01/commit_message_change_log.html)
- [whatthecommit](http://whatthecommit.com/)

</details>

## 一、Angular 规范

### 1.1 编写规范

```
<type>(<scope>): <subject>
// 空一行
<body>
// 空一行
<footer>
```

- **header**
  - **type**
    - `feat` — 新功能（feature）
    - `fix` — 修补 bug
    - `docs` — 文档（documentation）
    - `style` — 格式（不影响代码运行的变动）
    - `refactor` — 重构（即不是新增功能，也不是修改 bug 的代码变动）
    - `test` — 增加测试
    - `chore` — 构建过程或辅助工具的变动
  - **scope** — 影响范围
  - **subject** — 对 commit 目的的简短描述
    - 以动词开头，使用第一人称现在时
    - 首字母小写
    - 不以句号（`.`）结尾
- **body** — 对本次 commit 的详细描述
  - 使用第一人称现在时
  - 说明代码变动的动机，以及和过去行为的对比
- **footer**
  - 不兼容变动  
    如果当前代码与上一个版本不兼容，则 footer 部分以 `BREAKING CHANGE` 开头，后面是对变动的描述、变动理由和迁移方法  
    ```
    BREAKING CHANGE: isolate scope bindings definition has changed.

    To migrate the code follow the example below:

    Before:

    scope: {
      myAttr: 'attribute',
    }

    After:

    scope: {
      myAttr: '@',
    }

    The removed `inject` wasn't generaly useful for directives so there should be no code using it.
    ```
  - 关闭一个或多个 issue
    ```
    Closes #123, #234, #866
    ```
- **revert** — 特殊情况，当前 commit 用于撤销之前的 commit。必须以 `revert` 开头，后面跟着被撤销 commit 的 header。
  ```
  revert: feat(pencil): add 'graphiteWidth' option

  This reverts commit 667ecc1654a317a13331b17617d973392f415f02.
  ```

### 1.2 模板

```
curl https://gist.githubusercontent.com/nonelittlesong/f249c76b7c95d14a7d4942ba4cffec6c/raw/5bdcabe7450305340ba1b8e49589880145de6573/.git-commit-template-zh_CN.txt >> .git-commit-template.txt
git config --global commit.template .git-commit-template.txt
```