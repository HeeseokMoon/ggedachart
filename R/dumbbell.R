#' Ranking Dumbbell Plot.
#'
#' dumbbell function will draw Dumbbell Plot for Ranking analysis.
#' @param data input data.frame
#' @param group group variable
#' @param dif.var difference variable
#' @param value.var value variable
#' @param start start value
#' @param end end value
#' @param title input data.frame
#' @param subtitle date variable
#' @param xtitle value variable
#' @param ytitle input data.frame
#' @param caption date variable
#' @return An object of class \code{ggplot}
#' @examples
#' # prep data
#' gapminder <- gapminder %>% group_by(continent,year) %>%
#'              summarise(meangdppercap=mean(gdpPercap)) %>% as.data.frame(.)
#' gapminder[59,"meangdppercap"]<-20088.78
#'
#' #dumbbell plot
#' plot<- dumbbell(data=gapminder,group="continent",dif.var="year",value.var="meangdppercap",start=1997,end=2002)
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
dumbbell<-function(data,group,dif.var,value.var,start="min",end="max",
                   title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<-data
  group<-group
  diff<-dif.var
  value<-value.var

  if(start=="min"){
    x<-min(df[,diff])
  } else{
    x<-start
  }

  if(end=="max"){
    xend<-max(df[,diff])
  } else{
    xend<-end
  }

  foo<-dcast(df, df[,group]~df[,diff],value.var = value)
  colnames(foo)[1]<-group
  foo[,1]<-as.character(foo[,1])

  foo$x<-foo[,as.character(x)]
  foo$xend<-foo[,as.character(xend)]

  x<-"x"
  xend<-"xend"

  p <- ggplot(foo, aes_string(x=x, xend=xend, y=group, group=group)) +
    geom_dumbbell(color="#a3c4dc",
                  size=0.75,
                  colour_x ="#044763") +
    scale_x_continuous(labels=comma) +
    theme_fivethirtyeight() +
    theme(plot.title = element_text(hjust=0.5, face="bold"),
          plot.background=element_rect(fill="#f7f7f7"),
          panel.background=element_rect(fill="#f7f7f7"),
          panel.grid.minor=element_blank(),
          panel.grid.major.y=element_blank(),
          panel.grid.major.x=element_line(),
          axis.ticks=element_blank(),
          legend.position="top",
          panel.border=element_blank())+
    labs(subtitle=subtitle,
         y=ytitle,
         x=xtitle,
         title=title,
         caption = caption)

  return(p)
}
