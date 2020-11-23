#' Groups Dendrogram.
#'
#' dendrogram function will draw Dendrogram for Groups analysis.
#' @param data input data.frame
#' @param method hierarchical cluster method
#' @param value value variable
#' @param title main title
#' @param subtitle subtitle
#' @param caption caption
#' @return plot with ggplot2 grammar
#' @examples
#' hc <- hclust(dist(USArrests), "ave")  # hierarchical clustering
#'
#' dendrogram(data=USArrests)
#' dendrogram(hc)
dendrogram<-function(data,
                     method ="complete",
                     title=NULL,subtitle=NULL,caption=NULL){
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
