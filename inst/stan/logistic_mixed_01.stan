functions {

}
data {
  int<lower=1> N;
  int y[N];

  int<lower=1> K;
  int<lower=1, upper=K> arm[N];

  int<lower=1> N_clust;
  int<lower=1> clustid[N];

  int prior_only;
  int prior_to_use;

  real prior_soc_par1;
  real prior_soc_par2;
  real prior_soc_par3;

  real<lower=0> pri_var_par1;
  real<lower=0> pri_var_par2;

}
transformed data {

}
parameters {
  vector[K] b;

  real<lower=0> tau2;
  vector[N_clust] z_1;

}
transformed parameters {

}
model {
  vector[N] mu ;
  for (i in 1:N) {

    mu[i] = b[arm[i]] + sqrt(tau2) * z_1[clustid[i]];

  }

  // priors including all constants

  if(prior_to_use == 1){
    target += normal_lpdf(b | prior_soc_par1, prior_soc_par2);
  } else if(prior_to_use == 2){
    target += student_t_lpdf(b | prior_soc_par1, prior_soc_par2, prior_soc_par3);
  } else if(prior_to_use == 3){
    target += logistic_lpdf(b | prior_soc_par1, prior_soc_par2);
  } else if(prior_to_use == 4){
    target += uniform_lpdf(b | prior_soc_par1, prior_soc_par2);
  } else if(prior_to_use == 5){
    target += inv_gamma_lpdf(b | prior_soc_par1, prior_soc_par2);
  }

  target += student_t_lpdf(tau2 | pri_var_par1, 0, pri_var_par2) -
      1 * student_t_lccdf(0 | pri_var_par1, 0, pri_var_par2);

  target += normal_lpdf(z_1 | 0, 1);


  // likelihood including all constants
  if (!prior_only) {
    target += bernoulli_logit_lpmf(y | mu);
  }
}
generated quantities {



}
