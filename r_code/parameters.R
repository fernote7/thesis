

# S = 100;                # Spot price
# r = 0.02;               # mu equivalent - risk-free rate of return
# v = 0.04;               # v0 equivalent - current variance of the underlying asset
# sigma = 0.7;            # ksi equivalent - vol of vol
# theta = 0.06;           # long term mean
# k = 2;                # kappa - rate of mean reversion
# X = 85;                 # K equivalent - strike price
# tau = 0.25;             # T equivalent - Time to expiration in years
## dt <- 0.001;
# rho <- -0.2;               # correlation between Wiener processes
# N <- 10000;
# sensibility = 15        # Strike price sensibility


S = 100;                 # Spot price
X = 100;                 # K equivalent - strike price
v = 0.09;                # v0 equivalent - current variance of the underlying asset
k = 2;                   # kappa - rate of mean reversion
theta = 0.09;            # long term mean
sigma = 1;               # ksi equivalent - vol of vol
rho = -0.3;              # correlation between Wiener processes
r = 0.05;                # mu equivalent - risk-free rate of return
tau = 1.0;               # T equivalent - Time to expiration in years
N=10000;                 # Number of simulations
t = 0                    # initial value
dt <- (tau-t)/1000;


# S = 100;                 # Spot price
# r = 0.05;                # mu equivalent - risk-free rate of return
# v = 0.01;                # v0 equivalent - current variance of the underlying asset
# sigma = 0.1;               # ksi equivalent - vol of vol
# #theta = (2*0.01)/(2+0.05);            # long term mean
# #k = 2 + 0.05;                   # kappa - rate of mean reversion
# theta = 0.01
# k=2
# X = 100;                 # K equivalent - strike price
# tau = 30;                 # T equivalent - Time to expiration in years
# rho = -0.7;            # correlation between Wiener processes
# N=5000
