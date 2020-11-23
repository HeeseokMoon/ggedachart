library(ggcorrplot)
correlogram<-function(data,
                      title=NULL,subtitle=NULL,caption=NULL,...){
  df<-data[, sapply(data, class) == "numeric"]
  
  corr<-round(cor(df),2)
  
  ggcorrplot(corr, hc.order = TRUE, 
             type = "lower", 
             lab = TRUE, 
             lab_size = 3, 
             method="square",
             color=c("#008FD5", "white", "#FF2700")) +
    theme_fivethirtyeight() +
    labs(subtitle=subtitle,
         title=title,
         caption = caption)

}

