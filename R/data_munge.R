county_population <- read.csv('../raw_data/county_population.csv', header = T, stringsAsFactors = F)
county_facts <- read.csv('../raw_data/county_facts.csv', header = T, stringsAsFactors = F)
covid_deaths <- read.csv('../raw_data/covid_deaths.csv', header = T, stringsAsFactors = F)

names(county_population)[1:3] <- c('FIPS', 'county', 'state') 
names(county_facts)[1:3] <- c('FIPS', 'county', 'state') 
names(covid_deaths)[1:3] <- c('FIPS', 'county', 'state') 

write.csv(county_population, '../processed_data/processed_county_population.csv', row.names = F)
write.csv(county_facts, '../processed_data/processed_county_facts.csv', row.names = F)
write.csv(covid_deaths, '../processed_data/processed_covid_deaths.csv', row.names = F)