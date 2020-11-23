#' Correlation Animated Bubble plot.
#'
#' anibubble function will draw  Animated Bubble plot for correlation analysis.
#' @param data input data.frame
#' @param x x variable
#' @param y y variable
#' @param col.var color variable
#' @param size.var size variable
#' @param frame.var frame variable
#' @param fps frame change per second
#' @param width width plot size
#' @param height height plot size
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return An object of class \code{ggplot}
#' @examples
#' plot<- anibubble(data=gapminder,x="gdpPercap",y="lifeExp",
#'                  col.var="continent",size.var = "pop", frame.var = "year")
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
anibubble<-function(data,x,y,col.var,size.var,frame.var,
                     fps=5,width= 1900, height=1068.75,
                     title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y
  color<- col.var
  size<- size.var
  frame<-frame.var

  #animate par
  fps<- fps
  width<- width
  height<- height

  p <- ggplot(df, aes_string(x, y, col=color, size=size, frame=frame)) +
    geom_point() +
    transition_states(year) +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    scale_color_tableau() +
    labs(subtitle=paste(subtitle,"{closest_state}"),
         y=ytitle,
         x=xtitle,
         title=title,
         caption = caption)

  return(p)

}
