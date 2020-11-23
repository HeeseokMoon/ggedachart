histogram<-function(data,x,col.var=NULL,
                    binwidth= .1, bins=NULL,
                    title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  color<- col.var
  binwidth<-binwidth
  bins<-bins
  
  if(class(df[,x])=="numeric"){
    print(paste(x,"is numeric variable"))
    # Histogram on a Continuous (Numeric) Variable
    p <- ggplot(df, aes_string(x)) + scale_fill_tableau()
    
    p <- p + geom_histogram(aes_string(fill=color), 
                            binwidth = binwidth,
                            bins=bins,
                            col="black", 
                            size=.1) +  
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
 
  if(class(df[,x])=="character"|class(df[,x])=="factor"){
    print(paste(x,"is categorical variable"))
    # Histogram on a Categorical variable
    p <- ggplot(df, aes_string(x)) + scale_fill_tableau()
    
    p <- p + geom_bar(aes_string(fill=color), width = 0.8) + 
      theme_fivethirtyeight() + 
      theme(axis.title = element_text(),
            legend.title = element_text(face = 4,size = 10),
            axis.text.x = element_text(angle=65, vjust=0.6),
            legend.direction = "horizontal", legend.box = "horizontal") +
      labs(title=title,
           subtitle=subtitle, 
           x=xtitle,
           y=ytitle,
           caption=caption)
  }

  return(p)
  
}


