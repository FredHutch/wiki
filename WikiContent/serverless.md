# Serverless Function

Serverless computing doesn't mean there is no server, but users do not need to provision, scale, and manage any servers. The servers are usually handled by cloud providers. You can also run such application on premise. 

> Why serverless is mentioned here?
Nowdays, we hear IaaS (Infrastructure as a service), PaaS (Platform as a service) and SaaS (Software as a service). 
- IaaS: The responsibility of configure, administrate and management of resources is on the users
- PaaS: Users do not need to manage OS
- SaaS: Users only need to use the service.

Serverless falls into the category between PaaS and SaaS, another name for it is FaaS (Function as service). 

## Advantages and Disadvantages

### Advantages:
    - Users do not need to manage servers
    - The cost is based on the usage
    - Highly available, with high concurrent rate
    - Highly scalable 
### Disadvantages:
    - limitation on resources based on the framework 
    - debugging could be less straightforward

## Some serverless frameworks

- [AWS Lambda function](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [Nuclio](https://nuclio.io)
- [OpenFaas](https://www.openfaas.com)
- [Azure Serverless Computing](https://azure.microsoft.com/en-us/overview/serverless-computing/)
- [Google Cloud Functions](https://cloud.google.com/functions/)

## How to use (documentations)

Severless functions tend to be triggered by event. For example, AWS lambda function can be triggered by a few events from other services. [This link](https://docs.aws.amazon.com/lambda/latest/dg/with-s3-example.html) shows step-by-stey demo of using AWS Lambda with Amazon S3. 

## Use cases:

- Machine Learning
- Batch Jobs
- Data transformation
- HTTP APIs/integration

### Available Resources and links
- https://www.logicworks.com/blog/2018/02/kubernetes-vs-aws-ecs-vs-docker-swarm-vs-serverless/
- https://serverless.com/blog/why-we-switched-from-docker-to-serverless/
https://stxnext.com/blog/2017/12/06/serverless-computing-explained-comparing-features-and-pricing-saas-iaas-paas/
- https://www.martinfowler.com/articles/serverless.html
- https://youtu.be/C3agSKv2s_w?list=PLlIapFDp305AiwA17mUNtgi5-u23eHm5j
- https://redshiftsupport.matillion.com/customer/en/portal/articles/2243961-triggering-etl-from-an-s3-event-via-aws-lambda
