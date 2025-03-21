---
---
$(document).ready(function () {
    var mmSkin = "dark"
    var mjsTheme = {
      "air": "default",
      "aqua": "default",
      "contrast": "default",
      "dark": "dark",
      "default": "default",
      "dirt": "default",
      "mint": "mint",
      "neon": "dark",
      "plum": "dark",
      "sunrise": "default"
    }[mmSkin]
    mermaid.initialize({
      startOnLoad: false,
      theme: mjsTheme
    })
    mermaid.init({
      theme: mjsTheme
    }, '.language-mermaid');
  });
