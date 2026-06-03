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

#let uon-project(title: "", authors: (), two-column: true, serif-font: false, body) = {
  set document(author: authors, title: title)
  set text(
    size: 10pt,
    lang: "en",
    region: "gb",
    font: if serif-font { "Georgia" } else { "Arial" },
    fill: (uon-colour.blue)(),
  )

  show: booktabs-default-table-style
  show: codly-init.with()
  codly(languages: codly-languages)

  set page(
    paper: "a4",
    numbering: "1",
  )

  set heading(numbering: "1.")
  show heading.where(level: 1): set text(size: 17.5pt, fill: (uon-colour.red)())
  show heading.where(level: 2): set text(size: 15pt, fill: (uon-colour.red)(tint: 80%))
  show heading.where(level: 3): set text(size: 12.5pt, weight: "regular", style: "italic")

  align(center, block(
    text(font: "Georgia", weight: "bold", size: 20pt, title),
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

  show: columns.with(if two-column { 2 } else { 1 })

  body
}

#let appendices(body) = {
  set heading(numbering: "A.1.", supplement: "Appendix")
  counter(heading).update(0)
  body
}
