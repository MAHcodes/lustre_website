import lustre/element.{type Element, text}
import components/section.{section}
import lustre/attribute.{alt, class, href, src, target}
import lustre/element/html.{a, div, img, li, span, ul}
import gleam/list
import gleam/int

pub type User {
  User(login: String, avatar_url: String, html_url: String, contributions: Int)
}

fn contributor(user: User) -> Element(a) {
  li([class("relative group")], [
    a([href(user.html_url), target("_blank")], [
      img([
        class(
          "group-hover:outline outline-4 outline-dark-charcoal size-16 rounded-full group-hover:scale-110 transition-transform duration-300",
        ),
        src(user.avatar_url),
        alt(user.login),
      ]),
    ]),
    div([class("tooltip")], [
      div([], [
        span([class("text-bright-gray text-sm")], [text("@")]),
        span([class("font-semibold")], [text(user.login)]),
      ]),
      div([], [
        span([class("text-bright-gray text-sm")], [text("Contributions: ")]),
        span([class("font-semibold")], [text(int.to_string(user.contributions))]),
      ]),
    ]),
  ])
}

pub fn contributors(users: List(User)) -> Element(a) {
  section(
    "contirbutors",
    "Lustre Contirbutors",
    text(""),
    ul(
      [class("flex flex-wrap gap-4 justify-center")],
      list.map(users, contributor),
    ),
  )
}
