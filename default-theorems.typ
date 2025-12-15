#import "environments.typ": theorem-like

#let theorem(alias: "", content) = theorem-like("定理", rgb("#00796b"), rgb("#00796b"), alias: alias, content)
#let definition(alias: "", content) = theorem-like("定义", rgb("#00796b"), rgb("#00796b"), alias: alias, content)
#let corollary(alias: "", content) = theorem-like("推论", rgb("#00796b"), rgb("#00796b"), alias: alias, content)