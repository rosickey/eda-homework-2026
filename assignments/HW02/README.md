## 第二次作业（HW02）：简易交通灯仿真

### 1. 设计单一方向红黄绿三灯逻辑


### 2. 设计要求

- 红、绿常亮30s,黄灯闪亮10s，一次闪亮周期为1s
- 必须使用课堂已经订正的 clk_gen.v，修改为clk_gen_1s.v,端口列表不变，周期为1s
- 使用课堂订正的led.v
- 注意大小写和缩进,tob_tb.v中需要实例化clk_gen_1s、三个led

### 3. 提交文件和 PR

| 路径 | 说明 |
| --- | --- |
| `students/240201101/HW02/clk_gen_1s.v` | 激励信号模块 |
| `students/240201101/HW02/led.v` | led模块 |
| `students/240201101/HW02/top_tb.v` | 测试程序 |
| `students/240201101/HW02/report.png` | 波形图文件 |


在自己的学号分支上，通过 Pull Request 提交至教师仓库 `rosickey/eda-homework-2026` 的 `main`。标题格式为：

```text
[240201101] HW02 - 王明
```

请替换为自己的学号和姓名。Git 具体操作[四、正常提交课程作业](https://github.com/rosickey/eda-homework-2026#%E5%9B%9B%E6%AD%A3%E5%B8%B8%E6%8F%90%E4%BA%A4%E8%AF%BE%E7%A8%8B%E4%BD%9C%E4%B8%9A)