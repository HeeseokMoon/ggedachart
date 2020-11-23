dendrogram<-function(data,
                     method ="complete",
                     title=NULL,subtitle=NULL,caption=NULL,...){
  df<-data
  method<-method
  
  if(class(df)=="hclust"){
    p<-ggdendrogram(df, rotate = TRUE, size = 2) +
      theme_fivethirtyeight() + 
      theme(legend.title = element_text(face = 4,size = 10),
            legend.direction = "horizontal", legend.box = "horizontal",
            panel.grid.major.y = element_blank()) +
      labs(title=title,
           subtitle=subtitle, 
           caption=caption)
  } else {
    hc <- hclust(dist(df), method=method) 
    
    p<-ggdendrogram(hc, rotate = TRUE, size = 2)+
      theme_fivethirtyeight() + 
      theme(legend.title = element_text(face = 4,size = 10),
            legend.direction = "horizontal", legend.box = "horizontal",
            panel.grid.major.y = element_blank()) +
      labs(title=title,
           subtitle=subtitle, 
           caption=caption)
  }
  
  return(p)
}
