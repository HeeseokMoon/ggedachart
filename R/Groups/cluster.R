cluster<-function(data,x,y,class,
                  title=NULL,subtitle=NULL,caption=NULL,...){
  df<-data
  x<-x
  y<-y
  class<-class
  k<-length(unique(df[,class]))
  label<-unique(df[,class])
  
  for(i in 1:k){
    assign(paste0("df",i),value = df[df[,class]==label[i],])
  }
  
  p <- ggplot(df, aes_string(x=x, y=y, col=class)) + 
    geom_point(aes_string(shape=class), size=2) +   # draw points
    coord_cartesian(xlim = 1.2 * c(min(df[,x]), max(df[,x])), 
                    ylim = 1.2 * c(min(df[,y]), max(df[,y]))) +
    theme_fivethirtyeight() + 
    scale_color_tableau()+
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(title=title,
         subtitle=subtitle, 
         caption=caption)
  
  for(i in 1:k){
    p<-p+geom_encircle(data = get(paste0("df",i)), aes_string(x=x, y=y)) 
  }
  
  return(p)
}
