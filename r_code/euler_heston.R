# From Haastrecht and Antoon Pelser ---------------------------------------
#
# Efficient, almost exact simulation ot the Heston stochastic volatility model
#
#
#

source("./r_code/parameters.R")

N=1000


hest <- c()

for(i in (X-15):(X+15)){
hest[i - (X-16)] <- NMOF::callHestoncf(S=S, X=i, tau = tau, r=r, q=0, v0=v, vT=theta, sigma=sigma, rho=rho, k=k)
}


hestoneuler <- function(S, X, r, v, theta, rho, k, sigma, t = 0, dt = NULL, tau = 1, N, sensibility = 15){

    set.seed(1)

    if(is.null(dt)){ dt <- (tau-t)/1000}

    ST <- NULL
    aux <- NULL
    sqrt_dt <- sqrt(dt)

    for(i in seq(t,tau,dt)){
        # browser()
        Zv <- rnorm(N)
        Zt <- rnorm(N)
        Zs <- rho * Zv + (sqrt(1 - (rho^2)) * Zt)

        # v[v <= 0] = 0

        aux <- v
        aux[v < 0] <- 0
        sqrt_aux <- sqrt(aux)
        S <- S * (1 + r * dt + sqrt_aux * Zs * sqrt_dt)
        S[S <= 0] = 0

        v <- v + k * dt * (theta - aux) + sigma * sqrt_aux * Zv * sqrt_dt


        ST <- rbind(ST,S)
    }

    rm(aux, v, Zv, Zt, Zs, S)

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

e=hestoneuler(S=S, X=X, r=r,
              v = v, theta = theta, rho = rho, k = k, t=0,
              sigma = sigma, tau=tau,N=N)


plot(e$sensib)
lines(hest)







# require(microbenchmark)
# microbenchmark::microbenchmark(hestoneuler(S=S, X=X, r=r,
#                                            v = v, theta = theta, rho = rho, k = k,
#                                            sigma = sigma, t=0,
#                                            dt = dt, tau=tau,N=100),
#                                hestoneuler2(S=S, X=X, r=r,
#                                             v = v, theta = theta, rho = rho, k = k,
#                                             sigma = sigma, t=0,
#                                             dt = dt, tau=tau,N=100), times = 10)



# hestonlogeuler <- function(S, X, r, v, theta, rho, k, sigma, t = 0, dt = NULL, tau = 1, N, sensibility = 15){
#
#      # set.seed(1)
#
#     if(is.null(dt)){ dt <- (tau-t)/1000}
#
#     v <- rep(v,N)
#     theta<- rep(theta,N)
#     graf <- NULL
#     S <- log(S)
#
#
#
#
#     for(i in seq(t,tau,dt)){
#          # browser()
#         Zv <- rnorm(N)
#         Zt <- rnorm(N)
#         Zs <- rho * Zv + sqrt(1 - (rho^2)) * Zt
#
#         S <- S + (r - 1/2 * v) * dt + sqrt(pmax(v,0)) * Zs * sqrt(dt)
#         S[S <= 0] = 0
#
#         v <- v + k * dt * (theta - pmax(v, 0)) + sigma * sqrt(pmax(v, 0)) * Zv * sqrt(dt)
#
#         graf <- rbind(graf,S)
#     }
#
#     graf <- as.matrix(graf, ncol=N)
#     ST <- exp(graf)
#     # matplot(graf, type = 'l')
#     media <- c()
#
#     for (j in (X-sensibility):(X+sensibility)){
#
#         Result <- exp(ST[nrow(ST),]) - j
#         Result[Result <= 0] <- 0
#         media <-c(media, mean(Result))
#
#     }
#
#     media <- media * exp(-r*tau)
#
#
#
#
#
#     Result = exp(ST[nrow(ST),]) - X
#     Result[Result <= 0] = 0
#     call = exp(-r*tau)*mean(Result)
#
#     lista = list('call' = call, 'Result' = Result, 'Spot' = graf, 'sensib' = media)
#     return(lista)
# }
#
# b=hestonlogeuler(S=S, X=X, r=r,
#                   v = v, theta = theta, rho = rho, k = k, sigma = sigma, t=0,
#                   dt = dt, tau=tau,N=N)
# # lines(b$sensib)
