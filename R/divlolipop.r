#' Deviation Diverging Lollipop Chart.
#'
#' divlollipop function will draw Diverging Lollipop Chart for Deviation analysis.
#' @param data input data.frame
#' @param div.var diverging value variable
#' @param method "mean" or "median"
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return An object of class \code{ggplot}
#' @examples
#' plot<- divlollipop(data=mtcars,div.var="mpg",method="mean")
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
divlollipop<-function(data,div.var, method="mean",
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  div.var<- div.var


  if(method=="mean"){
    df$row<-rownames(df)
    df$z<-round((df[,div.var] - mean(df[,div.var])), 2)
    df$z_type <- ifelse(df$z < 0, "below", "above")
    df <- df[order(df$z), ]
    df$row <- factor(df$row, levels = df$row)
  }

  if(method=="median"){
    df$row<-rownames(df)
    df$z<-round((df[,div.var] - median(df[,div.var])), 2)
    df$z_type <- ifelse(df$z < 0, "below", "above")
    df <- df[order(df$z), ]
    df$row <- factor(df$row, levels = df$row)
  }

  p<-ggplot(df, aes_string(x="row", y="z", label="z")) +
    geom_point(stat='identity', fill="black", size=6)  +
    geom_segment(aes_string(y = 0,
                     x = "row",
                     yend = "z",
                     xend = "row"),
                 color = "black") +
    geom_text(color="white", size=2) +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal")+
    labs(title=title,
         subtitle=subtitle,
         x=xtitle,
         y=ytitle,
         caption=caption) +
    coord_flip()

  return(p)
}
