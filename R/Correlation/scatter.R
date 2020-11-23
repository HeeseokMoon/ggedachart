library('ggplot2')
##Scatter plot
# x,y,color,size 총 4가지 정보 표현 가능
# dataframe 형태/ tidy화된 데이터
# x :numeric , y:numeric , col.var:category, size.var:numeric
scatter<-function(data,x,y,col.var=NULL,size.var=NULL,
                  method="loess",
                  title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  
  df<- data
  x<- x
  y<- y
  color<- col.var
  size<- size.var
  method<- method
  
  # if(class(dataframe)[1]!="data.frame")-----
  #   cat("Input error")
  #
  # if(class(x)!="numeric")
  #   cat("x error")
  #
  # if(class(y)!="numeric")
  #   cat("y error")
  #
  # if(class(col.var)!="factor"&class(col.var)!="character")
  #   cat("col.var error")
  #
  # if(class(size.var)!="numeric")
  #   cat("size.var error")
  #
  
  #-----
  p <- ggplot(df, aes_string(x=x, y=y)) +
    geom_point(aes_string(col=color, size=size)) +
    geom_smooth(method=method, se=F,color="Dark Gray") +  #smooth : x - y correlation "lm", "glm", "gam", "loess"
    theme_fivethirtyeight() + 
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    scale_color_fivethirtyeight(color) +
    labs(title=title,
         subtitle=subtitle, 
         x=xtitle,
         y=ytitle,
         caption=caption)
  
  # p <- p + theme_fivethirtyeight() + 
  #   
  return(p)
}
