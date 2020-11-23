tsplot<-function(data,time=NULL,value=NULL,
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL,...){
  df<-data
  x<-time
  y<-value
  
  if(class(df)=="ts"){
    p<-autoplot(df)+
      theme_fivethirtyeight() + 
      theme(axis.title = element_text(),
            legend.title = element_text(face = 4,size = 10),
            legend.direction = "horizontal", legend.box = "horizontal") +
      labs(title=title,
           subtitle=subtitle, 
           x=xtitle,
           y=ytitle,
           caption=caption)
  } else {
    p<-ggplot(df, aes_string(x=time)) +
      geom_line(aes_string(y=value)) +
      theme_fivethirtyeight() + 
      theme(axis.title = element_text(),
            legend.title = element_text(face = 4,size = 10),
            legend.direction = "horizontal", legend.box = "horizontal") +
      labs(title=title,
           subtitle=subtitle, 
           x=xtitle,
           y=ytitle,
           caption=caption)
  }

  return(p)
}

