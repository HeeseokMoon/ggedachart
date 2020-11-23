#' Correlation Counts chart.
#'
#' counts function will draw counts chart for correlation analysis.
#' @param data input data.frame
#' @param x x variable
#' @param y y variable
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return plot with ggplot2 grammar
#' @examples
#' plot<- counts(data=mpg, x="cty", y="hwy")
#' plot
counts<-function(data,x,y,
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y


  p <- ggplot(df, aes_string(x, y)) + geom_count(col="#008FD5", show.legend=F) +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(subtitle=subtitle,
            y=ytitle,
            x=xtitle,
            title=title,
            caption = caption)

  return(p)
}
