#' Distribution Population Pyramid.
#'
#' pyramid function will draw Population Pyramid for Distribution analysis.
#' @param data input data.frame
#' @param x x variable
#' @param y y variable
#' @param col.var color variable
#' @param title input data.frame
#' @param subtitle date variable
#' @param xtitle value variable
#' @param ytitle input data.frame
#' @param caption date variable
#' @return An object of class \code{ggplot}
#' @examples
#' # Read data
#' email_campaign_funnel <- read.csv("https://raw.githubusercontent.com/selva86/datasets/master/email_campaign_funnel.csv")
#'
#' #Population Pyramid
#' plot<- pyramid(data=email_campaign_funnel,x="Stage",y="Users",col.var="Gender",
#'                title = "Title")
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
pyramid<-function(data,x,y,col.var,
                  title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y
  color<-col.var

  brks <- seq(-15000000, 15000000, 5000000)
  lbls <- paste0(as.character(c(seq(15, 0, -5), seq(5, 15, 5))), "m")


  p<-ggplot(df, aes_string(x, y,fill=color)) +
    geom_bar(stat = "identity", width = .6) +
    scale_y_continuous(breaks = brks,   # Breaks
                       labels = lbls) + # Labels
    coord_flip() +
    scale_fill_fivethirtyeight()+
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          plot.title = element_text(hjust = .5),
          axis.ticks = element_blank(),
          axis.text.x = element_text(angle=90),
          legend.direction = "horizontal", legend.box = "horizontal")+
    labs(title=title,
         subtitle = subtitle,
         x=xtitle,
         y=ytitle,
         caption=caption)

  return(p)
}
