library('ggplot2') # visualization
divlolipop<-function(data,div.var, method="mean",
                 title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  div.var<- div.var
  
  
  if(method=="mean"){
    df$row<-rownames(df)
    df$z<-round((df[,div.var] - mean(df[,div.var])), 2)
    df$z_type <- ifelse(df$z < 0, "below", "above")
    df <- df[order(df$z), ]
    df$row <- factor(df$row, levels = df$row)
  }
  
  if(method=="median"){
    df$row<-rownames(df)
    df$z<-round((df[,div.var] - median(df[,div.var])), 2)
    df$z_type <- ifelse(df$z < 0, "below", "above")
    df <- df[order(df$z), ]
    df$row <- factor(df$row, levels = df$row)
  }
  
  p<-ggplot(df, aes_string(x="row", y="z", label="z")) + 
    geom_point(stat='identity', fill="black", size=6)  +
    geom_segment(aes_string(y = 0, 
                     x = "row", 
                     yend = "z", 
                     xend = "row"), 
                 color = "black") +
    geom_text(color="white", size=2) +
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal")+
    labs(title=title,
         subtitle=subtitle, 
         x=xtitle,
         y=ytitle,
         caption=caption) +
    coord_flip()
  
  return(p)
}
