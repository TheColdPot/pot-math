#import "default-theorems.typ"
#import "blackboard-replacement.typ"
#import "constants.typ"
#import "@preview/hydra:0.6.2": hydra


#let pot-math(
  lang: "zh",
  latin-font: "Libertinus Serif",
  math-font: "Libertinus Math",
  cjk-font: "SimSun",
  cjk-sans-font: "SimHei",
  cjk-emph-font: "KaiTi",
  title: "Book",
  // content
  outline: outline(),
  preface: [],
  content,
) = {
  set par(
    justify: true,
    // first-line-indent: (
    //   amount: 2em,
    //   all: true,
    // ),
  )

  // CJK Settings
  set text(
    lang: lang,
    font: (latin-font, cjk-font),
  )
  show heading: set text(
    font: (latin-font, cjk-sans-font),
  )
  show strong: set text(
    font: (latin-font, cjk-sans-font),
  )
  show emph: set text(
    font: (latin-font, cjk-emph-font),
  )
  show math.equation: set text(font: (math-font, latin-font, cjk-font))
  show "。": "．"
  show "，": ", "


  // The original counter is ignored, because we use a "global" numbering, in which figures, theorems, etc. use the same counter.
  set figure(numbering: _ => counter(heading).display("1.1.") + counter(figure).display("1"))

  // We have to put things before content here, so that it is not affected by chapter styles
  set page(
    numbering: "i",
    header: context {
      if calc.odd(here().page()) {
        align(right, counter(page).display())
      } else {
        align(left, counter(page).display())
      }
    },
    footer: none,
  )
  set heading(outlined: false)
  preface
  pagebreak(weak: true)
  outline
  set heading(outlined: true)

  // Reset page
  counter(page).update(0)

  // Chapter
  show heading.where(level: 1): it => {
    counter(figure).update(0)
    pagebreak(weak: true)

    block(
      below: 12em,
      {
        box(
          inset: (bottom: 4pt),
          text(
            size: 16pt,
            counter(heading).display("第一章"),
          ),
        )
        linebreak()
        text(size: 24pt, it.body)
      },
    )
  }

  // Section
  show heading.where(level: 2): it => {
    counter(figure).update(0)
    block(
      above: 3em,
      below: .8em,
      it,
    )
  }

  set heading(numbering: "1.")

  show math.equation: it => {
    it
  }

  // Header & footer
  set page(
    numbering: "1",
    header: context {
      if hydra(1, skip-starting: true) == none {
        return
      }
      if calc.odd(here().page()) {
        emph[#smallcaps[#hydra(2, use-last: true, skip-starting: false)]]
        h(1fr)
        counter(page).display()
      } else {
        counter(page).display()
        h(1fr)
        smallcaps[#title]
      }
    },
    footer: none,
  )

  content
}
