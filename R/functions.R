
# Function definitions for this drake workflow


# Limit dates we use to non-holidays and rename a column

subset_data <- function(data){
  
  data %>%
  filter(holiday == "not holiday") %>%
  rename(total_riders = cnt)
  
}


create_model_plot <- function(data){
  
  bike_model_plot <- ggplot(data = data,
                            aes(x = temp, y = total_riders)) +
    geom_point(alpha = 0.3) +
    geom_smooth(method = "lm") +
    facet_wrap(. ~ season)
  
  ggsave(filename = "figures/bike_model_plot.png",
         plot = bike_model_plot,
         width = 8, height = 8, units = "in")
  
}

# Build a lm using "data"
run_model <- function(data, resp_var, exp_var1, exp_var2){
  
  lm(formula = as.formula(paste(resp_var, "~", exp_var1, "*", exp_var2)),
   data = data)
  
}






