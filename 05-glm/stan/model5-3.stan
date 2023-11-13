// Model 5-3 


data {
  int N;                                // Number of observations
  vector <lower=0, upper=1> [N] Sex;    // Sex dummy variable
  vector <lower=0> [N] Income;          // Base income vector
  vector <lower=0, upper=1> [N] Y;      // Purchase proportion (Dependent) 
}

parameters {
  vector[3] b;         // Hmm new to me that you can define betas as a length of 3
  real<lower=0> sigma; // Sigma parameter
}

transformed parameters {
  // mu parameter as a linear function of predictors
  vector[N] mu = b[1] + b[2] * Sex[1:N] + b[3]*Income[1:N];
}

model {
  // Note, given it's a proportion, I'd think maybe we'd want to constrain?
  // but following notes for now
  Y[1:N] ~ normal(mu[1:N], sigma);
    // no priors specified, using default uniform
}

generated quantities {
  array[N] real yp = normal_rng(mu[1:N], sigma);
  // epsilon 
  vector[N] yp_vector = to_vector(yp);            // Convert yp to a vector
  vector[N] Y_unconstrained = to_vector(Y);       // Convert Y to an unconstrained vector
  vector[N] epsilon = Y_unconstrained - yp_vector; // Calculate epsilon
}
