#' Distribution Violin Plot.
#'
#' violin function will draw Violin Plot for Distribution analysis.
#' @param data input data.frame
#' @param x x variable
#' @param y y variable
#' @param title input data.frame
#' @param subtitle date variable
#' @param xtitle value variable
#' @param ytitle input data.frame
#' @param caption date variable
#' @return An object of class \code{ggplot}
#' @examples
#' plot<- violin(data=mpg,x="class",y="cty")
#' plot
#'
#' @import ggplot2
#' @import scales
#' @import reshape2
#' @import ggthemes
#' @import gganimate
#' @import gapminder
#' @import ggalt
#' @import ggExtra
#' @import ggcorrplot
#' @import dplyr
#' @import treemapify
#' @import ggfortify
#' @import zoo
#' @import ggdendro
#' @export
violin<-function(data,x,y,
                title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y

  # Plot
  p <- ggplot(df, aes_string(x,y))
  p <- p + geom_violin(fill="Dark grey") +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          axis.text.x = element_text(angle=65, vjust=0.6),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(title=title,
         subtitle=subtitle,
         x=xtitle,
         y=ytitle,
         caption=caption)

  return(p)
}
