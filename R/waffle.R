#' Composition Waffle Chart.
#'
#' waffle function will draw Waffle Chart for Composition analysis.
#' @param data input data.frame
#' @param title input data.frame
#' @param subtitle date variable
#' @param caption date variable
#' @return An object of class \code{ggplot}
#' @examples
#' plot<- waffle(data=mpg$class,title = "Title",caption="caption")
#' plot
#'
#' @import(ggplot2)
#' @import(scales)
#' @import(reshape2)
#' @import(ggthemes)
#' @import(gganimate)
#' @import(gapminder)
#' @import(ggalt)
#' @import(ggExtra)
#' @import(ggcorrplot)
#' @import(dplyr)
#' @import(treemapify)
#' @import(ggfortify)
#' @import(zoo)
#' @import(plyr)
#' @import(ggdendro)
#' @export
waffle<-function(data,
                 title=NULL,subtitle=NULL,caption=NULL){
  var<-data

  # Prep data (nothing to change here)
  nrows <- 10
  df <- expand.grid(y = 1:nrows, x = 1:nrows)
  categ_table <- round(table(var) * ((nrows*nrows)/(length(var))))

  df$category <- factor(rep(names(categ_table), categ_table))

  p<-ggplot(df, aes(x = x, y = y, fill = category)) +
    geom_tile(color = "black", size = 0.5) +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0), trans = 'reverse') +
    scale_fill_tableau() +
    theme_fivethirtyeight() +
    theme(panel.border = element_rect(size = 2),
          plot.title = element_text(size = rel(1.2)),
          axis.text = element_blank(),
          axis.title = element_blank(),
          axis.ticks = element_blank(),
          legend.title = element_blank(),
          legend.position = "right",
          legend.direction = "vertical") +
    labs(title=title,
         subtitle=subtitle,
         caption=caption)

  return(p)
}
