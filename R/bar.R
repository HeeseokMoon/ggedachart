bar<-function(data,
              title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL,...){
  freqtable <- table(data)
  df <- as.data.frame.table(freqtable)
  
  
  p <- ggplot(df, aes(data, Freq))
  p <- p + geom_bar(stat="identity", width = 0.5, fill="#008FD5") + 
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

