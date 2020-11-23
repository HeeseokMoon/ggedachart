#' Composition Pie Chart.
#'
#' pie function will draw Pie Chart for Composition analysis.
#' @param data input data.frame
#' @param title input data.frame
#' @param caption date variable
#' @return An object of class \code{ggplot}
#' @examples
#' plot<- pie(data=mpg$class,title = "Title",caption="caption")
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
pie<-function(data,
              title=NULL,caption=NULL){
  df<-as.data.frame(table(data))

  colnames(df) <- c("class", "freq")

  pie <- ggplot(df, aes(x = "", y=freq, fill = factor(class))) +
    geom_bar(width = 1, stat = "identity") +
    scale_fill_tableau() +
    theme_classic() +
    theme(axis.title = element_blank(),
          legend.title = element_text(face = 4,size = 10),
          axis.line = element_blank(),
          plot.title = element_text(hjust=0.5),
          legend.direction = "vertical", legend.box = "horizontal") +
    labs(title=title,
         caption=caption)

  p <- pie + coord_polar(theta = "y", start=0)

  return(p)
}
