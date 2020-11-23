dot<-function(data,x,y,
              title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y
  
  df<- df[order(df[,y]),]
  df[,x] <- factor(df[,x], levels = df[,x]) 
  
  p<-   ggplot(df, aes_string(x=x, y=y)) + 
    geom_point(col="#008FD5", size=3) +   # Draw points
    geom_segment(aes_string(x=x, 
                            xend=x, 
                            y=min(y), 
                            yend=max(y)), 
                 linetype="dashed", 
                 size=0.1) +   # Draw dashed lines
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(subtitle=subtitle,
         y=ytitle,
         x=xtitle,
         title=title,
         caption = caption) +  
    coord_flip()

  return(p)
}