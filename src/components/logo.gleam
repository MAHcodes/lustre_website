import lustre/element.{type Element}
import lustre/element/html.{div, img}
import lustre/attribute.{class, src}
import gleam/string

pub fn logo(
  container_class container_class: String,
  logo_class logo_class: String,
) -> Element(a) {
  div([class(string.append(container_class, ""))], [
    img([class(string.append("object-contain ", logo_class)), src("/logo.svg")]),
  ])
}
