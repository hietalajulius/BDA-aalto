

data {
    int N; // amount of groups
    vector[N] x; // backers per group
    int n[N]; //projects per group
    int y[N]; // amount of successful projects per group
}

parameters {
    real alpha;
    real beta;
}

model {
    y ~ binomial_logit(n, alpha + beta*x);
}

generated quantities {
  vector[N] log_lik;
  for (i in 1:N) {
    log_lik[i] = binomial_logit_lpmf(y[i] | n[i],alpha + beta*x[i]);
  }
}


