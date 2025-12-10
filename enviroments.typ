#let _the-thm-counter-at(place) = numbering("1.1.", ..counter(heading).at(place)) + numbering("1", counter("thm").at(place).first() + 1)
#let _the-thm-counter() = _the-thm-counter-at(here())

#let theorem-like(
  theorem-type,
  color,
  title-color,
  numbering: "thm",
  alias: "",
  content
) = figure(
    numbering: it => counter(heading).display("1.1.") + str(it),
    supplement: theorem-type,
    {
      set align(left)
      block(
        width: 100%,
        stroke: (left: 1pt + color),
        inset: (left: 1em, y: 5pt),
        {
          block(
            text(fill: title-color, strong[
              #theorem-type#h(0.5em)#{context counter(heading).display("1.1.") + counter(figure).display("1.")}
              #h(2em)#alias
            ])
          )
          content
        }
      )
    }
  )



#let proof(proof: "证明", content) = [
  *#proof*#h(1em)#content
  #h(1fr)#sym.square
]
