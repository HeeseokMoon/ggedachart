#' Deviation Diverging Bars plot.
#'
#' divbar function will draw Diverging Bars plot for Deviation analysis.
#' @param data input data.frame
#' @param div.var diverging value variable
#' @param method "mean" or "median"
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return plot with ggplot2 grammar
#' @examples
#' plot<- divbar(data=mtcars,div.var="mpg",method="mean")
#' plot
divbar<-function(data,div.var, method="mean",
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

    # Diverging Barcharts
    p<-ggplot(df, aes_string(x="row", y="z", label="z")) +
      geom_bar(stat='identity', aes_string(fill="z_type"), width=.5)  +
      scale_fill_manual(name=div.var,
                        labels = c("Above Average", "Below Average"),
                        values = c("above"="#008FD5", "below"="#FF2700")) +
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
