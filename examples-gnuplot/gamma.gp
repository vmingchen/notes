##############################################
# Shows gamma distribution
# 
# Original Name: gamma.gnuplot
# Context: Sigmetrics paper file server figure
# Source: http://en.wikipedia.org/wiki/File:Gamma_distribution_pdf.svg
#
##############################################

_ln_dgamma(x, a, b) = a*log(b) - lgamma(a) + (a-1)*log(x) - b*x
dgamma(x, shape, rate) = (x<0)? 0 :	(x==0)? ((shape<1)? 1/0 : (shape==1)? rate : 0) :  (rate==0)? 0 : exp(_ln_dgamma(x, shape, rate))
pgamma(x, shape, rate) = (x<0)? 0 : igamma(shape, x*rate)

set samples 1001
set terminal postscript eps noenhanced color 
set output "gamma.eps"
set border 3

set xtics 0,2
set ytics 0,0.1
set mxtics 10
set mytics 10

f(x, k, t) = dgamma(x, k, 1.0/t)
set key top right Left reverse

#f(x, k, t) = pgamma(x, k, 1.0/t)
#set key bottom right

plot [0:20] \
    f(x,1,2.0) title "k = 1, θ = 2.0", \
    f(x,2,2.0) title "k = 2, θ = 2.0", \
    f(x,3,2.0) title "k = 3, θ = 2.0", \
    f(x,5,1.0) title "k = 5, θ = 1.0", \
    f(x,4,0.25) title "k = 4, θ = 0.25", \
    f(x,9,0.5) title "k = 9, θ = 0.5" lt 7
