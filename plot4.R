library("dplyr")
library("ggplot2")

NEI = readRDS("D:/Rprogramming/Exploratory data analysis/Exploratory-data-analysis-on-air-pollution-data/summarySCC_PM25.rds")

SCC = readRDS("D:/Rprogramming/Exploratory data analysis/Exploratory-data-analysis-on-air-pollution-data/Source_Classification_Code.rds")

coal_scc <- SCC %>%
  filter(grepl("coal",EI.Sector,ignore.case = TRUE)) %>%
  select(SCC)

emissions_y <- NEI %>%
  filter(SCC %in% coal_scc$SCC) %>%
  group_by(year)%>%
  summarise(total_emissions = sum(Emissions))

emissions_y$year <- as.factor(emissions_y$year)

ggplot(emissions_y,aes(x=year, y = total_emissions))+
  geom_bar(stat = "identity")+ labs(x = "Year", y = "PM2.5 Emissions") +
  ggtitle("PM2.5 Emission from Coal associated Sources")
dev.copy(png,'plot4.png')
dev.off()