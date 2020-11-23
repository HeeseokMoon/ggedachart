#' Correlation Jitter plot.
#'
#' jitter function will draw jitter plot for correlation analysis.
#' @param data input data.frame
#' @param x x variable
#' @param y y variable
#' @param method regression method type,default is "loess"
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return plot with ggplot2 grammar
#' @examples
#' plot<- jitter(data=mpg, x="cty", y="hwy", method="loess")
#' plot
jitter<-function(data,x,y,
                 method="lm",
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y
  method<- method


  p<-  ggplot(df, aes_string(x, y)) + geom_jitter(width = .5, size=1) +
    geom_smooth(method=method, se=F,color="Dark Gray") +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    scale_color_fivethirtyeight() +
    labs(subtitle=subtitle,
         y=ytitle,
         x=xtitle,
         title=title,
         caption = caption)

  return(p)
}
