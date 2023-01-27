## cheat() function

cheat <- function(exercise){
  if(exercise == "Q3.1.3"){
    library(ggplot2) #load ggplot2
    library(titanic) #load titanic
    
    titanic <- titanic_train
    head(titanic) #inspect passenger data
    
    titanic$Survived[titanic$Survived == 0] <-
      "dead" #assign "dead" to Survived == 0
    titanic$Survived[titanic$Survived == 1] <-
      "alive" #assign "alive" to Survived == 1
    
    Q3_plot <-
      ggplot(data = titanic, aes(x = Sex, fill = factor(Survived, levels = c("dead", "alive")))) +
      geom_bar(position = "stack") + labs(fill = "How did it go?") #stacked histogram with legend "How did it go?" with geom_bar
    return(Q3_plot)
  }
  if(exercise == "Q3.1.6"){
    max_weight_chick <-
      aggregate(ChickWeight$weight, by = list(Chick = ChickWeight$Chick), max) #find max weight of each chicken
    max_weight_chick <-
      max_weight_chick[max_weight_chick$Chick %in% c(1, 20, 3, 40, 5), ] #select only chicks 1, 20, 3, 40, and 5
    
    max_weight_chick$Chick <-
      factor(max_weight_chick$Chick, levels = c(1, 20, 3, 40, 5)) # Reorder the chicks to match order they are in in the assignment graph
    
    Q6_plot <-
      ggplot(data = max_weight_chick, aes(x = Chick, y = x)) + geom_bar(stat = "identity") + xlab("chick") + ylab("max_weight") # Plot the bar graph with geom_bar
    return(Q6_plot)
  }
  if(exercise == "Q3.1.10"){
    library(plotly)
    Q10_data <- read.csv("Body Measurements.csv")
    
    Q10_plot <-
      plot_ly(
        Q10_data,
        x = ~ TotalHeight,
        y = ~ LegLength,
        z = ~ ShoulderToWaist
      ) #create a 3D scatter plot
    return(Q10_plot)
  }
  if(exercise == "Q3.1.12"){
    library(quantmod) #load package
    
    Sys.setenv(TZ = "UTC") #set timezone to UTC (same as timezone of object created below)
    getSymbols("IBM", from = "2022-01-1", to = "2022-12-31") #get chosen stock in 2022
    
    Q12_plot <-
      chartSeries(
        IBM,
        type = "bars",
        show.grid = TRUE,
        bar.type = "hlc",
        theme = chartTheme("white")
      ) #plot price of IBM stock in 2022 using chart_Series function
  }
  if(exercise == "Q3.1.13"){
    plotstock <-
      function(stock = "IBM",
               year = "2022",
               file = "plotstock_IBM") {
        start <- paste(year , "-01-1", sep = "")
        end <- paste(year , "-12-31", sep = "")
        stock_data <-
          getSymbols(
            Symbols = stock,
            env = .GlobalEnv,
            from = start,
            to = end,
            auto.assign = FALSE
          )
        file_name <- paste(file , ".jpeg", sep = "")
        jpeg(file = file_name)
        stock_plot <- chartSeries(
          stock_data,
          type = "bars",
          show.grid = TRUE,
          name = stock,
          bar.type = "hlc",
          theme = chartTheme("white")
        )
        dev.off()
      }
    return(plotstock())
  }
}

