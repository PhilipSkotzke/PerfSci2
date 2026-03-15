##################################
# Custom Colors and ggplot theme
# for Performance Science Squared
# Visual Identity
##################################

# ---- Load required packages ----
library(ggplot2)
library(ggtext)
library(sysfonts)
library(showtext)
library(grid)

# ---- Load required fonts ----

try(sysfonts::font_add_google("Poppins", "poppins"), silent = TRUE)

showtext_auto()


# ---- Custom Color Palette ----

# Ordered palette (important for consistency across figures)
clrs <- c(
  "blue" = "#0077FF", # main highlight color
  "orange" = "#FF6B35", # highlight / intervention groups
  "deep_blue" = "#003F88", # darker comparison group
  "teal" = "#2A9D8F", # secondary conditions
  "gold" = "#E6AB02", # teritary conditions / threshold / benchmark
  "purple" = "#7570B3", # strength
  "red" = "#D62828", # fatigue / high intensity
  "neutral" = "#4A4A4A" # neutral reference
)

# ---- Custom Theme ----

theme_blog <- function(
  base_size = 14,
  base_family = "Poppins",
  base_line_size = 0.4,
  base_rect_size = 0.4
) {
  ggplot2::theme_bw(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size,

    # ggplot2 4.0 global colors
    ink = "#222222",
    paper = "white",
    accent = "#0077FF"
  ) %+replace%

    ggplot2::theme(
      # ---- Global defaults ----
      text = ggplot2::element_text(
        size = base_size,
        colour = "#222222",
        family = base_family
      ),

      # ---- Plot title ----
      plot.title = ggtext::element_markdown(
        size = rel(1.5),
        face = "bold",
        hjust = 0,
        lineheight = 1.2,
        margin = ggplot2::margin(b = 8)
      ),

      plot.subtitle = ggtext::element_markdown(
        size = rel(1),
        margin = ggplot2::margin(b = 10),
        hjust = 0
      ),

      plot.caption = ggtext::element_markdown(
        size = rel(0.85),
        colour = "grey30",
        hjust = 1
      ),

      plot.title.position = "plot",
      plot.caption.position = "plot",

      # ---- Axes ----
      axis.title = ggtext::element_markdown(
        face = "bold",
        size = rel(1)
      ),

      axis.title.x = ggtext::element_markdown(
        margin = ggplot2::margin(t = 8)
      ),

      axis.title.y = ggtext::element_markdown(
        vjust = 0.5,
        angle = 90,
        margin = ggplot2::margin(r = 8)
      ),

      axis.text = ggtext::element_markdown(
        colour = "#333333"
      ),

      axis.line = ggplot2::element_blank(),

      axis.ticks = ggplot2::element_line(
        linewidth = rel(1)
      ),

      # ---- Panels ----
      panel.border = ggplot2::element_rect(
        colour = "#000000",
        fill = NA,
        linewidth = 0.5
      ),

      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),

      # ---- Facets ----
      strip.background = ggplot2::element_rect(
        fill = "#F4F4F4",
        colour = "#222222",
        linewidth = 0.6
      ),

      strip.text = ggtext::element_markdown(
        margin = ggplot2::margin(4, 4, 4, 4)
      ),

      # ---- Legend ----
      legend.position = "top",
      legend.justification = "right",
      legend.direction = "horizontal",

      legend.title = ggtext::element_markdown(
        face = "bold"
      ),

      legend.key = ggplot2::element_blank(),
      legend.key.width = grid::unit(0.8, "cm"),

      legend.spacing.y = grid::unit(0.2, "cm"),
      legend.margin = ggplot2::margin(2, 2, 2, 2),

      # ---- Plot margins ----
      plot.margin = ggplot2::margin(10, 10, 10, 10)
    )
}

# ---- Set global ggplot theme ----

theme_set(
  theme_blog(
    base_size = 14,
    base_family = ifelse(
      !"poppins" %in% sysfonts::font_families(),
      "sans",
      "poppins"
    )
  ) +
    theme(
      palette.color.discrete = unname(clrs),
      palette.fill.discrete = unname(clrs)
    )
)

update_geom_defaults("point", list(color = clrs[1], size = 1))
update_geom_defaults("line", list(color = clrs[1]))
