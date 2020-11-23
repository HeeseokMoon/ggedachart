#' Correlation Correlogram.
#'
#' correlogram function will draw Correlogram for correlation analysis.
#' @param data input data.frame
#' @param title main title
#' @param subtitle subtitle
#' @param caption caption
#' @return An object of class \code{ggplot}
#' @examples
#' plot<- correlogram(data=mtcars)
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

