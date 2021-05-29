get_counties <- function(d) {
  return(dplyr::select(d, county, state))
}

map_counties <- function(cd, cp, cf, demographic) {
  
  #It appears that all data frames are already arranged in an ascending order by FIPS.
  #In such case, the following three lines are unnecessary.
  cd <- cd %>% arrange(FIPS)
  cf <- cf %>% arrange(FIPS)
  cp <- cp %>% arrange(FIPS)
  
  counties <- get_counties(cd)
  counties$deathRate <- rowSums(select(cd, -FIPS, -county, -state, -stateFIPS)) / cp$population
  counties$statistic <- cf[[demographic]]
  
  return(counties)
}

plotDem <- function(cd, cp, cf, dem) {
  thisDem <- select(map_counties(cd, cp, cf, dem), deathRate, statistic)

  thisPlot <- ggplot(data = thisDem, aes(x = statistic, y = deathRate)) +
    ggtitle(paste('Relationship between Covid-19 Death Rate \nand Percentage of', dem, 'in Population by Counties')) +
    geom_point(color = "red", size = 1.5, fill = 'blue', shape = 1, stroke = 0.5) + 
    xlab(paste('Percentage of', dem, 'in Population')) +
    geom_smooth(method = 'lm', formula = y ~ ifelse(is.finite(log(x)), log(x), 0), se = F, size = 0.5) +
    scale_y_continuous(name = 'Death Rate', limits = c(0, 0.005)) +
    theme_minimal()
  
  print(thisPlot)
  
  return(coef(lm(deathRate ~ statistic, thisDem))[[2]])
  
}