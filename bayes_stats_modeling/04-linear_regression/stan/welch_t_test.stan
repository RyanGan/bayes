//
// Two sample t-test example assuming equal sd
//

data {
  int<lower=0> N1;   // Group 1 N
  vector[N1] Y1;     // Group 1 Y
  int<lower=0> N2;   // Group 2 N
  vector[N2] Y2;     // Group 2 Y
}

parameters {
  real mu1;          // Mean of group 1
  real mu2;          // Mean of group 2
  real<lower=0> sigma1; // Mean of group 1
  real<lower=0> sigma2;
}

model {
  // y1 estimate
  Y1[1:N1] ~ normal(mu1, sigma1);
  // y2 estimate
  Y2[1:N2] ~ normal(mu2, sigma2);
  // No priors, assume uniform for now
}



