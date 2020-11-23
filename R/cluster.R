#' Groups Clusters
#'
#' cluster function will draw Clusters for Groups analysis.
#' @param data input data.frame
#' @param x x variable
#' @param y y variable
#' @param class class variable
#' @param title main title
#' @param subtitle subtitle
#' @param caption caption
#' @return plot with ggplot2 grammar
#' @examples
#' # Compute data with principal components
#' df <- iris[c(1, 2, 3, 4)]
#' pca_mod <- prcomp(df)  # compute principal components
#'
#' # Data frame of principal components
#' df_pc <- data.frame(pca_mod$x, Species=iris$Species)  # dataframe of principal components
#' plot<- cluster(data=df_pc,x="PC1",y="PC2",class="Species",
#'                title="Iris Clustering",
#'                subtitle="With principal components PC1 and PC2 as X and Y axis",
#'                caption="Source: Iris")
#' plot
cluster<-function(data,x,y,class,
                  title=NULL,subtitle=NULL,caption=NULL){
  df<-data
  x<-x
  y<-y
  class<-class
  k<-length(unique(df[,class]))
  label<-unique(df[,class])

  for(i in 1:k){
    assign(paste0("df",i),value = df[df[,class]==label[i],])
  }

  p <- ggplot(df, aes_string(x=x, y=y, col=class)) +
    geom_point(aes_string(shape=class), size=2) +   # draw points
    coord_cartesian(xlim = 1.2 * c(min(df[,x]), max(df[,x])),
                    ylim = 1.2 * c(min(df[,y]), max(df[,y]))) +
    theme_fivethirtyeight() +
    scale_color_tableau()+
    theme(axis.title = element_text(),
          legend.title = element_text(face = 4,size = 10),
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(title=title,
         subtitle=subtitle,
         caption=caption)

  for(i in 1:k){
    p<-p+geom_encircle(data = get(paste0("df",i)), aes_string(x=x, y=y))
  }

  return(p)
}
