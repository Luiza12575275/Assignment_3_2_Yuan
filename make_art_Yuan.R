## make_art() function

#the function takes a random seed as argument and produces a piece of random art
make_art <- function(seed) {
  set.seed(seed)
  data <- data.frame(x = runif(1000, min = -100, max = 100) + runif(5, min = -100, max = 100),
                     y = runif(1000, min = -100, max = 100) + runif(5, min = -100, max = 100),
                     color = sample(brewer.pal(n = 8, name = "Dark2"), 1000, replace = TRUE))
  ggplot(data, aes(x, y, color = color)) +
    geom_line(aes(group = cut_number(..x.., 5), fill = color),alpha = 0.8) +
    geom_path(aes(group = cut_number(..x.., 5)), size = 0.5) +
    theme_void() +
    theme(legend.position = "none")
}


