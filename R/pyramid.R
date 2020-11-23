pyramid<-function(data,x,y,col.var,
                  title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL,...){
  df<- data
  x<- x
  y<- y
  color<-col.var
  
  brks <- seq(-15000000, 15000000, 5000000)
  lbls <- paste0(as.character(c(seq(15, 0, -5), seq(5, 15, 5))), "m")
  
  
  p<-ggplot(df, aes_string(x, y,fill=color)) + 
    geom_bar(stat = "identity", width = .6) +
    scale_y_continuous(breaks = brks,   # Breaks
                       labels = lbls) + # Labels 
    coord_flip() +
    scale_fill_fivethirtyeight()+
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          plot.title = element_text(hjust = .5), 
          axis.ticks = element_blank(),
          axis.text.x = element_text(angle=90),
          legend.direction = "horizontal", legend.box = "horizontal")+
    labs(title=title, 
         subtitle = subtitle,
         x=xtitle,
         y=ytitle, 
         caption=caption)
  
  return(p)
}
