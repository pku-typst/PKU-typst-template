#import "../../../utils/zihao.typ": *
#import "@local/numblex:0.1.0": *

#let 黑体 = "SimHei"
#let 微软雅黑 = "Microsoft YaHei"
// #let 宋体 = "SimSun"
#let 宋体 = "Songti SC"
#let 仿宋 = "STFangsong"
#let 楷体 = "Kaiti SC"

/// 分级标题设置，原文：
///
/// > 一级标题：序号一、二、三……，居中，黑体四号，加粗【副标题黑体字小四】
/// > 二级标题：序号（一）（二）（三）……，宋体小四，加粗，前端空两字符
/// > 三级标题：序号 1.2.3.……，宋体小四，前端空两字符
/// > 四级标题：序号（1）（2）（3）……，宋体小四，可以不重启行
/// > 【说明：最后一级可用第一，第二，……或者首先，其次，最后……。例如： 一级标题一、二、……，二级标题（一）（二）……，最后一级标题第一，第二，…… 或者首先，其次，最后（如果有三点以上，最好用第一，第二，……）】
#let __heading = doc => {
  set heading(
    numbering: numblex(numberings: (
      "一、",
      "（一）",
      "1.",
      "（1）",
    )),
  )
  show heading.where(level: 1): text.with(
    font: 黑体,
    size: 四号,
    weight: "bold",
  )
  show heading.where(level: 2): doc => [
    #show: block
    #show: text.with(
      font: 宋体,
      size: 小四,
      weight: "bold",
    )
    #h(2em)#counter(heading).display(doc.numbering)#doc.body
  ]
  show heading.where(level: 3): doc => [
    #show: block
    #show: text.with(
      font: 宋体,
      size: 小四,
    )
    #h(2em)#counter(heading).display(doc.numbering)#doc.body
  ]
  show heading.where(level: 4): text.with(
    font: 宋体,
    size: 小四,
  )
  // 标题下方空格
  show heading: doc => {
    doc
    v(0.8em)
  }
  doc
}

#let config = doc => {
  set page(
    paper: "a4",
    margin: (top: 2.52cm, bottom: 2.08cm, left: 3.15cm, right: 3.15cm),
  )

  // 正文
  set par(leading: 1em, first-line-indent: 2em, justify: true)
  show: text.with(font: 宋体, size: 小四)

  // 分级标题
  show: __heading
  doc
}

#let title(
  title: none,
  faculty: none,
  author: none,
  abstract: none,
  keywords: (),
) = {
  set par(justify: true)
  align(center)[
    #par(leading: 1.14em)[
      #text(font: 微软雅黑, size: 15.5pt)[#title]
    ]
  ]
  v(14pt)
  align(center)[
    #text(font: 仿宋, size: 小四)[#faculty#h(1em)#author]
  ]
  v(14pt)
  par(leading: 1.48em, first-line-indent: 0pt)[
    #text(font: 黑体)[摘要：]#text(font: 楷体)[#abstract]
  ]
  v(14pt)
  par(leading: 1.48em, first-line-indent: 0pt)[
    #text(font: 黑体)[关键词：]#text(font: 楷体)[#keywords.dedup().join("；")]
  ]
  v(20pt)
}
