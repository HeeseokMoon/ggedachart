slope<-function(data,group,dif.var,value.var,start="min",end="max",
                title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<-data
  group<-group
  diff<-dif.var
  value<-value.var
  
  if(start=="min"){
    y<-min(df[,diff])
  } else{
    y<-start
  }
  
  if(end=="max"){
    yend<-max(df[,diff])
  } else{
    yend<-end
  }
  
  foo<-dcast(df, df[,group]~df[,diff],value.var = value)
  colnames(foo)[1]<-group
  foo[,1]<-as.character(foo[,1])
  
  left_label <- paste(foo[,1], round(foo[,as.character(y)]),sep=", ")
  right_label <- paste(foo[,1], round(foo[,as.character(yend)]),sep=", ")
  foo$class <- ifelse((foo[,as.character(y)] - foo[,as.character(yend)]) < 0, "down", "up")
  foo$y<-foo[,as.character(y)]
  foo$yend<-foo[,as.character(yend)]
  foo$x<-1
  foo$xend<-2
  
  start<-y
  end<-yend
  x<-"x"
  xend<-"xend"
  y<-"y"
  yend<-"yend"
  col<-"class"

  p <- ggplot(foo) + geom_segment(aes_string(x=x, xend=xend, y=y, yend=yend, col=col), size=.75, show.legend=F) + 
    geom_vline(xintercept=1, linetype="dashed", size=.1) + 
    geom_vline(xintercept=2, linetype="dashed", size=.1) +
    scale_color_manual(labels = c("Up", "Down"), 
                       values = c("up"="#FF2700", "down"="#008FD5")) +  # color of lines
    xlim(.5, 2.5) + ylim(0,(1.1*(max(foo[,y], foo[,yend]))))

  
  # Add texts
  p <- p + geom_text(label=left_label, y=foo[,y], x=rep(1, NROW(foo)), hjust=1.1, size=3.5)
  p <- p + geom_text(label=right_label, y=foo[,yend], x=rep(2, NROW(foo)), hjust=-0.1, size=3.5)
  p <- p + geom_text(label=paste("Start","(",start,")"), x=1, y=1.1*(max(foo[,y], foo[,yend])), hjust=1.2, size=5)  # title
  p <- p + geom_text(label=paste("End","(",end,")"), x=2, y=1.1*(max(foo[,y], foo[,yend])), hjust=-0.1, size=5)  # title
  
  #theme
  p<-p + theme_fivethirtyeight()+
    theme(panel.background = element_blank(), 
          panel.grid = element_blank(),
          axis.ticks = element_blank(),
          axis.text.x = element_blank(),
          panel.border = element_blank(),
          plot.margin = unit(c(1,2,1,2), "cm")) +
    labs(subtitle=subtitle,
         y=ytitle,
         x=xtitle,
         title=title,
         caption = caption)
  
  return(p)
}
