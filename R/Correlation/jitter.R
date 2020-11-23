library('ggplot2')
library(ggthemes)
jitter<-function(data,x,y,
                 method="lm",
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y
  method<- method
  
  
  p<-  ggplot(df, aes_string(x, y)) + geom_jitter(width = .5, size=1) +
    geom_smooth(method=method, se=F,color="Dark Gray") +
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    scale_color_fivethirtyeight() +
    labs(subtitle=subtitle,
         y=ytitle,
         x=xtitle,
         title=title,
         caption = caption)

  return(p)       
}
