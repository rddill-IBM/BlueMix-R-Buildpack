print("starting inference engine build")
r <- getOption("repos")
print("getOptions complete")
r["CRAN"] <- "http://cran.us.r-project.org"
print("CRAN set to http://cran.us.r-project.org")
options(repos=r)
print("options set to r[CRAN]")

print("installing Rook & essential packages")
install.packages("Rook", dependencies=T , clean=T)
install.packages("hash", dependencies=T , clean=T)
install.packages("gRain", dependencies=T , clean=T)
install.packages("gRbase", dependencies=T , clean=T)

print(Sys.getenv())
