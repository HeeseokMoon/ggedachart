#' Trend Calendar Heat Map.
#'
#' calendar function will draw Calendar Heat Map for Trend analysis.
#' @param data input data.frame
#' @param time time variable
#' @param value value variable
#' @param title main title
#' @param subtitle subtitle
#' @param caption caption
#' @return An object of class \code{ggplot}
#' @examples
#' #Prepare data
#' df <- read.csv("https://raw.githubusercontent.com/selva86/datasets/master/yahoo.csv")
#' df$date <- as.Date(df$date)  # format date
#' df <- df[df$year >= 2012, ]  # filter years
#'
#' #calendar
#' plot<- calendar(data=df,time="date",value="VIX.Close")
#' plot
#'
#' @import ggplot2
#' @import scales
#' @import reshape2
#' @import ggthemes
#' @import gganimate
#' @import gapminder
#' @import ggalt
#' @import ggExtra
#' @import ggcorrplot
#' @import dplyr
#' @import treemapify
#' @import ggfortify
#' @import zoo
#' @importFrom plyr ddply
#' @import ggdendro
#' @export
calendar<-function(data,time,value,
                    title=NULL,subtitle=NULL,caption=NULL){
  df<-data
  x<-time
  y<-value

  # split date with columns
  df$year<-lubridate::year(df[,x])
  df$monthf<-factor(months(df[,x]),levels=c("1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"))
  df$week<-lubridate::week(df[,x])
  df$weekdayf<-factor(weekdays(df[,x]),levels=c("일요일","토요일","금요일","목요일","수요일","화요일","월요일"))

  # Create Month Week
  df$yearmonth <- as.yearmon(df[,x])
  df$yearmonthf <- factor(df$yearmonth)
  df <- plyr::ddply(df,.(yearmonthf), transform, monthweek=1+week-min(week))
  df <- df[, c("year", "yearmonthf", "monthf", "week", "monthweek", "weekdayf",value)]


  p<- ggplot(df, aes(monthweek, weekdayf)) +
    geom_tile(aes_string(fill = value), color = "white") +
    facet_grid(year~monthf) +
    scale_fill_gradient(low="#008FD5", high="#FF2700") +
    theme_fivethirtyeight() +
    theme(axis.title = element_text(),
          axis.title.y = element_blank(),
          legend.title = element_text(face = 4,size = 10),
          legend.key.size = unit(.4,"cm") ,
          legend.direction = "horizontal", legend.box = "horizontal") +
    labs(title=title,
         subtitle=subtitle,
         x="Week of Month",
         caption=caption)

  return(p)
}
