## App Deployment Pipeline Rational:

### If you:
- Use Github as version control system
- Do NOT want to pay 
- Can endure a few lines of shell scripts with or without understanding the meaning
this tutorial (there is one moment of using command line) may work for you. 


### Pros of Using Application deployment pipeline developed by Hutch Scientific Computing:
- SciComp’s pipeline is more generic than Shinyapps.io can offer. As the later provides a streamlined deployment service with a cost. The former has capacity of hosting applications written in other languages as long as the application itself can be containerized. 
- Integration with data sources within Hutch campus. For example, the application can be connected to a campus based database system (Postgres, mysql, etc…) without exposing it to the entire internet. 
- There is a template repository (https://github.com/FredHutch/shiny-app-template) to help users to assemble your own shiny app
- Once the application is deployed, no manual deployment is required when new changes are made as the pipeline includes continuous integration/continuous delivery (CI/CD) feature. 
- Users can specify their own domain name ending with fredhutch.org
- User can specify if their app is only facing campus within the firewall or being exposed to the entire internet. Authorization feature can also be included upon request. 
- The last one is, all the features mentioned above are completely free to campus users. 


### Pros of Using Shinyapps.io to deploy Shiny Apps
- It streamlines with RStudio. 
- The free plan with **25 hours activity per month**. 
- The ‘standard’ plan including password protection costs **$99/month**.
- The ‘professional’ plan including password protection and costom domain/url costs **$299/month**.
- Deploying shiny apps on Shinyapps.io allows you to include multiple applications within a single GitHub repository, which is not available with SciComp’s pipeline. 
- Shinyapps.io also provides web analytics feature showing app activities. 
- The auto-deployment occurs within RStudio by clicking one while the SciComp’s pipeline auto-deployment occurs at pushing codebase changes to remote GitHub repo. 