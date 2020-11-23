library(lubridate)
area<-function(data,date,value,
               title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- date
  y<- value
  brks <- df[,x][seq(1, length(df[,x]), 12)]
  lbls <- lubridate::year(df[,x][seq(1, length(df[,x]), 12)])
  

  p<-ggplot(df, aes_string(x, y)) + 
    geom_area() + 
    scale_x_date(breaks=brks, labels=lbls) + 
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          axis.text.x = element_text(angle=90),
          legend.direction = "horizontal", legend.box = "horizontal")+
    labs(title=title, 
         subtitle = subtitle,
         x=xtitle,
         y=ytitle, 
         caption=caption)

    return(p)
}
