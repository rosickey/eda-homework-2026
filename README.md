# EDA原理及应用 — 课程作业提交说明

课程仓库：[rosickey/eda-homework-2026](https://github.com/rosickey/eda-homework-2026)

本仓库用于《EDA原理及应用》课程的作业提交、修改和教师批改。学生先 Fork 课程仓库，在自己的学号分支完成作业，再通过 Pull Request（简称 PR，合并请求）提交给教师。

**第一次提交只注册身份；注册通过后，再提交课程作业。** 本说明不包含具体实验题目，`HW01`、`HW02` 及文件名均为提交流程示例，不代表已发布的作业。具体任务、软件版本、提交格式和截止时间以教师发布的要求为准。

## 第一次提交没有通过的同学，请尽快修改

# EDA 学生注册 PR 错误处理简表

| PR   | 学号/分支                 | 错误                 | 修改建议                                        |
| ---- | --------------------- | ------------------ | ------------------------------------------- |
| #173 | 240205228             | 缺少必要字段             | 补全 `student_id`、`name`、`github_username`    |
| #171 | patch-1               | 分支名错误、重复           | 用本人9位学号新建分支重新提交，并关闭原 PR                     |
| #168 | patch-1               | 分支名错误、重复           | 用本人9位学号新建分支重新提交，并关闭原 PR                     |
| #163 | 240205327朱志鹏          | 分支名错误              | 分支改为 `240205327`，重新提交 PR                    |
| #160 | main                  | 分支名错误、重复           | 用本人9位学号新建分支重新提交，并关闭原 PR                     |
| #141 | 240205241             | 缺少必要字段             | 补全 `student_id`、`name`、`github_username`    |
| #140 | 240205110             | 缺少 `.student.yml`  | 创建 `students/240205110/.student.yml`        |
| #139 | 230205447             | 缺少 `.student.yml`  | 创建 `students/230205447/.student.yml`        |
| #138 | 240205217             | GitHub账号不一致        | `github_username` 改为提交 PR 的本人 GitHub 用户名    |
| #137 | 240205310             | 缺少 `.student.yml`  | 创建 `students/240205310/.student.yml`        |
| #136 | 240205428             | `tudent_id` 拼写错误   | 改为 `student_id`                             |
| #133 | 240205105             | 缺少必要字段             | 补全三个必要字段                                    |
| #132 | 240205408ying         | 分支名错误              | 分支改为 `240205408`，重新提交 PR                    |
| #127 | hushenghao404-patch-1 | 分支名错误              | 使用本人9位学号作为分支名重新提交                           |
| #120 | 240205319             | 缺少必要字段             | 补全三个必要字段                                    |
| #119 | 240205214             | GitHub用户名重复        | 检查是否重复提交；只保留一个正确 PR                         |
| #117 | 240205417             | 缺少 `.student.yml`  | 创建对应 `.student.yml`                         |
| #115 | 240205326             | 缺少必要字段             | 补全三个必要字段                                    |
| #114 | 240205427             | YAML 缩进错误          | `student_id`、`name`、`github_username` 全部顶格写 |
| #111 | 240205306             | 缺少 `.student.yml`  | 创建对应 `.student.yml`                         |
| #108 | 240205309             | 缺少必要字段             | 补全三个必要字段                                    |
| #91  | 240205317             | 提交了多个身份文件          | 只保留自己的 `students/240205317/.student.yml`    |
| #87  | 240205322             | `styudebt_id` 拼写错误 | 改为 `student_id`                             |
| #86  | main                  | 分支名错误、重复           | 用本人9位学号重新建分支，并关闭原 PR                        |
| #70  | 240205419             | 提交了多个身份文件          | 只保留自己的 `.student.yml`                       |
| #65  | 240205205             | 缺少必要字段             | 补全三个必要字段                                    |
| #62  | 240205202             | 缺少必要字段             | 补全三个必要字段                                    |
| #57  | main                  | 分支错误、账号重复          | 用9位学号重新提交；检查 GitHub 用户名；关闭重复 PR             |
| #51  | 240205218             | 缺少 `.student.yml`  | 创建对应 `.student.yml`                         |
| #49  | 240205224             | 字段名 `github` 错误    | 改为 `github_username`                        |
| #44  | 2754370041            | 分支不是9位学号           | 使用本人真实9位学号重新提交                              |
| #40  | 240205233             | 缺少必要字段             | 补全三个必要字段                                    |
| #39  | 240205118             | 双引号格式错误            | 使用英文半角双引号 `"`                               |
| #38  | 240205113             | GitHub用户名格式错误      | 只填写用户名，不要填写网址或 `@用户名`                       |
| #34  | 240205239             | GitHub账号不一致        | `github_username` 改为本人提交 PR 的账号             |
| #31  | main                  | 分支名错误、重复           | 用本人9位学号重新提交，并关闭原 PR                         |
| #25  | main                  | 分支名错误、重复           | 用本人9位学号重新提交，并关闭原 PR                         |
| #20  | 240205238             | GitHub账号不一致        | `github_username` 改为本人提交 PR 的账号             |
| #8   | 240205109             | 双引号格式错误            | 使用英文半角双引号 `"`                               |

## 正确格式

```yaml
student_id: "240205123"
name: "张三"
github_username: "zhangsan123"
```

文件位置：

```text
students/240205123/.student.yml
```

分支名称：

```text
240205123
```

> `.student.yml` 内容错误时，直接修改后 `commit`、`push` 即可，不需要重新创建 PR。
> 分支名错误时，建议用本人9位学号重新建立分支并创建新 PR，同时关闭原错误 PR。
> 同一学生只保留一个正确的注册 PR。


## 一、必须遵守的规则

每位同学使用自己的 GitHub 账号、9 位完整学号、学号分支和个人目录。例如，11 专业 1 号学生的学号为 `240201101`：

| 项目 | 示例 |
| --- | --- |
| GitHub 用户名 | `wangming123` |
| 学号 | `240201101` |
| 分支名称 | `240201101` |
| 个人目录 | `students/240201101/` |
| 身份文件 | `students/240201101/.student.yml` |

- 学生提交分支必须与本人完整学号一致，不使用 `HW01`、姓名或 `240201101-HW01` 等名称。
- 整个课程期间复用同一个学号分支，不同作业分别放在 `HW01/`、`HW02/` 等子目录中。
- 只能修改 `students/本人学号/`，不能修改其他学生目录，以及课程根目录的 `README.md`、`assignments/`、`.github/` 等公共文件。
- 注册通过后，不得自行修改、删除或重命名 `.student.yml`。
- 作业 PR 统一提交到教师仓库的 `main`；不要直接向教师仓库的 `main` 推送。

这是课程提交规范；自动限制需要教师启用配套检查和分支保护后才生效。检查通过也不代表作业内容正确，仍需教师审核。

> 下文的 `240201101`、`王明`、`wangming123` 都是示例。执行命令前，请替换为自己的信息。即使已在其他课程注册，本课程也需要在本仓库单独完成注册；可以继续使用同一个本人 GitHub 账号。

## 二、Windows 准备工作

### 1. 注册 GitHub 账号

打开 [GitHub](https://github.com)，注册个人账号并完成邮箱验证。

例如个人主页为 `https://github.com/wangming123`，用户名就是 `wangming123`。用户名不是中文昵称，也不是邮箱地址。

不要把账号密码、验证码或访问令牌写入注册文件、作业文件或 PR。

### 2. 安装 Git for Windows

打开 [Git for Windows 官方下载页](https://git-scm.com/install/windows)，根据电脑类型选择安装程序：普通 Intel/AMD 64 位电脑选择 **x64 Setup**，Windows ARM 电脑选择 **ARM64 Setup**。

安装时通常可保留默认设置，并注意：

- 保留 Git Bash 和资源管理器右键菜单相关组件；
- 保留 Git Credential Manager，用于之后的 GitHub 登录；
- 编辑器选择已安装且熟悉的编辑器，不熟悉 Vim 时可以选择可用的记事本或其他编辑器；
- 安装后关闭旧终端，从开始菜单重新打开 **Git Bash**。

输入下面的命令并按 Enter：

```bash
git --version
```

出现 `git version ...` 即说明 Git 可用，无需与截图或其他同学的版本号完全相同。

Git 用于管理与提交文件，不是 EDA 综合、仿真或烧录软件。课程所需 EDA 软件请按教师要求另行准备。

### 3. 打开 Git Bash，认识命令行

本文的命令统一在 **Git Bash** 中执行，不要混用 CMD 或 PowerShell 的目录语法。

可以从开始菜单打开 Git Bash，也可以在课程文件夹的空白处右键选择 **Open Git Bash here / Git Bash Here**。Windows 11 中，该选项有时位于“显示更多选项”内。

使用命令行时请注意：

- 每输入一行命令，按 Enter 执行，确认没有报错后再执行下一行；
- 只复制代码框内的命令，不要复制提示符 `$`、代码框边框或解释文字；
- 粘贴可用终端右键菜单或 `Shift+Insert`；
- 按 ↑ 可找回上一条命令，按 Tab 可补全文件夹名称；
- `git diff` 等命令若进入分页显示，可按 `q` 退出。

| 命令 | 作用 |
| --- | --- |
| `pwd` | 显示当前目录 |
| `ls` | 列出当前目录内容 |
| `ls -la` | 列出包括点号文件在内的全部内容 |
| `cd 文件夹名` | 进入文件夹 |
| `cd ..` | 返回上一级 |
| `mkdir -p 文件夹路径` | 创建目录及所需的上级目录 |
| `clear` | 清理终端显示，不删除文件 |

Windows 和 Git Bash 路径的对应关系如下：

| Windows 路径 | Git Bash 路径 |
| --- | --- |
| `D:\course` | `/d/course` |
| `C:\course` | `/c/course` |
| `D:\EDA Course` | `/d/EDA Course` |

路径包含空格时加英文双引号，例如：

```bash
cd "/d/EDA Course"
```

### 4. 设置 Git 提交者信息

在自己的电脑上配置一次即可：

```bash
git config --global user.name "王明"
git config --global user.email "你的GitHub提交邮箱"
```

将姓名和邮箱替换为本人信息。邮箱可使用添加到 GitHub 的邮箱，或 GitHub 邮箱设置页提供的个人 `noreply` 地址。

检查设置：

```bash
git config --global user.name
git config --global user.email
```

`user.name` 是提交记录中的署名，不是 GitHub 登录操作。填写别人名字不能改变实际登录账号，也不能代替 `.student.yml` 的身份注册。

使用机房共用电脑时，建议在 Clone 后进入仓库，将上述 `--global` 改成 `--local`，只设置当前仓库；使用完毕注意退出账号，不留下个人凭据。

## 三、第一次提交：注册学号与 GitHub 用户名

首次注册 PR **只能新增本人 `.student.yml`，不要同时提交作业**。

### 1. Fork 教师仓库

打开 [课程仓库](https://github.com/rosickey/eda-homework-2026)，点击 **Fork**，Owner 选择自己的个人账号，仓库名保留 `eda-homework-2026`，完成创建。

例如用户名为 `wangming123`，自己的 Fork 就是 `wangming123/eda-homework-2026`。Fork 在 GitHub 上创建副本，后面的 Clone 则把副本下载到电脑。[GitHub Fork 操作说明](https://docs.github.com/en/pull-requests/how-tos/work-with-forks/fork-a-repo)

### 2. Clone 自己的 Fork

先在资源管理器中建立课程文件夹，例如 `D:\course`；没有 D 盘时可选择其他位置。在该文件夹中打开 Git Bash。

把下方 `你的GitHub用户名` 替换为自己的用户名，然后执行：

```bash
git clone https://github.com/你的GitHub用户名/eda-homework-2026.git
cd eda-homework-2026
git status
```

请 Clone 自己的 Fork，不是教师的仓库，也不是其他课程的仓库。Clone 只需做一次，以后继续使用这个本地文件夹。

### 3. 添加教师仓库为 upstream

在刚 Clone 的仓库目录中执行一次：

```bash
git remote add upstream https://github.com/rosickey/eda-homework-2026.git
git remote -v
```

检查对应关系：

| 远程名称 | 应指向的仓库 | 用途 |
| --- | --- | --- |
| `origin` | `你的GitHub用户名/eda-homework-2026` | 上传本人分支 |
| `upstream` | `rosickey/eda-homework-2026` | 获取课程最新内容 |

后续命令都在本地 `eda-homework-2026` 仓库内执行。如果不确定位置，先运行 `pwd` 和 `git status`。

### 4. 创建本人学号分支

从教师主分支的最新内容创建学号分支：

```bash
git fetch upstream
git switch -c 240201101 upstream/main
git branch --show-current
```

最后一条命令应显示 `240201101`。请换成本人学号；分支只创建一次，之后使用 `git switch 学号` 切换即可。

### 5. 创建学生身份文件

以下仍以 `240201101` 为例：

```bash
mkdir -p students/240201101
touch students/240201101/.student.yml
notepad.exe students/240201101/.student.yml
```

在记事本中输入以下三行，全部替换为本人真实信息，并以 UTF-8 保存：

```yaml
student_id: "240201101"
name: "王明"
github_username: "wangming123"
```

- `student_id` 与分支名、目录名必须是同一个 9 位学号；
- `github_username` 必须是本人提交 PR 的 GitHub 用户名；
- 使用英文冒号、英文双引号，保留学号两侧的双引号，不要增加其他字段。

保存后检查：

```bash
ls -la students/240201101
```

文件名必须是 `.student.yml`，不是 `.student.yml.txt`。可在 Windows 资源管理器中启用“显示文件扩展名”检查；在 Git Bash 中，以点号开头的文件需要用 `ls -la` 查看。

### 6. 检查、Commit、Push

先把身份文件加入暂存区，检查本次准备提交的文件：

```bash
git status
git add students/240201101/.student.yml
git diff --cached --name-only
git diff --cached
```

确认只包含本人身份文件，内容无误后，再执行：

```bash
git commit -m "register 240201101 王明"
git push -u origin 240201101
```

`commit` 是保存本地提交记录，`push` 是上传到自己的 Fork，之后还要创建 PR 才算交给教师。

第一次需要身份验证的 HTTPS 操作（通常是 Push）可能弹出 Git Credential Manager 或浏览器。按提示登录本人 GitHub 账号并完成授权；公开仓库 Clone 时没有登录提示也属正常。Git for Windows 包含 GCM，可管理该登录过程，无需把令牌写进命令或文件。[GitHub HTTPS 登录说明](https://docs.github.com/en/get-started/git-basics/caching-your-github-credentials-in-git)

### 7. 创建注册 PR

在 GitHub 打开自己的 Fork，点击 **Compare & pull request**；没有提示时可通过 **Contribute → Open pull request** 或 **Pull requests → New pull request** 进入比较页面，必要时选择 **compare across forks**。

务必核对：

| 页面字段 | 应选择的内容 |
| --- | --- |
| base repository | `rosickey/eda-homework-2026` |
| base | `main` |
| head repository / head fork | `你的GitHub用户名/eda-homework-2026` |
| compare | `你的9位学号` |

注册 PR 标题：

```text
[REGISTER] 240201101 王明
```

在 **Files changed** 中确认只新增本人 `.student.yml`，再提交 PR，等待教师核对姓名、学号、PR 作者和 Fork 所有者。

教师合并注册 PR 后，才视为本课程身份绑定完成。集中注册阶段可能还没有自动检查，不能以“没有检查”为由判断注册成功。

如需更改姓名、学号或 GitHub 账号，请联系教师，不要自行修改已合并的身份文件。

## 四、正常提交课程作业

### 1. 先查看本次作业要求

按教师发布的题目完成作业。若仓库已发布作业资料，可查看 `assignments/`；本 README 不预设 HW01 的具体内容。

EDA 作业所需材料可能包括 HDL 源代码、测试文件、工程配置、约束文件、仿真结果或报告。**具体提交哪些文件，以对应作业要求为准，不统一限定为 PDF，也不要求每次交齐所有类型。**

如布置了源代码或测试文件，应提交实际文件，不要只交代码截图。不要提交与作业无关的安装包、软件缓存或自动生成的中间文件；教师要求的输出文件除外。

### 2. 同步课程仓库

在本地 `eda-homework-2026` 文件夹中打开 Git Bash。先执行：

```bash
git status
```

如有未处理的本地改动，先确认并妥善保存；不要直接覆盖文件。确认可以同步后执行：

```bash
git fetch upstream
git switch 240201101
git merge --no-edit upstream/main
```

已经在仓库内时，不需要再次执行 `cd eda-homework-2026`。如果发生合并冲突或其他错误，停止操作并保留提示，请教师协助；不要用强制推送或硬重置解决。

### 3. 创建作业目录，放入需要提交的文件

例如教师发布了 HW01，创建：

```bash
mkdir -p students/240201101/HW01
```

将要求的文件放入该目录。以下只是结构示例，文件名应按实际任务调整：

| 示例路径 | 说明 |
| --- | --- |
| `students/240201101/.student.yml` | 已注册身份文件，保持不变 |
| `students/240201101/HW01/top.v` | 如任务要求 Verilog 源代码，可放在此处 |
| `students/240201101/HW01/top_tb.v` | 如任务要求 testbench，可放在此处 |
| `students/240201101/HW01/report.pdf` | 仅在任务要求报告时提交 |
| `students/240201101/HW02/` | 后续第二次作业目录，不是新分支 |

不要把别人的文件或课程公共文件复制进本次提交中。提交前保存编辑器、仿真软件或工程中的最新修改，并按作业要求完成本地检查。

### 4. 检查并提交

把本次作业文件加入暂存区：

```bash
git status
git diff
git add students/240201101/HW01/
git diff --cached --name-only
git diff --cached
```

确认暂存文件清单只包含本次应交的文件，没有他人目录、身份文件或课程公共文件。PDF、截图等二进制文件的内容需要自行打开检查，不能只依赖 `git diff`。

确认无误后：

```bash
git commit -m "240201101 HW01"
git push origin 240201101
```

后续作业将目录和提交信息中的 `HW01` 换成相应编号，分支仍为本人学号。

### 5. 创建作业 PR

PR 方向仍为本人 Fork 的学号分支，到 `rosickey/eda-homework-2026` 的 `main`。

标题格式为 `[学号] 作业编号 - 姓名`，例如：

```text
[240201101] HW01 - 王明
```

PR 描述中可简要说明完成内容，以及作业要求的运行、仿真或查看方法；不要填写无关个人信息。

教师启用自动检查后，查看 PR 的 **Checks** 结果。通过后等待教师审核，不要自行把检查通过等同于作业合格。

**同一学号分支向同一目标分支的未合并 PR，会包含之后继续 Push 的提交。** 上一份注册或作业 PR 尚未合并时，不要将下一次作业混入其中。PR 合并后继续保留学号分支，不要点击删除分支。

## 五、教师要求修改时

如果作业 PR 尚未合并，直接修改本地作业，再推送到同一分支，不必重复创建 PR：

```bash
git status
git add students/240201101/HW01/
git diff --cached --name-only
git diff --cached
```

检查无误后执行：

```bash
git commit -m "240201101 HW01 fix"
git push origin 240201101
```

原 PR 会自动更新；已启用的检查也会重新运行。若原 PR 已合并，先同步教师仓库，再按教师要求提交修订并创建新的 PR。

需要提交报告或导出图纸的作业，修改源文件后记得重新生成对应输出文件。

## 六、常见问题

| 提示或现象 | 检查与处理 |
| --- | --- |
| `git: command not found` | 确认 Git for Windows 已安装，重新打开 Git Bash |
| `No such file or directory` | 用 `pwd`、`ls` 检查当前位置；含空格的路径加英文双引号 |
| `not a git repository` | 当前不在仓库内；进入本地 `eda-homework-2026` 后重试 |
| `remote upstream already exists` | 已添加过该远程；用 `git remote -v` 核对，不要重复添加 |
| `a branch named ... already exists` | 分支已创建；使用 `git switch 本人学号` 切换 |
| `.student.yml` 实际为 `.student.yml.txt` | 显示文件扩展名后修正文件名，并检查 UTF-8 编码 |
| `nothing to commit` | 检查是否保存了文件、是否已 `git add`；也可能改动已经提交 |
| Push 被拒绝或无权限 | 确认登录的是本人账号，`origin` 指向本人 Fork；不要使用 `--force` |
| `Unknown student ID` | 学号分支不正确，或教师尚未把本人的注册加入检查名单 |
| `GitHub username does not match` | PR 作者不是该学号已绑定的账号 |
| `Head repository owner does not match` | PR 来源不是本人 Fork |
| `Unauthorized ... path` | 修改或重命名涉及本人目录以外的路径 |
| `Registration file is locked` | 修改、删除或重命名了已注册的 `.student.yml` |

自动检查失败时先查看错误原因，再修改原 PR；不要重复创建相同 PR。身份变更、合并冲突或不确定如何恢复的改动，请联系教师，不要随意删除文件。

## 七、提交前检查清单

- [ ] 当前使用的是本人 GitHub 账号和本课程仓库。
- [ ] 当前分支是本人 9 位完整学号。
- [ ] 首次注册只新增本人 `.student.yml`；注册通过后不再修改它。
- [ ] 正常作业仅修改 `students/本人学号/本次作业编号/` 下应提交的文件。
- [ ] 文件格式和内容符合本次作业要求，已完成要求的本地检查。
- [ ] 暂存区没有他人文件、公共文件、无关缓存或凭据。
- [ ] 已检查 `git status` 和 `git diff --cached --name-only`。
- [ ] PR 目标是 `rosickey/eda-homework-2026` 的 `main`。
- [ ] PR 标题包含本人学号、作业编号和姓名。
- [ ] 教师启用自动检查后，相关检查已经通过，并等待人工审核。

## 八、日常命令速查

以下在本地仓库内执行，示例学号和作业编号需替换为本人实际信息。

查看状态与分支：

```bash
git status
git branch --show-current
git remote -v
```

开始新作业前，在确认本地改动已妥善处理后同步：

```bash
git fetch upstream
git switch 240201101
git merge --no-edit upstream/main
```

准备提交并查看文件清单：

```bash
git add students/240201101/HW01/
git diff --cached --name-only
git diff --cached
```

确认无误后提交并上传：

```bash
git commit -m "240201101 HW01"
git push origin 240201101
```

最后到 GitHub 创建或查看对应 PR。只在本地保存文件、只 Commit 或只 Push，都不能代替向教师仓库提交 PR。
