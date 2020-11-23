#' Correlation Bubble plot.
#'
#' bubble function will draw bubble plot for correlation analysis.
#' @param data input data.frame
#' @param x x variable
#' @param y y variable
#' @param col.var color variable
#' @param size.var size variable
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return An object of class \code{ggplot}
#' @examples
#' #prepare data
#' mpg_select <- mpg[mpg$manufacturer %in% c("audi", "ford", "honda", "hyundai"), ]
#'
#' #Bubble plot
#' plot<- bubble(data=mpg_select, x="displ", y="cty", col.var="manufacturer", size.var="hwy")
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
#' @import plyr
#' @import ggdendro
#' @export
bubble<-function(data,x,y,col.var,size.var,
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y
  color<- col.var
  size<- size.var


  p <- ggplot(df, aes_string(x, y)) +
  geom_jitter(aes_string(col=color, size=size)) +
  geom_smooth(aes_string(col=color), method="lm", se=F) +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    scale_color_tableau() +
    labs(subtitle=subtitle,
            y=ytitle,
            x=xtitle,
            title=title,
            caption = caption)

  return(p)
}
