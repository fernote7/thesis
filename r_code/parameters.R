S = 100;                 # Spot price
X = 100;                 # K equivalent - strike price
v = 0.09;                # v0 equivalent - current variance of the underlying asset
k = 2;                   # kappa - rate of mean reversion
theta = 0.09;            # long term mean
sigma = 0.2;               # ksi equivalent - vol of vol
rho = -0.3;              # correlation between Wiener processes
r = 0.05;                # mu equivalent - risk-free rate of return
tau = 1.0;               # T equivalent - Time to expiration in years
N=1000;                     # Number of simulations
t = 0                    # initial value
dt <- 0.05
