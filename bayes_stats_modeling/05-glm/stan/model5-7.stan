// Title: Expression using matrix operation 5.7

// Data block
data {
  int<lower=0> N;  // Number of observations
  int<lower=0> D;  // Number of explanatory variables + intercept
  matrix[N,D] X;   // Preidctor matrix
  vector[N] Y;     // Dependent variable
}

// Parameters block
parameters {
  vector[D] b;
  real<lower=0> sigma;
}

// Transformed parameters block
transformed parameters {
  // Likelihood of mu predictor matric * b
  vector[N] mu = X*b;
}

// Model block
model {
  Y[1:N] ~ normal(mu[1:N], sigma);
}

