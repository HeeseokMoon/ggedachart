library('ggplot2')
bubble<-function(data,x,y,col.var,size.var,
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y
  color<- col.var
  size<- size.var

    
  p <- ggplot(df, aes_string(x, y)) + 
  geom_jitter(aes_string(col=color, size=size)) + 
  geom_smooth(aes_string(col=color), method="lm", se=F) +
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    scale_color_tableau() +
    labs(subtitle=subtitle,
            y=ytitle,
            x=xtitle,
            title=title,
            caption = caption)

  return(p)  
}
