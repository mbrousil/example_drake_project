
# Define the workflow

plan <- drake_plan(
  
  # Read in our data
  bike_data = read.csv(file = file_in("data/daily_bike_data.csv"),
                       stringsAsFactors = FALSE),
  
  # Subset the data
  bike_subset = subset_data(data = bike_data),
  
  # Plot the data relationship
  model_plot = create_model_plot(data = bike_subset),
  
  # Make model
  bike_model = run_model(data = bike_subset,
                         resp_var = "total_riders",
                         exp_var1 = "temp",
                         exp_var2 = "season"),
  
  # Export model summaries
  write_coef_table = write.csv(x = tidy(bike_model),
                               file = file_out("documents/coef_table.csv")),
  write_sum_table = write.csv(x = glance(bike_model),
                              file = file_out("documents/sum_table.csv"))
  
)