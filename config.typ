#import "lib/typ2html/typ2html.typ": *
#import "lib/typ2html/sys-input.typ": query-input

#let current-file-type = str(query-input("file-type", default: "pages"))
#let current-page-path = str(query-input("page-path", default: "")).trim("/")
#let current-source-prefix = if current-file-type == "posts" { "posts" } else { "pages" }
#let current-source-path = (
  if current-page-path == "" {
    current-source-prefix
  } else {
    current-source-prefix + "/" + current-page-path
  }
    + "/index.typ"
)



#let footer-content = html-guard(() => {
  html.div(
    class: "footer-content",
    {
      html.div(class: "footer-flex-outer", {
        html.div({
          "本页更新于 " + datetime.today().display("[year] 年 [month padding:none] 月 [day padding:none] 日")
        })
      })
      html.div(class: "footer-flex-block", {
        html.div({
          "本页面被访问了 "
          link("https://vercount.one/", {
            html.span(id: "vercount_value_page_pv", "...")
          })
          " 次"
        })
      })
    },
  )
})


#let tag-options = (
  "矩阵链乘积问题": ("preset": "blue", "icon": "/assets/icons/data-bin.svg"),
  "图论": ("preset": "cyan", "icon": "/assets/icons/concept.svg"),
  "数据结构": ("preset": "teal", "icon": "/assets/icons/parent-child.svg"),
  "数论": ("preset": "purple", "icon": "/assets/icons/calculation.svg"),
  "动态规划": ("preset": "magenta", "icon": "/assets/icons/app-connectivity.svg"),
  "线性代数": ("preset": "red", "icon": "/assets/icons/matrix.svg"),
  "数学基础": ("preset": "red", "icon": "/assets/icons/concept.svg"),
  "字符串": ("preset": "green", "icon": "/assets/icons/array--strings.svg"),
  "模拟费用流": ("preset": "cyan", "icon": "/assets/icons/flow--modeler--reference.svg"),
  "Lean": ("preset": "purple", "icon": "/assets/icons/square-fill.svg"),
  "Typst": ("preset": "teal", "icon": "/assets/icons/pen.svg"),
  "CTF": ("preset": "green", "icon": "/assets/icons/flag.svg"),
  "博客搭建": ("preset": "cyan", "icon": "/assets/icons/rocket.svg"),
  "写作指南": ("preset": "blue", "icon": "/assets/icons/edit.svg"),
  "配置指南": ("preset": "green", "icon": "/assets/icons/settings.svg"),
)

#let render-tag-link = render-tag-link.with(tag-options: tag-options)
#let render-tag-card = render-tag-card.with(tag-options: tag-options)

#let templates = make-templates(
  site-title: "森林日常随笔",
  header-links: (
    "/": "首页",
    "/categories/": "分类",
    "/tags/": "标签",
    "/archive/": "归档",
    "/about/": "关于",
  ),
  title: "Typst Blog",
  lang: "zh",
  footer-content: footer-content,
  tag-options: tag-options,
  custom-css: (
    "/assets/custom.css",
  ),
  custom-script: (),
)

#let template-page = templates.page
#let template-post(..args) = {
  set page(height: auto, width: 30cm)
  set text(16pt, font: ("IBM Plex Sans SC", "Source Han Serif SC"), lang: "zh")
  show raw: text.with(font: ("Zed Plex Mono", "IBM Plex Sans SC", "DejaVu Sans Mono", "Source Han Mono"))
  show math.equation: set text(16pt)
  set table(inset: 8pt)
  set grid(inset: 8pt)

  (templates.post)(..args)
}
