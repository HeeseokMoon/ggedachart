#' Correlation Correlogram.
#'
#' correlogram function will draw Correlogram for correlation analysis.
#' @param data input data.frame
#' @param title main title
#' @param subtitle subtitle
#' @param caption caption
#' @return plot with ggplot2 grammar
#' @examples
#' plot<- correlogram(data=mtcars)
#' plot
correlogram<-function(data,
                      title=NULL,subtitle=NULL,caption=NULL){
  df<-data[, sapply(data, class) == "numeric"]

  corr<-round(cor(df),2)

  ggcorrplot(corr, hc.order = TRUE,
             type = "lower",
             lab = TRUE,
             lab_size = 3,
             method="square",
             color=c("#008FD5", "white", "#FF2700")) +
    theme_fivethirtyeight() +
    labs(subtitle=subtitle,
         title=title,
         caption = caption)

}

