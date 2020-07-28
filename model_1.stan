
data {
    int N; // amount of projects
    int n[N]; //projects 

    vector [N] s; // backers
    int y[N]; // success
}

parameters {
    real a;
    real b;
}

model {
    b ~ normal(1,10);
    y ~ binomial_logit(N, a + b*s);
}

generated quantities {
  vector[N] log_lik;
  for (i in 1:N) {
    log_lik[i] = binomial_logit_lpmf(y[i] | n[i], a + b*s[i]);
  }
}
