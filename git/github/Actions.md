# Github Actions
<details>
  <summary>Resources</summary>
  
  - [Github Actions 官方文档](https://docs.github.com/en/free-pro-team@latest/actions)  
  - [YAML 官网](https://yaml.org/)  
  - [github/actions](https://github.com/actions)  
  - [Github Actions | 阮一峰](http://www.ruanyifeng.com/blog/2019/09/getting-started-with-github-actions.html)  
</details>
<details>
  <summary>实例</summary>
  
  - [auto-green](https://github.com/nonelittlesong/auto-green)
  - [Github Action 同步代码到 Gitee | Yikun](http://yikun.github.io/2020/01/17/%E5%B7%A7%E7%94%A8Github-Action%E5%90%8C%E6%AD%A5%E4%BB%A3%E7%A0%81%E5%88%B0Gitee/)

</details>

## 一、 基本概念
- workflow（工作流程） - 持续集成一次运行的过程，就是一个 workflow。  
- job（任务） - 一个 workflow 由一个或多个 jobs 构成。  
- step（步骤） - 每个 job 由多个 step 构成。  
- action（动作） - 每个 step 可执行一个或多个命令（action）。  

## 二、 [workflow](https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions)
Github Actions 的配置文夹叫做 workflow 文夹，放在代码仓库的 `.github/workflow` 目录。  

