#import "@preview/linguify:0.4.1": load_ftl_data, linguify

#let languages = (
  "zh",
  "en",
)
#let lgf_db = eval(load_ftl_data("../L10n", languages))
#let linguify = linguify.with(from: lgf_db)

#let logo_path = "../../../../utils/res/PKU.svg"
#let logo_str = read(logo_path).replace("920f14", "cccccc")

#let title(
  course_name: none,
  hw_no: none,
  hw_week: none,
  student_id: none,
  student_name: none,
  ..args,
) = context {
  // Logo size
  let logo_size = 1. * page.width
  // Info
  let title = course_name
  let course_title = box(
    text(
      title,
      size: 36pt,
      font: ("Sentinel Pro", "SimSun"),
      baseline: -0.6em,
    ),
  )
  let subtitle = none
  if hw_no != none {
    subtitle = linguify("homeworkOrd", args: (ord: hw_no))
  } else if hw_week != none {
    subtitle = linguify("weekOrd", args: (weekNo: hw_week))
  }
  let info_text = [#subtitle ~ #student_name ~ #student_id]
  let info = box([
    #set text(
      size: 20pt,
      font: ("Sentinel Pro", "SimSun"),
      baseline: 1em,
    )
    #set align(horizon)
    #info_text
  ])
  return [
    #set page(
      paper: "a4",
      margin: 0pt,
    )

    // Logo
    #place(
      center + top,
      dx: 0.4 * logo_size,
      dy: 10pt,
    )[
      #image.decode(logo_str, width: logo_size)
    ]

    // Info panel
    #place(
      bottom + left,
      dx: 0pt,
      dy: -20%,
      rect(fill: rgb("cccccc"), width: 100%, height: 10pt),
    )
    #place(
      bottom + left,
      dx: 24pt,
      dy: -20%,
      course_title,
    )
    #place(
      bottom + left,
      dx: 24pt,
      dy: -20%,
      info,
    )
    #pagebreak(weak: true)
  ]
}

#let other(doc) = {
  set text(
    font: ("Sentinel Pro", "Songti SC"),
    size: 10pt,
  )
  doc
}

