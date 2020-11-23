library('ggplot2')
library(gganimate)
library(gapminder)
anibubble<-function(data,x,y,col.var,size.var,frame.var,
                     fps=5,width= 1900, height=1068.75,
                     title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL,...){
  df<- data
  x<- x
  y<- y
  color<- col.var
  size<- size.var
  frame<-frame.var
  
  #animate par
  fps<- fps
  width<- width
  height<- height
    
  p <- ggplot(df, aes_string(x, y, col=color, size=size, frame=frame)) +
    geom_point() +
    transition_states(year) +
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    scale_color_tableau() +
    labs(subtitle=paste(subtitle,"{closest_state}"),
         y=ytitle,
         x=xtitle,
         title=title,
         caption = caption)

  return(p)
  
}
