
data {
    int N; // amount of projects
    int n[N]; //projects 

    vector [N] p; // pledged
    int y[N]; // success
}

parameters {
    real a;
    real d;
}

model {
    d ~ normal(1,5);
    y ~ binomial_logit(N, a + d*p);
}

generated quantities {
  vector[N] log_lik;
  for (i in 1:N) {
    log_lik[i] = binomial_logit_lpmf(y[i] | n[i], a + d*p[i]);
  }
}
