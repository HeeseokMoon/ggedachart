#' Correlation Marginal Histogram/Box plot.
#'
#' margin function will draw  Marginal Histogram/Box plot for correlation analysis.
#' @param data input data.frame
#' @param x x variable
#' @param y y variable
#' @param type "hist" for histogram,"boxplot" for box plot
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return plot with ggplot2 grammar
#' @examples
#' plot<- margin(data=mpg,x="cty",y="hwy",type="hist")
#' plot
margin<-function(data,x,y,
                 type,
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y
  margin<-type

  p <- ggplot(df, aes_string(x, y)) +
    geom_count() +
    geom_smooth(method="lm", se=F,color="Dark Gray") +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(subtitle=subtitle,
         y=ytitle,
         x=xtitle,
         title=title,
         caption = caption)

  if(margin=="hist"){
    p<-ggMarginal(p, type = "histogram", fill="transparent")
  }

  if(margin=="boxplot"){
    p<-ggMarginal(p, type = "boxplot", fill="transparent")
  }

  return(p)
}
