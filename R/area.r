#' Deviation Area chart.
#'
#' area function will draw area chart for deviation analysis.
#' @param data input dataframe
#' @param date date variable
#' @param value value variable
#' @param title input data.frame
#' @param subtitle date variable
#' @param xtitle value variable
#' @param ytitle input data.frame
#' @param caption date variable
#' @return An object of class \code{ggplot}
#' @examples
#' #prepare data
#' economics$returns_perc <- c(0, diff(economics$psavert)/economics$psavert[-length(economics$psavert)])
#' economics<- as.data.frame(economics)
#'
#' #area chart
#' plot<- area(data=economics[1:100,],date = "date",value = "returns_perc")
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
area<-function(data,date,value,
               title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- date
  y<- value
  brks <- df[,x][seq(1, length(df[,x]), 12)]
  lbls <- lubridate::year(df[,x][seq(1, length(df[,x]), 12)])


  p<-ggplot(df, aes_string(x, y)) +
    geom_area() +
    scale_x_date(breaks=brks, labels=lbls) +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          axis.text.x = element_text(angle=90),
          legend.direction = "horizontal", legend.box = "horizontal")+
    labs(title=title,
         subtitle = subtitle,
         x=xtitle,
         y=ytitle,
         caption=caption)

    return(p)
}
