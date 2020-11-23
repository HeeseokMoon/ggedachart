#' Composition Treemap Chart.
#'
#' treemap function will draw Treemap Chart for Composition analysis.
#' @param data input data.frame
#' @param area area variable
#' @param fill fill variable
#' @param label label variable
#' @param group group variable
#' @param title input data.frame
#' @param subtitle date variable
#' @param caption date variable
#' @return An object of class \code{ggplot}
#' @examples
#' #prep data
#' proglangs <- read.csv("https://raw.githubusercontent.com/selva86/datasets/master/proglanguages.csv")
#'
#' #Treemap
#' plot<- treemap(data=proglangs, area="value", fill="parent", label="id", group="parent", title="Title", caption="caption")
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
treemap<-function(data,area,fill,label,group,
                  title=NULL,caption=NULL){
  df<-data
  area<-area
  fill<-fill
  label<-label
  group<-group

  p<- ggplot(df, aes_string(area = area, fill = fill, label=label, subgroup=group)) +
    geom_treemap() +
    geom_treemap_subgroup_border() +
    geom_treemap_subgroup_text(place = "bottom", grow = T, alpha = 0.5, colour =
                                 "black", fontface = "italic", min.size = 0) +
    geom_treemap_text(colour = "white", place = "topleft", reflow = T) +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = c(0, 0)) +
    scale_fill_tableau() +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          axis.line = element_blank(),
          plot.title = element_text(hjust=0.5),
          legend.direction = "vertical", legend.box = "horizontal",legend.position = "right") +
    labs(title=title,
         caption=caption)

  return(p)
}
