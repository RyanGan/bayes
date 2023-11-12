// Binomial Logistic example using salary 2 data
data {
  int N;                               // Number of observations
  vector <lower=0, upper=1> [N] Sex;   // Sex predictor bounded between 0 and 1
  vector <lower=0> [N] Income;         // Income predictor bounded by 0
  array[N] int<lower=0> M;            // Denominator number of visits
  array[N] int<lower=0> Y;            // Numerator number of purchases
}

parameters {
  vector[3] b;                         // Beta b predictors 
}

transformed parameters {
  // linear predictor of q = probability (I'd probably prefer to lable it p or pr)
  vector[N] q = inv_logit(b[1] + b[2]*Sex[1:N] + b[3]*Income[1:N]);
}

model {
  // Binomial model M visits q linear predictor of inverse logit
  Y[1:N] ~ binomial(M[1:N], q[1:N]);
}

generated quantities {
  // Y predictor
  array[N] int yp = binomial_rng(M[1:N], q[1:N]);
}
