#' Correlation scatter plot.
#'
#' scatter function will draw scatter plot for correlation analysis.
#' @param data input data.frame
#' @param x x variable
#' @param y y variable
#' @param col.var color variable
#' @param size.var size variable
#' @param method regression method type,default is "loess"
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return An object of class \code{ggplot}
#' @examples
#' #area chart
#' plot<- scatter(data=iris, x="Sepal.Length", y="Sepal.Width", col.var = "Species", size.var = "Petal.Length",
#'                method="lm",
#'                title="Scatter", subtitle="plot", xtitle="Sepal.Length", ytitle="Sepal.Width", caption="iris")
#'
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
scatter<-function(data,x,y,col.var=NULL,size.var=NULL,
                  method="loess",
                  title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){

  df<- data
  x<- x
  y<- y
  color<- col.var
  size<- size.var
  method<- method

  p <- ggplot(df, aes_string(x=x, y=y)) +
    geom_point(aes_string(col=color, size=size)) +
    geom_smooth(method=method, se=F,color="Dark Gray") +  #smooth : x - y correlation "lm", "glm", "gam", "loess"
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    scale_color_fivethirtyeight(color) +
    labs(title=title,
         subtitle=subtitle,
         x=xtitle,
         y=ytitle,
         caption=caption)

  return(p)
}
