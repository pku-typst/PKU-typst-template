#import "@preview/linguify:0.4.1": load_ftl_data, linguify

#let languages = (
  "zh",
  "en",
)
#let lgf_db = eval(load_ftl_data("../L10n", languages))
#let linguify = linguify.with(from: lgf_db)

#let title(
  course_name: none,
  hw_no: none,
  hw_week: none,
  student_id: none,
  student_name: none,
  ..args,
) = context {
  let title = course_name
  let subtitle = none
  if hw_no != none {
    subtitle = linguify("homeworkOrd", args: (ord: hw_no))
  } else if hw_week != none {
    subtitle = linguify("weekOrd", args: (weekNo: hw_week))
  }
  let author = [#student_id \ #student_name]
  return [
    #v(40pt)
    #align(center)[
      #set text(font: ("Microsoft Sans Serif", "SimHei"))
      #text(size: 28pt, weight: "bold")[
        #title
      ]

      #text(size: 18pt)[
        #subtitle
      ]

      #text(size: 12pt, font: "Kaiti SC")[
        #author
      ]
    ]
    #pagebreak(weak: true)
  ]
}

#let other(doc) = {
  set text(font: "Songti SC", size: 10pt)
  doc
}
