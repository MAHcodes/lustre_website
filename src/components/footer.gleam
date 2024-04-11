import lustre/element.{type Element, text}
import lustre/element/html.{a, div, img, p, ul}
import lustre/attribute.{alt, class, href, src, target}
import components/logo.{logo}
import components/socials.{socials}
import components/nav.{type NavItem, NavItem, nav_item}
import gleam/list

const content: List(NavItem) = [
  NavItem(text: "Features", href: "#features", target: "_self"),
  NavItem(text: "Support", href: "#support", target: "_self"),
  NavItem(text: "Try Lustre", href: "#lab", target: "_lab"),
]

pub fn footer() -> Element(a) {
  html.footer([class("bg-white py-8")], [
    div([class("container flex flex-col gap-4")], [
      div([class("py-8 flex flex-col md:flex-row gap-8 justify-between")], [
        div([class("flex flex-col items-center md:items-start gap-4")], [
          a([href("#top"), class("logo")], [
            logo(
              container_class: "pl-4 md:pl-0 pb-3 pt-1",
              logo_class: "h-10 w-auto object-contain",
            ),
          ]),
          p([], [text("✨ Make your frontend shine ✨")]),
          socials(),
        ]),
        ul(
          [class("flex flex-col items-center gap-4")],
          list.map(content, nav_item),
        ),
        ul(
          [class("flex flex-col items-center gap-4")],
          list.map(content, nav_item),
        ),
        ul(
          [class("flex flex-col items-center gap-4")],
          list.map(content, nav_item),
        ),
      ]),
      div(
        [
          class(
            "flex flex-col md:flex-row items-center justify-between gap-4 py-8 border-t border-t-bright-gray text-dark-gray",
          ),
        ],
        [
          p([class("text-sm")], [text("Lustre © 2024 All rights reserved")]),
          p([class("text-sm flex items-center gap-1")], [
            text("Built with"),
            img([class("size-4"), src("/heart.svg"), alt("love")]),
            text("by"),
            a(
              [
                class("text-dark-charcoal underline"),
                href("https://github.com/hayleigh-dot-dev"),
                target("_blank"),
              ],
              [text("@Hayleigh")],
            ),
          ]),
        ],
      ),
    ]),
  ])
}
