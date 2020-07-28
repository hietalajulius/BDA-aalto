

data {
    int N; // amount of projects
    int n[N]; //projects 
    vector [N] s; // backers
    vector [N] g; // goal
    int y[N]; // success

}

parameters {
    real a;
    real b;
    real c;
    real d;
}

model {
    b ~ normal(180,600);
    c ~ normal(15000, 30000);
    y ~ binomial_logit(N, a + b*s + c*g + d*(s*g)));
}

generated quantities {
  vector[N] log_lik;
  
  for (i in 1:N) {
    log_lik[i] = binomial_logit_lpmf(y[i] | n[i], a + b*s[i] + c*g[i] + d*(s[i]*g[i]));
  }
}


