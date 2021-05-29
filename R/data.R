getFacts <- function() {
  return(read.csv('../processed_data/processed_county_facts.csv', header = T, stringsAsFactors = F))
}

getDeaths <- function() {
  return(read.csv('../processed_data/processed_covid_deaths.csv', header = T, stringsAsFactors = F))
}

getPop <- function() {
  return(read.csv('../processed_data/processed_county_population.csv', header = T, stringsAsFactors = F))
}