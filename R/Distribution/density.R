density<-function(data,x,col.var=NULL,
                  title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL,...){
  df<- data
  x<- x
  color<- col.var
  
  df[,color]<-as.factor(df[,color])
  
  # Plot
  p <- ggplot(df, aes_string(x))
  p <- p + geom_density(aes_string(fill=color), alpha=0.8) + 
    scale_fill_tableau() +
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(title=title,
         subtitle=subtitle, 
         x=xtitle,
         y=ytitle,
         caption=caption)
  
  
  return(p)
}
