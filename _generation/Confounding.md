Here we will discuss some issues regarding confounding and how to think about confounding. Confounding often involves a discussion on causality, so when thinking about confounding it is important to think about the pathways in which a potential confounder may influence the analysis. 

Let us assume that we are interested in the association between some variable X and Y. We have the following Directed Acyclic Graph  (a DAG). There is in addition some variable U, that we are worried may influence the analysis.

<img src="Dag1.PNG">

If we were running an analysis to get at the association between X and Y (the red arrow in the above DAG) we would need to adjust for U in our analysis. Why? Because if we did not, we could not be sure that the association that we are observing between X and Y is not being driven due to the bath from X to Y that goes through U. If though we had the following, where U only had an association with Y through X

<img src="Dag1_5.PNG">

We would not have to adjust for U because there is not path from X to Y that goes through U. But again, this is not something you can necessarily test for. To get at this information it is important to critically thing from the begining what variables to adjust for in an analysis. Now consider one final example:


<img src="Dag3.PNG" width="561.494" height="244">

We do not observe U, but we do observe Z. If we do not adjust for Z, we will get a bias estimate of the effect of X onto Y. However, if we do adjust for Z we would be able to get an unbiased estimate of the effect of X onto Y. Now consider the following, if U had an effect on X that was not through Z, would we be able to get an unbiased estimate of the effect of X on Y?

The answer is no.

## Simulation Examples

Now let us run some simulation experiments using R to highlight these confounding examples.

### Simulation Scenario 1

<img src="Dag1.PNG">

We have that the effect of X onto Y conditional on U is 1, the effect of
U onto X is 2, and the effect of U onto Y conditional on X is 2. We will
perform 1000 replications of this assuming we were studying this in 1000
independent observations.
``` r
    N<-1000
    niter<-1000

    betaY<-1 # effect of X onto Y conditional on U
    alphaX<-2 # effect of U onto X 
    alphaY<-2 # effect of U onto Y conditional on X
    set.seed(08121919)
    TheEst<-matrix(nrow=niter,ncol=2)
    for(i in 1:niter){
      U<-rnorm(N) # Generate U
      
      X<-alphaX*U+rnorm(N) #Generate X
      
      Y<-alphaY*U+betaY*X+rnorm(N) # Generate Y
    #Estimate the effect of X onto Y ignoring U
      E1<-coef(lm(Y~X))[2] 
    # Estimate the effect of X onto Y if we somehow observed U.    
      E2<-coef(lm(Y~X+U))[2] 
      TheEst[i,]<-c(E1,E2)
    }
``` 
And let us look at the results:
``` r
    mean(TheEst[,1])
``` 
    ## [1] 1.800665

We see that it is no where close to the effect 0. In fact, we could
potentially incorrectly assume that there is an effect of X onto Y. What
if we had observed U?
``` r
    mean(TheEst[,2])
``` 
    ## [1] 1.001666

Which is the expected result. It's much closer to 1.

### Simulation Scenario 2

<img src="Dag1_5.PNG">

Now let us consider the case where U does not have an effect on Y.
``` r
    betaY<-1
    alphaX<-2
    alphaY<-0
    set.seed(03151920)
    TheEst2<-matrix(nrow=niter,ncol=2)
    for(i in 1:niter){
      U<-rnorm(N)
      
      X<-alphaX*U+rnorm(N)
      
      Y<-alphaY*U+betaY*X+rnorm(N)
      
      E1<-coef(lm(Y~X))[2]
      E2<-coef(lm(Y~X+U))[2]
      TheEst2[i,]<-c(E1,E2)
    }
``` 
And let us look at the results:
``` r
    mean(TheEst2[,1])
``` 
    ## [1] 1.00121

We see that it is close to 1 as expected. It is no longer bias as U does
not have an effect on Y. If we look at the results if we had somehow
observed U, we see that it is pretty much the same.
``` r
    mean(TheEst2[,2])
``` 
    ## [1] 1.001913

They are not exactly the same as adding U will still add some noise and
some differences

### Simulation Scenario 3

<img src="Dag3.PNG">

Now let us consider when we have a variable Z that we do observe. U has
an effect on X only through this variable Z. The effect of X onto Y
conditional on U and Z is 1, the effect of U onto X conditional on Z is
0, the effect of Z onto X conditional on 3, the effect of Z onto Y
conditional on U and X is 1, and the effect of U onto Y conditional on X
and Z is 2. Finally, the effect of U onto Z is 2.
``` r
    set.seed(01291947)
    betaY<-1
    alphaX<-0
    alphaY<-2
    alphaZ<-2
    tauX<-3
    tauY<-1


    TheEst3<-matrix(nrow=niter,ncol=2)
    for(i in 1:niter){
      U<-rnorm(N)
      Z<-alphaZ*U+rnorm(N)
      X<-alphaX*U+tauX*Z+rnorm(N)
      
      Y<-alphaY*U+betaY*X+tauY*Z+rnorm(N)
      #If we do not adjust for Z
      E1<-coef(lm(Y~X))[2]
      #If we do adjust for Z
      E2<-coef(lm(Y~X+Z))[2]
      TheEst3[i,]<-c(E1,E2)
    }
    mean(TheEst3[,1])

    ## [1] 1.587053
``` 
We see that the estimate if we do not include Z is bias. If we include Z
however:
``` r
    mean(TheEst3[,2])
``` 
    ## [1] 1.000552


### Simulation Scenario 4

Finally, let us now assume that X is still correlated with U even
conditional on Z. Ie there is an effect of U onto X that does not go
through Z.
``` r
    set.seed(10301939)
    betaY<-1
    alphaX<-2
    alphaY<-2
    alphaZ<-2
    tauX<-3
    tauY<-1


    TheEst4<-matrix(nrow=niter,ncol=2)
    for(i in 1:niter){
      U<-rnorm(N)
      Z<-alphaZ*U+rnorm(N)
      X<-alphaX*U+tauX*Z+rnorm(N)
      
      Y<-alphaY*U+betaY*X+tauY*Z+rnorm(N)
      
      E1<-coef(lm(Y~X))[2]
      E2<-coef(lm(Y~X+Z))[2]
      TheEst4[i,]<-c(E1,E2)
    }
    mean(TheEst4[,1])
``` 
    ## [1] 1.473036

We see that this estimate of the effect of X onto Y is biased, as was
before. But now, what if we include Z?
``` r
    mean(TheEst4[,2])
``` 
    ## [1] 1.443087

We see that it is bias as U has an effect on X that is not through Z.

### Simulation Scenario 5

We encourage you to play around with similar simulations. What would
happen let's say if you set betaY=0? Would we maybe incorrectly assume
that X has an effect on Y if we did not adjust for U or Z?

Real Data example
-----------------

We will first consider an example using the mtcars package that is a
base dataset within R
``` r
    head(mtcars)
```
    ##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
    ## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    ## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    ## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

We are interested in the association between the horsepower and weight
within this dataset ("hp" and "wt" respectively). Now this is a
contrived example and we are going to assume that we know nothing about
cars (for the author-true). Looking at the relationship between these
two variables
<img src="carsplot-1.png">


And is there an association between these two variables?
``` r
    summary(lm(wt~hp,data=mtcars))
``` 
    ## 
    ## Call:
    ## lm(formula = wt ~ hp, data = mtcars)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -1.41757 -0.53122 -0.02038  0.42536  1.56455 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 1.838247   0.316520   5.808 2.39e-06 ***
    ## hp          0.009401   0.001960   4.796 4.15e-05 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.7483 on 30 degrees of freedom
    ## Multiple R-squared:  0.4339, Adjusted R-squared:  0.4151 
    ## F-statistic:    23 on 1 and 30 DF,  p-value: 4.146e-05

It appears that the horsepower of the car is highly associated with the
weight of the car. Now let us say we adjusted for the number of
cylinders the car has. Let's plot horsepower vs weight color coding by
the number of cylinders.
``` r
    thecols<-rep("black",nrow(mtcars))
    thecols[which(mtcars$cyl==8)]<-"red"
    thecols[which(mtcars$cyl==6)]<-"blue"
    plot(mtcars$hp,mtcars$wt,xlab="Horsepower",ylab="Weight",col=thecols)
``` 

<img src="carsplot2-1.png">


And if we now adjust for number of cylinders within our analysis:
``` r
    summary(lm(wt~hp+cyl,data=mtcars))
``` 
    ## 
    ## Call:
    ## lm(formula = wt ~ hp + cyl, data = mtcars)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -0.8446 -0.4442 -0.1562  0.3092  1.4262 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)   
    ## (Intercept) 0.5820880  0.4348124   1.339  0.19107   
    ## hp          0.0003422  0.0029772   0.115  0.90930   
    ## cyl         0.4177733  0.1142980   3.655  0.00101 **
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.6298 on 29 degrees of freedom
    ## Multiple R-squared:  0.6125, Adjusted R-squared:  0.5858 
    ## F-statistic: 22.92 on 2 and 29 DF,  p-value: 1.072e-06

We see that horsepower is no longer associated with the weight of the
car. Now again, this is a contrived example, but why is this happening?
Well, the number of cylinders is likely a confounder of weight and
horsepower. The more cylinders the car has likely the higher the
horsepower. Also the more cylinders the car has the larger the engine
and the greater the weight of the car. Now a mechanic or an engineer
would tell us that this is a no brainer, but if we are not knowledgeble
in the field, we may miss this. That's why when planning these analyses,
it is always important to discuss with people what are the important
variables or covariates that need to adjust for that may confound an
analysis. Because otherwise, you may deem something significant when it
can be explained away by adjusting for a confounder.
