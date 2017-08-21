source("./r_code/parameters.R")
N=1
hest <- c()
for(i in (X-15):(X+15)){
    hest[i - (X-16)] <- NMOF::callHestoncf(S=S, X=i, tau = tau, r=r, q=0, v0=v, vT=theta, sigma=sigma, rho=rho, k=k)
}




hestonea <- function(S, X, r, v, theta, rho, k, sigma, t = 0, dt = NULL, tau = 1, N, sensibility = 15){

    if(is.null(dt)){ dt <- (tau-t)/1000}

    ST <- NULL

    d <- (4 * k * theta)/(sigma)^2
    c0 <- (sigma^2 * (1 - exp(-k*dt)))/(4*k)

    # browser()

    for(i in seq(t,tau,dt)){

        # sampling V
        lambda <- (4*k*exp(-k*dt)*v)/(sigma^2 * (1-exp(-k*dt)))
        vt <- c0 * rchisq(n = N, df = d, ncp = lambda)

        # Sampling int{V}
        int_v <- dt * ((1/2) * v + (1/2) * vt)


        gamma <- function(a){sqrt(k^2 + 2 * sigma^2 * -1i*a)}
        

        phi <- function(a){(Re(gamma(a)) * exp(-(Re(gamma(a)) - k)/2 * dt) * (1 - exp(-k * dt)))/
                 (k * (1- exp(- Re(gamma(a)) * dt))) *
                 exp((v+vt)/(sigma^2) * ((k * 1 + exp(-k*dt))/(1-exp(-k*dt))-
                                        (Re(gamma(a)) * (1 + exp(- Re(gamma(a)) * dt)))/(1-exp(- Re(gamma_a) *
                                                                                                 dt)))) *
                 (besselI( x = ((4 * Re(gamma(a)) * sqrt(v*vt))/(sigma^2) * (exp(- Re(gamma(a)) * dt/2))/
                                    (1 - exp(- Re(gamma(a)) * dt))), nu = 0.5*d - 1) /
                      (besselI(x = ((4 * k * sqrt(v*vt))/(sigma^2) * (exp(-k*dt/2))/(1-exp(-k*dt))),
                               nu = 0.5*d - 1)))
                }
        
          f <- function(u){sin(u*x)/u * Re(v_esp)}
          F_x <- 1/pi * integrate(f, lower = -Inf, upper = Inf)$value

        

        teste <- c()
        for(i in seq(0,10000,0.1)){
        xx=i
        f <- function(u, x = xx){sin(u*x)/u * Re(v_esp)}

        F_x <- function(){
            a <- 2/pi * integrate(f, lower = 0, upper = Inf)$value
            return(a)
        }
        teste <- c(teste,F_x())
        }
        sum(teste)


        # Sampling int{v}dw
        int_vdw <- (1/sigma) * (vt - v - k * theta * dt + k  * int_v)

        # Sampling S
        m <- log(S) + (r * dt - (1/2) * int_v + rho * int_vdw)
        std <- sqrt((1 - rho^2)) * sqrt(int_v)
        S <- exp(m + std * rnorm(N))
        v <- vt
        ST <- rbind(ST,S)
    }

    ST <- as.matrix(ST, ncol=N)
    # matplot(graf, type = 'l')
    # abline(h=X, lwd=2, col='red')
    media <- c()

    for (j in (X-sensibility):(X+sensibility)){

        Result <- ST[nrow(ST),] - j
        Result[Result <= 0] <- 0
        media <-c(media, mean(Result))

    }

    media <- media * exp(-r*tau)
    # plot(media, ylab = "Call price", xlab = "Strike price")


    Result <- ST[nrow(ST),] - X
    Result[Result <= 0] = 0
    call = mean(exp(-r*tau)*Result)

    lista = list('call' = call, 'Result' = Result, 'Spot' = ST, 'sensib' = media)
    return(lista)
}


hestonea(S=S, X=X, r=r, v = v, theta = theta, rho = rho, k = k, t=0,
         sigma = sigma, tau=tau,N=N)$call


# # Sampling m, sigma2 and S
#
# m <- log(S) + (r * dt - (1/2) * int_v + rho * int_vdw)
#
# std <- sqrt((1 - rho^2)) * sqrt(int_v)
#
# S <- exp(m + std * rnorm(N))
