library(ggalt)
dumbbell<-function(data,group,dif.var,value.var,start="min",end="max",
                   title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<-data
  group<-group
  diff<-dif.var
  value<-value.var
  
  if(start=="min"){
    x<-min(df[,diff])
  } else{
    x<-start
  }
  
  if(end=="max"){
    xend<-max(df[,diff])
  } else{
    xend<-end
  }
  
  foo<-dcast(df, df[,group]~df[,diff],value.var = value)
  colnames(foo)[1]<-group
  foo[,1]<-as.character(foo[,1])
  
  foo$x<-foo[,as.character(x)]
  foo$xend<-foo[,as.character(xend)]
  
  x<-"x"
  xend<-"xend"

  p <- ggplot(foo, aes_string(x=x, xend=xend, y=group, group=group)) + 
    geom_dumbbell(color="#a3c4dc", 
                  size=0.75,
                  colour_x ="#044763") + 
    scale_x_continuous(labels=comma) + 
    theme_fivethirtyeight() +
    theme(plot.title = element_text(hjust=0.5, face="bold"),
          plot.background=element_rect(fill="#f7f7f7"),
          panel.background=element_rect(fill="#f7f7f7"),
          panel.grid.minor=element_blank(),
          panel.grid.major.y=element_blank(),
          panel.grid.major.x=element_line(),
          axis.ticks=element_blank(),
          legend.position="top",
          panel.border=element_blank())+
    labs(subtitle=subtitle,
         y=ytitle,
         x=xtitle,
         title=title,
         caption = caption)
  
  return(p)
}