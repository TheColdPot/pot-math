#import "default-theorems.typ"
#import "blackboard-replacement.typ"

#let pot-math(
  lang: "zh",
  // content
  content,
) = {
  set par(justify: true)
  set text(
    lang: lang,
    font: (
      (
        name: "STIX Two Text",
        covers: "latin-in-cjk"
      ),
      "SimSun",
    )
  )
  show heading: set text(font: ("STIX Two Text", "SimHei"))
  show strong: set text(font: ("STIX Two Text", "SimHei"))
  show "。": "．"
  show "，": ", "
  set figure(numbering: it => counter(heading).display("1.1.") + str(it))

  set heading(numbering: "1.")

  show math.equation: it => {

    it
  }

  content
}
