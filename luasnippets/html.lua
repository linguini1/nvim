local blog_figure = s({ trig = "figure", dscr = "Figure element for my blog" }, {
    unpack(fmt('<div class="figure">\n\t<img src="{}" alt="{}" width="{}">\n\t<p>{}</p>\n</div>', {
        i(1, "link"),
        i(2, "alt-text"),
        i(3, "80%"),
        i(4, "caption"),
    })),
})

-- Regular snippets
return { blog_figure },
-- Auto snippets
{}
