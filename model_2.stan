
data {
    int N; // amount of projects
    int n[N]; //projects 

    vector [N] g; // goal
    int y[N]; // success
}

parameters {
    real a;
    real c;
}

model {
    c ~ normal(-1,5);
    y ~ binomial_logit(N, a + c*g);
}

generated quantities {
  vector[N] log_lik;
  for (i in 1:N) {
    log_lik[i] = binomial_logit_lpmf(y[i] | n[i], a + c*g[i]);
  }
}
