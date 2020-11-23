library(ggthemes)
library(ggplot2)
tufte<-function(data,x,y,
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL,...){
  df<- data
  x<- x
  y<- y
  
  # Plot
  p <- ggplot(df, aes_string(x,y))
  p <- p + geom_tufteboxplot() + 
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          axis.text.x = element_text(angle=65, vjust=0.6),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(title=title,
         subtitle=subtitle, 
         x=xtitle,
         y=ytitle,
         caption=caption)
  
  return(p)
}
