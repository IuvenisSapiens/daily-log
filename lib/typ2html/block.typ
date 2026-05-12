#import "@preview/theorion:0.6.0": *
#import "html-guard.typ": html-guard

#let quote(body) = context {
  html-guard(() => {
    html.div(class: "quote-block", {
      body
    })
  }, fallback: () => quote-block(body))
}

#let block-title(title) = {
  if title != none {
    html.div(class: "block-title", title)
  }
}

#let note(title: none, body) = context {
  html-guard(() => {
    html.div(class: "note-block", {
      block-title(title)
      body
    })
  }, fallback: () => {
    if title == none {
      note-block(body)
    } else {
      note-block(title: title, icon-name: "info", body)
    }
  })
}

#let success(title: none, body) = context {
  html-guard(() => {
    html.div(class: "success-block", {
      block-title(title)
      body
    })
  }, fallback: () => {
    if title == none {
      tip-block(body)
    } else {
      tip-block(title: title, icon-name: "check-circle-fill", body)
    }
  })
}

#let warning(title: none, body) = context {
  html-guard(() => {
    html.div(class: "warning-block", {
      block-title(title)
      body
    })
  }, fallback: () => {
    if title == none {
      warning-block(body)
    } else {
      warning-block(title: title, icon-name: "alert-fill", body)
    }
  })
}


#let error(title: none, body) = context {
  html-guard(() => {
    html.div(class: "error-block", {
      block-title(title)
      body
    })
  }, fallback: () => {
    if title == none {
      caution-block(body)
    } else {
      caution-block(title: title, icon-name: "circle-slash", body)
    }
  })
}
