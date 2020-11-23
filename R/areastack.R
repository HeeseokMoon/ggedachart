#' Trend Stacked Area Chart.
#'
#' areastack function will draw Stacked Area Chart for Trend analysis.
#' @param data input data.frame
#' @param time time variable
#' @param value1 value1 variable
#' @param value2 value2 title
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return An object of class \code{ggplot}
#' @examples
#' plot<- areastack(data=as.data.frame(economics),time="date",value1="psavert",value2="uempmed")
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
areastack<-function(data,time,value1,value2,
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<-data
  x<-time
  y1<-value1
  y2<-value2
  df$y3<-df[,value1]+df[,value2]
  y3<-"y3"

  brks <- df[,x][seq(1, length(df[,x]), 12)]
  lbls <- lubridate::year(brks)

  p<- ggplot(df, aes_string(x=time)) +
    geom_area(aes_string(y=y3),fill="#008FD5") +
    geom_area(aes_string(y=y2),fill="#FF2700") +
    scale_x_date(labels = lbls, breaks = brks) +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          axis.text.x = element_text(angle=45),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(title=title,
         subtitle=subtitle,
         x=xtitle,
         y=ytitle,
         caption=caption)

  return(p)
}
