// Model 4 Simple linear model for salary and years
data{
  int N;         // number of obs
  vector[N] Y;   // salary
  vector[N] X;   // years
  }

parameters{
  real a;
  real b;
  real<lower=0> sigma;
  }

model{
  // likelihood
  Y[1:N] ~ normal(a + b*X[1:N], sigma);
  }