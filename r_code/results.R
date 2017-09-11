

cfhest = c(14.176)
cfhsens=c(23.023,22.345,21.679,21.025,20.384,19.755,19.140,18.537,17.946,17.369,16.805,
16.253,15.715,15.189,14.676,14.176,13.689,13.214,12.752,12.302,11.864,11.438,
11.025,10.623,10.233,9.854,9.487,9.131,8.786,8.452,8.128)

euler = c(14.97, 14.14, 14.25)
kj = c(13.05, 13.86, 13.83)
ea = c(14.74, 14.38, 14.16)

aa <- data.frame(Method = c("euler", "Kahl", "EA", "mod EA"), "N=1000" = , "N=10000" = , "N=100000" = , row.names = NULL)
print(knitr::kable(aa))
