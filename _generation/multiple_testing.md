# Multiple testing
This page provides information on the Family Wise Error Rate (FWER) and the False Discovery Rate (FDR). We provide information on a few commonly used approaches for correcting for multiple testing as well. This is not an exhaustive list, as there is still ongoing research on how to adjust for multiple testing.

## Hypothetical Study
For the sake of having an example on hand, let's draw up a hypothetical study. Imagine we have observed gene expression for 1000 independent transcripts in 500 study participants. We are interested in testing if there is any association between any of those 1000 transcripts and reading this wiki page. For each of the 500 people, we have an indicator (1 or 0) for whether they have read the wiki page you are reading right now. For each gene we are testing the following hypothesis:

> H<sub>0j</sub>: The gene expression at transcript j is not associated with having read this wiki.
>
> H<sub>1j</sub>: The gene expression at transcript j is associated with having read this wiki.

H<sub>0j</sub> is the NULL hypothesis for transcript j and H<sub>1j</sub> is the alternative. For each test we have a p-value which we use as evidence against H<sub>0j</sub>. 


## Some definitions
Before continuing, it is useful to define some statistical terms. 
>Type I error: Probability that we incorrectly  reject H<sub>0j</sub>

This mean we observe a p-value that would lead us to reject the NULL hypothesis and give us evidence to __suggest__ the alternative. Often, we want to control the Type I error at some pre-specified level &alpha;. For example, 0.05 is often used. With this threshold, if the p-value is less than 0.05, we reject the NULL hypothesis. The value of 0.05 is arbitrary and a significance cutoff should be decided prior to running any analyses and should be based on prevalent thought within the field. 

>FWER: Family Wise Error Rate: The Probability of making at least one Type I error
>
>FDR: False Discovery Rate: Rate of tests that come back as significant that are actually false. 

## Now run the study

Now let us run this hypothetical study and see what happens. We provide code below to run, if you would like to follow along in R. We generate the gene expression data (Y) and the exposure information (X) of whether they have read this wiki page. We're going to use as our significance threshold 0.05. Thus if the p-value is less than 0.05, we are going to reject the NULL hypothesis that there is no association between gene expression at that gene and reading this wiki page. 

``` r
set.seed(20190101)

N<-500 #the sample size 
M<-1000 #number of "genes" we are testing
X<-rbinom(N,1,0.2) # Variable of interest
Y<-replicate(M,rnorm(N)) # The observed gene expression
TestIt<-matrix(nrow=M,ncol=4)
for(i in 1:M){
  R1<-summary(lm(Y[,i]~X))
  TestIt[i,]<-coef(R1)[2,]
}
```

If we look at the p-values (which are the fourth column of the R matrix TestIt above), we can count how many NULL hypothesis we would reject. 
``` r
sum(TestIt[,4]<0.05)
```

    ## [1] 58

We can see that we improperly reject 58 tests solely by chance. This is not ideal. The reason for this is that when we are under the NULL and we are using a well-behaving test, the p-values follow something called a continuous uniform distribution from 0 to 1. Under this distribution, the probability that one p-value is less than 0.05 is 0.05, which is fine if we are only performing one test. However, when we are performing 1000 tests, the probability that *at least one of those p-values is less than 0.05* is approximately 1. IE our FWER under this case is going to be 1. 

## Correcting for Multiple testing
We now get into the details of how to correct for multiple testing. There are two ways one can go about doing this, control the FWER or the FDR. Which one is used, should be decided prior to the analysis. 

Consider the following table for our example (borrowed from Wikipedia).

|               |       H<sub>0j</sub> is true     | H<sub>1j</sub> is True  | Total |
| ------------- |:-------------:| -----:|-----:|
| Test is declared significant          | V      | S    | V+S|
| Test is not declared significant      | U      |   T  |U+T |
| Totals                                | V+U    |  S+T |1000|




## Family Wise Error Rate: FWER

Remember, the FWER is the probability that we perform at least one type I error in our analysis. This is the probability that the cell V is greater than or equal to 1 (i.e., the test is declared significant  but  H<sub>0j</sub> is true). When a study says they are controlling  the FWER at some level &alpha;, what that means is that:

>P(V&ge;1)&le;&alpha;

Let us say that we originally decided to say the test is significant if the p-value is less than 0.05. In that situation:

>P(V&ge;1)&ge;0.05

Therefore, our FWER is not controlled at the rate of 0.05. We actually have more than a 5% chance of making a Type I error, which is not we want. If all 1000 tests are truly null, the probability of making at least one error is equal to 1-(1-0.05)^1000 or approximately 1. 

Below we give two different approaches to control for the FWER. This is by no means exhaustive and there are other approaches out there. All two are implemented in the R function p.adjust. 

### Bonferroni

The most widely used approach. A test is declared significance if the corresponding p-value is less than &alpha; divided by the number of tests. In our example, we would use 0.05/1000 as opposed to 0.05. Here would have:

>P(V&ge;1)=P(Any of the tests where H<sub>0j</sub> is true come back significant)&le;(V+U)0.05/1000&le;(V+U)0.05/(V+U)=0.05

Therefore we have that the P(V&ge;1)&le; 0.05, the desired result.

### Holm procedure

The Holm correction is a stepwise procedure, where the significance threshold changes as you reject tests. 

1. Look smallest p-value. If less than &alpha;/#tests reject the respective H<sub>0j</sub>.
2. Look at next smallest p-value. If this p-value is less than &alpha;/(#tests-1) reject H<sub>0j</sub>.
3. Continue looking at successively larger p-values in the same manner until you can no longer reject.


### Implementation
Let us implement these in our example and see how they do. First the Bonferroni correction. The function p.adjust gives back a corrected p-value. 


``` r
BonPval<-p.adjust(TestIt[,4],method = "bonferroni")
sum(BonPval<0.05)
```

    ## [1] 0

So we now no longer reject any tests. Next we do the Holm procedure:
``` r
HolmPval<-p.adjust(TestIt[,4],method="holm")
sum(HolmPval<0.05)
```

    ## [1] 0
And we get the same result.

## False Discovery Rate: FDR

The False Discovery Rate is a newer correction approach developed by Benjamini and Hochberg in the 1990's. The goal of the FDR is to identify as many significant tests while controlling the number of false positives identified. This means we want to keep V/(V+S) from the above table below a certain proportion. The FDR in general is a less conservative approach to multiple testing than the FWER (though they are controlling separate things).  In general, if something is significant via the FWER at a level &alpha;, it will be significant at the FDR level &alpha; as well.

Below we give a few approaches, but again these are by no means conclusive. This is still an ongoing area of research in general.

### Benjamini and Hochberg

If we are controlling at the level &alpha;, we order the p-values and find the k<sup>th</sup> ordered p-value such that it is less than &alpha; times k/m. This method is implemented within the p.adjust function in R.

### q-value

A popular approach in bioinformatics, the q-value is a Bayesian approach to the FDR developed by John Storey. It is implemented in the Bioconductor R package q-value. 

### Implementation of these FDR methods

``` r
BHPval<-p.adjust(TestIt[,4],method="BH")
sum(BHPval<0.05)
```

    ## [1] 0

And now qvalue

``` r
library(qvalue)
TheQval<-qvalue(TestIt[,4])$qv
sum(TheQval<0.05)
```

    ## [1] 0

Similar to when we corrected for the FWER we no longer reject any tests.

## Another Example of the FWER

Now let us run some examples to see what happens when we run this study over and over again to get an estimate of what the FWER is under these scenarios. This will tell us how well these testing procedures are really doing.

``` r
Numstudies<-5000 # Number of studies
```

Define a function to use that will do our analyses a little quicker so we do not have to call lm.

``` r
fastReg.func<-function(A,nY){
  XX<-cbind(1,A)
  EY<-solve(t(XX)%*%XX)%*%t(XX)%*%nY
  residY<-nY-XX%*%EY
  SigEst<-colSums(residY^2)/(length(A)-ncol(XX))
  VarEst<-SigEst*solve(t(XX)%*%XX)[2,2]
  Pval.A.to.Y<-2*pt(abs(EY[2,]/sqrt(VarEst)),df=length(A)-ncol(XX),lower.tail=F)
  return(cbind(EY[2,],Pval.A.to.Y))
}
```

And run the simulation

``` r
set.seed(44511)
EachStudy<-matrix(nrow=Numstudies,ncol=4)
for(k in 1:Numstudies){
  X<-rbinom(N,1,0.2) # Variable of interest
  Y<-replicate(M,rnorm(N)) 
  AA<-fastReg.func(X,Y)
  EachStudy[k,1]<-sum(AA[,2]<0.05)
  B1<-p.adjust(AA[,2],"bonferroni")
  EachStudy[k,2]<-sum(B1<0.05)
  H1<-p.adjust(AA[,2],"holm")
  EachStudy[k,3]<-sum(H1<0.05)
  BH1<-p.adjust(AA[,2],"BH")
  EachStudy[k,4]<-sum(BH1<0.05)
}
```
In the above, we are saving from each study of 1000 genes four things. 
1) How many uncorrected p-values are less than 0.05 (first column of the matrix EachStudy). 
2) How many Bonferroni corrected p-values are less than 0.05 (second column of EachStudy). This is equivalent to how many uncorrected p-values are less than 0.05/1000.
3) How many Holm adjusted p-values are less than 0.05 (third column of EachStudy).
4) How many Benjamini Hochberg corrected p-values are less than 0.05 (fourth column of EachStudy). This is controlling the FDR. 

We can now look at what the FWER is if we didn't perform any correction at all by taking the mean of how many of these 5000 studies resulted in at least one p-value less than 0.05. 

```r
mean(EachStudy[,1]>0)
```

    ## [1] 1

It is 1 as we expected. Next we can look at how the Bonferroni and Holm corrected approach do by mean of how many of these 5000 studies resulted in at least one p-value less than 0.05. 

``` r
mean(EachStudy[,2]>0)
```

    ## [1] 0.0488

``` r
mean(EachStudy[,3]>0)
```

    ## [1] 0.0488

We see that it is less than 0.05 (but still close) which is the desired result. Finally, we look at the FDR and we see a similar result (though now we are controlling the FDR). 
``` r
mean(EachStudy[,4]>0)
```

    ## [1] 0.05
