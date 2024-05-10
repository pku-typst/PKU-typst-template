#import "@local/PKU-Typst-Template:0.1.0": 通用作业

#set text(lang: "zh")

#show: 通用作业.config.with(
  course_name: "实验测试中的测试方法",
  student_id: 2200011001,
  student_name: "张测试",
  hw_no: 14,
)

#let QED = sym.square.stroked

#通用作业.hw_prob("习题 11.4")[
  已知若 $p$ 为真则 $q$ 为真, 给定 $q$ 为假求证 $p$ 为假
][
  显然
  #QED
]