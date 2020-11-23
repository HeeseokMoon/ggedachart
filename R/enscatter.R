#' Correlation scatter plot with encircling.
#'
#' enscatter function will draw scatter plot with encircling for correlation analysis.
#' @param data input data.frame
#' @param x x variable
#' @param y y variable
#' @param col.var color variable
#' @param size.var size variable
#' @param subset subset list type
#' @param title main title
#' @param subtitle subtitle
#' @param xtitle x axis title
#' @param ytitle y axis title
#' @param caption caption
#' @return plot with ggplot2 grammar
#' @examples
#' #make subset
#' iris_select1<-iris[iris$Species=="setosa",]
#' iris_select2<-iris[iris$Species=="versicolor",]
#' iris_select3<-iris[iris$Species=="virginica",]
#' iris_subset<-list(iris_select1,iris_select2,iris_select3)
#' #scatter plot with encircling
#' plot<- enscatter(data=iris, x="Sepal.Length", y="Petal.Length", col.var = "Species", subset = iris_subset)
#' plot
enscatter<-function(data,x,y,col.var=NULL,size.var=NULL,subset,
                             title=NULL,subtitle=NULL,xtitle=NULL,ytitle=NULL,caption=NULL){
  df<- data
  x<- x
  y<- y
  color<- col.var
  size<- size.var
  df_select<-subset #list

  if(length(df_select)==1){
    p<-ggplot(df, aes_string(x=x, y=y)) +
      geom_point(aes_string(col=color, size=size)) +   # draw points
      geom_smooth(method="loess", se=F,color="Dark Gray") +
      geom_encircle(aes_string(x=x, y=y),
                    data=df_select[[1]],
                    color="#008FD5",
                    size=2,
                    expand=0.08) +   # encircle
      labs(title=title,
           subtitle=subtitle,
           x=xtitle,
           y=ytitle,
           caption=caption)
  }

  if(length(df_select)==2){
    p<-ggplot(df, aes_string(x=x, y=y)) +
      geom_point(aes_string(col=color, size=size)) +   # draw points
      geom_smooth(method="loess", se=F,color="Dark Gray") +
      geom_encircle(aes_string(x=x, y=y),
                    data=df_select[[1]],
                    color="#008FD5",
                    size=2,
                    expand=0.08) +   # encircle
      geom_encircle(aes_string(x=x, y=y),
                    data=df_select[[2]],
                    color="#FF2700",
                    size=2,
                    expand=0.08) +
      labs(title=title,
           subtitle=subtitle,
           x=xtitle,
           y=ytitle,
           caption=caption)
  }

  if(length(df_select)==3){
    p<-ggplot(df, aes_string(x=x, y=y)) +
      geom_point(aes_string(col=color, size=size)) +   # draw points
      geom_smooth(method="loess", se=F,color="Dark Gray") +
      geom_encircle(data=df_select[[1]],
                    aes_string(x=x, y=y),
                    color="#008FD5",
                    size=2,
                    expand=0.08) +   # encircle
      geom_encircle(aes_string(x=x, y=y),
                    data=df_select[[2]],
                    color="#FF2700",
                    size=2,
                    expand=0.08) +
      geom_encircle(aes_string(x=x, y=y),
                    data=df_select[[3]],
                    color="#77AB43",
                    size=2,
                    expand=0.08) +
      labs(title=title,
           subtitle=subtitle,
           x=xtitle,
           y=ytitle,
           caption=caption)
  }
  p<-p + theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    scale_color_fivethirtyeight(color)

  return(p)

}
