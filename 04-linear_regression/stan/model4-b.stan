// Model 4 Simple linear model for salary and years
data{
  int N;         // number of obs
  vector[N] Y;   // salary
  vector[N] X;   // years
  int Np;        // number of predictions?
  vector[Np] Xp; // vector of X values to predict at
  }

parameters{
  real a;        // alpha (intercept) param
  real b;        // beta param
  real<lower=0> sigma; // sigma param for sd
  }

transformed parameters{
  // vector of X along length N (y_base will be saved since it's in trans param block)
  vector[N] y_base = a + b*X[1:N];
}

model{
  // likelihood
  Y[1:N] ~ normal(y_base[1:N], sigma);
  }
  
generated quantities {
  vector[Np] yp_base = a + b*Xp[1:Np]; // for credible/confidence intervals
  array[Np] real yp = normal_rng(yp_base[1:Np], sigma); // prediction intervals of yp
}
