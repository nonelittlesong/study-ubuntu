# Github Actions
<details>
  <summary>Resources</summary>
  
  - [Github Actions | 阮一峰](http://www.ruanyifeng.com/blog/2019/09/getting-started-with-github-actions.html)  
</details>
<details>
  <summary>实例</summary>
  
  - [auto-green](https://github.com/nonelittlesong/auto-green)  
</details>

## 一、 基本概念
- workflow（工作流程） - 持续集成一次运行的过程，就是一个 workflow。  
- job（任务） - 一个 workflow 由一个或多个 jobs 构成。  
- step（步骤） - 每个 job 由多个 step 构成。  
- action（动作） - 每个 step 可执行一个或多个命令（action）。  

## 二、 [workflow](https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions)
Github Actions 的配置文夹叫做 workflow 文夹，放在代码仓库的 `.github/workflow` 目录。  

