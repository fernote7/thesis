# From Haastrecht and Antoon Pelser ---------------------------------------
#
# Efficient, almost exact simulation ot the Heston stochastic volatility model
#
#
#

source("./r_code/parameters.R")

Hestoncallkj <- function(S, X, r, q, v, theta, rho, k, sigma, t = 0, dt = NULL, tau = 1, N, sensibility = 15){

    if(is.null(dt)){ dt <- (T-t)/1000}

    v <- rep(v,N)
    theta<- rep(theta,N)
    graf <- NULL
    S <- log(S)


    for(i in seq(t,tau,dt)){
     # browser()
    Zv <- rnorm(N)
    Zt <- rnorm(N)
    Zs <- rho * Zv + sqrt(1 - rho^2) * Zt


    vt <- (v + k * theta * dt + sigma * sqrt(v) * Zv * sqrt(dt) +
              (1/4) * sigma^2 * dt * ((Zv)^2 - 1))/(1 + k * dt)

    # print(vt)

    # if(!length(vt[vt <= 0]) == 0 & length(vt[vt <= 0]) >= 1){
    #     # browser()
    vt[vt <= 0] <- v[vt <= 0] + k * dt * (theta[vt <= 0] - pmax(v[vt <= 0],0)) +
                   sigma * sqrt(pmax(v[vt <= 0],0)) * Zv[vt <= 0] * sqrt(dt)
    v <- vt
    v[v<=0] <- 0

    # }

    S <- S + (r - (v+vt)/4) * dt + rho * sqrt(pmax(v,0)) * Zv * sqrt(dt) +
         (1/2) * (sqrt(pmax(v,0)) + sqrt(pmax(vt,0))) * (Zs + rho * Zv) * sqrt(dt) +
         ((rho * sigma * dt)/2) * ((Zv)^2 - 1)

    S[S <= 0] = 0
    graf <- rbind(graf,S)


    }

     # browser()

    graf <- as.matrix(graf, ncol=N)
    ST <- graf
    # matplot(graf, type = 'l')
    # abline(h=log(X), lwd=2, col='red')

    media <- c()

    # browser()

    for (j in (X-sensibility):(X+sensibility)){

        Result <- exp(ST[nrow(ST),]) - j
        Result[Result <= 0] <- 0
        media <-c(media, mean(Result))

    }

    media <- media * exp(-r*tau)


    # browser()


    Result <- exp(ST[nrow(ST),]) - X
    Result[Result <= 0] = 0
    call = mean(exp(-r*tau)*Result)

    lista = list('call' = call, 'Result' = Result, 'Spot' = graf, 'sensib' = media)
    return(lista)

}

b = Hestoncallkj(S=S, X=X, r=r, v=v, theta=theta, rho=rho, k=k, sigma=sigma, dt=dt, tau = tau, N=N)
