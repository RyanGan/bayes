// Binomial Logistic example using salary 2 data
data {
  int V;                                  // Number of observations
  vector <lower=0, upper=1> [V] Sex;      // Sex predictor bounded between 0 and 1
  vector <lower=0> [V] Income;            // Income predictor bounded by 0
  vector <lower=0, upper=1> [V] Discount;  // Discount variable
  array[V] int<lower=0, upper=1> Y;        // Binomial (0/1) purchase
}

parameters {
  vector[4] b;                         // Beta b predictors 
}

transformed parameters {
  // linear predictor of q = probability (I'd probably prefer to lable it p or pr)
  vector[V] q = inv_logit(b[1] + b[2]*Sex[1:V] + b[3]*Income[1:V] + b[4]*Discount[1:V]);
}

model {
  // Bernoulli q linear predictor of inverse logit
  Y[1:V] ~ bernoulli(q[1:V]);
}

generated quantities {
  // Y predictor
  array[V] int yp = bernoulli_rng(q[1:V]);
}
