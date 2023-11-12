// Title: Poisson regression Model 5.6 

// Data block
data {
  int N;                                       // Number of observations
  vector <lower=0, upper=1> [N] Sex;           // Sex indicator
  vector <lower=0> [N] Income;                 // Income predictor bounded by 0
  array[N] int<lower=0> M;                     // Count of visits
}

// Parameters block
parameters {
  vector [3] b;                                // Beta b predictors
}

// Transformed parameters
transformed parameters {
  // Likelihood of lambda parameter
  vector[N] log_lam = b[1] + b[2]*Sex[1:N] + b[3]*Income[1:N];
}

// Model block
model {
  // Poisson model
  M[1:N] ~ poisson_log(log_lam[1:N]);
}

// Predicted counts
generated quantities {
  // M predictor
  array[N] int mp = poisson_log_rng(log_lam[1:N]); 
}

