#import "@preview/booktabs:0.0.4": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#let uon-colour = (
  blue: (tint: 100%) => if tint == 5% {
    rgb("#f3f4f5")
  } else if tint == 20% {
    rgb("#cfd4d8")
  } else if tint == 40% {
    rgb("#9fa8b1")
  } else if tint == 60% {
    rgb("#707d89")
  } else if tint == 80% {
    rgb("#405162")
  } else {
    rgb("#10263b")
  },
  red: (tint: 100%) => if tint == 5% {
    rgb("#fcf4f5")
  } else if tint == 20% {
    rgb("#f1d2d5")
  } else if tint == 40% {
    rgb("#e3a4ab")
  } else if tint == 60% {
    rgb("#d57782")
  } else if tint == 80% {
    rgb("#c74958")
  } else {
    rgb("#b91c2e")
  },
  orange: (tint: 100%) => if tint == 5% {
    rgb("#fff9f3")
  } else if tint == 20% {
    rgb("#fee6ce")
  } else if tint == 40% {
    rgb("#fdcd9d")
  } else if tint == 60% {
    rgb("#fbb36b")
  } else if tint == 80% {
    rgb("#fa9a3a")
  } else {
    rgb("#f98109")
  },
  green: (tint: 100%) => if tint == 5% {
    rgb("#f2f7f5")
  } else if tint == 20% {
    rgb("#ccdfd7")
  } else if tint == 40% {
    rgb("#99bfaf")
  } else if tint == 60% {
    rgb("#669f86")
  } else if tint == 80% {
    rgb("#337f5e")
  } else {
    rgb("#005f36")
  },
  sky-blue: (tint: 100%) => if tint == 5% {
    rgb("#f2fafc")
  } else if tint == 20% {
    rgb("#ccebf3")
  } else if tint == 40% {
    rgb("#99d7e6")
  } else if tint == 60% {
    rgb("#66c3da")
  } else if tint == 80% {
    rgb("#33afcd")
  } else {
    rgb("#009bc1")
  },
  stone: (tint: 100%) => if tint == 40% {
    rgb("#fdfbf9")
  } else {
    rgb("#faf6ef")
  },
)

#let uon-project(title: "", authors: (), num-columns: 1, accent-colour: uon-colour.red, body) = {
  set document(author: authors, title: title)
  set text(
    size: 11pt,
    lang: "en",
    region: "gb",
    font: "Fira Sans",
    fill: (uon-colour.blue)(),
  )

  show raw: set text(font: "Fira Mono")
  show raw.where(block: false): set text(size: 11pt)
  show math.equation: set text(font: "Fira Math")

  show: booktabs-default-table-style
  show: codly-init
  codly(languages: codly-languages, zebra-fill: (uon-colour.blue)(tint: 5%))

  set page(
    paper: "a4",
    numbering: "1",
  )

  set heading(numbering: "1.")
  show heading.where(level: 1): set text(size: 18.25pt, fill: accent-colour())
  show heading.where(level: 2): set text(size: 15.5pt, fill: accent-colour(tint: 80%))
  show heading.where(level: 3): set text(size: 12.75pt, weight: "regular", style: "italic")

  align(center, block(
    text(weight: "bold", size: 22pt, title),
  ))

  pad(
    top: 0.8em,
    bottom: 0.8em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  v(1cm)

  show: columns.with(num-columns)

  body
}

#let appendices(body) = {
  set heading(numbering: "A.1.", supplement: "Appendix")
  counter(heading).update(0)
  body
}

#let task-counter = counter("task")
#let task(body) = block(
  fill: (uon-colour.blue)(tint: 5%),
  inset: 5pt,
  width: 100%,
  [
    #task-counter.step()
    *Task #context task-counter.display():* #body
  ],
)
