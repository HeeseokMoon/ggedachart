#' Ranking Lollipop Chart.
#'
#' lolipop function will draw Lollipop Chart for Ranking analysis.
#' @param data input dataframe
#' @param x x variable
#' @param y y variable
#' @param title input data.frame
#' @param subtitle date variable
#' @param xtitle value variable
#' @param ytitle input data.frame
#' @param caption date variable
#' @return An object of class \code{ggplot}
#' @examples
#' Prepare data: group mean city mileage by manufacturer.
#' cty_mpg <- aggregate(mpg$cty, by=list(mpg$manufacturer), FUN=mean)  # aggregate
#' colnames(cty_mpg) <- c("make", "mileage")                           # change column names
#'
#' #orderbar
#' plot<- lolipop(data=cty_mpg,x="make",y="mileage")
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
lolipop<-function(data,x,y,
                  title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y

  df<- df[order(df[,y]),]
  df[,x] <- factor(df[,x], levels = df[,x])

  p<- ggplot(df, aes_string(x=x, y=y)) +
    geom_point(size=3) +
    geom_segment(aes_string(x=x,
                            xend=x,
                            y=0,
                            yend=y)) +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          axis.text.x = element_text(angle=65, vjust=0.6),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(subtitle=subtitle,
         y=ytitle,
         x=xtitle,
         title=title,
         caption = caption)

  return(p)
}
