
# Load packages
source("R/packages.R")
# Load functions
source("R/functions.R")
# Load plan
source("R/plan.R")

vis_drake_graph(plan)

make(
  # Run the plan created in plan.R
  plan,
  # Show target-by-target messages
  verbose = 1
)

vis_drake_graph(plan)
