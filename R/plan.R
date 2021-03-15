# Define the workflow

plan <- drake_plan(
  
  bike_data = read.csv(file = file_in("data/daily_bike_data.csv"),
                       stringsAsFactors = FALSE),
  
  bike_subset = subset_data(data = bike_data),
  
  model_plot = create_model_plot(data = bike_subset,
                                 out_path = file_out("figures/bike_model_plot.png")),  
  
  bike_model = run_model(data = bike_subset,
                         resp_var = "total_riders",
                         exp_var1 = "temp",
                         exp_var2 = "season"),
  
  # NOTE: We write these verbatim here instead of in functions.R bc they're small:
  write_coef_table = write.csv(x = tidy(bike_model),
                               file = file_out("documents/coef_table.csv")),
  
  write_sum_table = write.csv(x = glance(bike_model),
                              file = file_out("documents/sum_table.csv")),
  
)