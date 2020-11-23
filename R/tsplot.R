#' Trend Time Series Plots.
#'
#' tsplot function will draw Time Series Plots for Trend analysis.
#' @param data input data.frame or ts
#' @param time time variable
#' @param value value variable
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return plot with ggplot2 grammar
#' @examples
#' #ts type data
#' plot<- tsplot(data=AirPassengers)
#' plot
#'
#' #data.frame data
#' plot<- tsplot(data=as.data.frame(economics),time="date",value="uempmed")
#' plot
tsplot<-function(data,time=NULL,value=NULL,
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<-data
  x<-time
  y<-value

  if(class(df)=="ts"){
    p<-autoplot(df)+
      theme_fivethirtyeight() +
      theme(axis.title = element_text(),
            legend.title = element_text(face = 4,size = 10),
            legend.direction = "horizontal", legend.box = "horizontal") +
      labs(title=title,
           subtitle=subtitle,
           x=xtitle,
           y=ytitle,
           caption=caption)
  } else {
    p<-ggplot(df, aes_string(x=time)) +
      geom_line(aes_string(y=value)) +
      theme_fivethirtyeight() +
      theme(axis.title = element_text(),
            legend.title = element_text(face = 4,size = 10),
            legend.direction = "horizontal", legend.box = "horizontal") +
      labs(title=title,
           subtitle=subtitle,
           x=xtitle,
           y=ytitle,
           caption=caption)
  }

  return(p)
}

