

data {
    int<lower=0> N; // amount of projects
    int n[N]; //projects 
    vector [N] s; // backers
    vector [N] g; // goal
    int<lower=0,upper=1> y[N]; // success
}

parameters {
    real a;
    real<lower=0> b;
    real<lower=0> c;
}

model {
    b ~ normal(45,600);
    c ~ normal(8000, 30000);
    y ~ binomial_logit(N, a + b*s + c*g);
}

generated quantities {
  vector[N] log_lik;
  
  for (i in 1:N) {
    log_lik[i] = binomial_logit_lpmf(y[i] | n[i], a + b*s[i]+ c*g[i]);
  }
}


