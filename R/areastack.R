areastack<-function(data,time,value1,value2,
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL,...){
  df<-data
  x<-time
  y1<-value1
  y2<-value2
  df$y3<-df[,value1]+df[,value2]
  y3<-"y3"
  
  brks <- df[,x][seq(1, length(df[,x]), 12)]
  lbls <- lubridate::year(brks)
  
  p<- ggplot(df, aes_string(x=time)) + 
    geom_area(aes_string(y=y3),fill="#008FD5") + 
    geom_area(aes_string(y=y2),fill="#FF2700") + 
    scale_x_date(labels = lbls, breaks = brks) +
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          axis.text.x = element_text(angle=45),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(title=title,
         subtitle=subtitle, 
         x=xtitle,
         y=ytitle,
         caption=caption)
  
  return(p)
}