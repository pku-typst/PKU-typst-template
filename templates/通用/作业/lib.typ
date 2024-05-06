#import "@preview/linguify:0.4.1": load_ftl_data, linguify
#import "themes/simple.typ" as simple

#let languages = (
  "zh",
  "en",
)
#let lgf_db = eval(load_ftl_data("./L10n", languages))
#let linguify = linguify.with(from: lgf_db)

/// Theme module:
///   title: (..args) -> content
///   other: (doc) -> content
#let themes = (
  simple: simple,
)
#let available_themes = themes.keys()

#let config(
  course_name: none,
  student_name: none,
  student_id: none,
  theme: "simple",
  doc,
  ..args,
) = {
  assert(type(theme) == str, message: "Invalid theme type, expected str")
  assert(available_themes.contains(theme), message: "Invalid theme " + theme)
  args.named()
  let config_args = args.pos()
  let config_kwargs = (
    course_name: course_name,
    student_name: student_name,
    student_id: student_id,
  ) + args.named()
  let t = themes.at(theme)
  return [
    #show: t.other
    #t.title(..config_args, ..config_kwargs)
    #doc
  ]
}

/// Homework problem:
///
/// Usage:
/// ```typc
/// hw_ex("5.1 光子气体")[题目内容][解答]
/// ```
#let hw_prob(name, problem, solution) = {
  heading(name, bookmarked: true, level: 1)
  problem
  heading(
    context [#linguify("solution")],
    bookmarked: true,
    level: 2,
  )
  solution
}
