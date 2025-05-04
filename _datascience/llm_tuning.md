---
title: LLM Tuning and Training in Healthcare and Research

---


Large Language Models (LLMs) can provide powerful tools for data science, research, and healthcare applications, enabling tasks like automated summarization, predictive modeling, and more efficient knowledge extraction. However, the sensitive nature of clinical and biomedical research data requires careful risk management when tuning, training, and deploying these models. 


This document provides introductory guidance — not an exhaustive review or a policy — to help you navigate data security, regulatory compliance, and ethical risks when working with LLMs.  As AI tools and LLMs evolve, we will periodically edit and update this guidance in response to policies, available tools and models, and guidance and implementation details as they become available.  



 

**Important**

- This guidance does not imply explicit recommendation or approval of a process, tool or project.  Compliance with current Fred Hutch or your institution's policies and processes remains your responsibility.   

- If you aren’t sure whether the LLM or AI tool you’re working with will learn from or retain your data or if there might be a risk of disclosing sensitive data, or using intellectual property without permission, find support at your institution from the appropriate departments or experts.    

> At Fred Hutch you can contact [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org) to find support for current policies, best practices and resources related to this content.  

 

## Data Privacy and Security 

### Guidance

- Use institutionally approved, secure computing environments for working with LLMs and sensitive data.  

- Ensure that you are complying with all data and software licenses and applicable regulatory obligations applicable to the datasets you plan to input into an LLM. (e.g., HIPAA, GDPR, institutional policies). 

- Review any Data Use Agreements (DUAs) or Terms of Use associated with datasets (e.g., TCGA, dbGaP, UK Biobank) you intend to use to idnetify if there are any implications for use with an LLM.  

- Check if your use case requires disclosure of LLM usage or if specific datasets prohibit AI-based analysis or result generation such as for some clinical trials or grants.  

- Minimize sensitive data exposure: mask, subset, randomize, anonymize, or de-identify input data before model use. Always identify and use the minimum data required for a process (e.g., if identifiers or unnecessary data are not part of the training or fine-tuning simply remove or code them prior to execution to reduce risk). 


 

### What NOT to Do

- Do not assume that open-source (e.g., Llama3), publicly available tools (e.g., ChatGPT) or enterprise-grade LLMs (e.g., Claude) automatically comply with regulatory standards—always verify their data handling policies with support from dataprotection@fredhutch.org. 

- Do NOT use public, consumer-facing tools or LLM APIs like OpenAI’s free-tier ChatGPT, Gemini, or Claude for healthcare or sensitive data research tasks or decision making. This would be data that is classified as Confidential per the Data Classification Policy and presents an ethical risk as well as a data security risk.  

- Do NOT assume that removing direct identifiers (e.g., patient names) is enough—some models can re-identify individuals based on indirect features (e.g., rare conditions). Understand that information saved in certain file formats (i.e. audio, video and images) cannot be deidentified using presently available methods. 

- Do NOT allow real-time model fine-tuning on user inputs without security audits.  

- Do not use LLMs to fabricate experimental results or manipulate research data without clear documentation of the use of LLMs and purpose.   

 

 
 

## Performance, Ethics and Bias Mitigation 

 

### Guidance

- Choose LLMs with clear, research-friendly licenses (e.g., Apache 2.0, MIT) aligned with your institutional IP policies. 

- Keep thorough records of training data sources, fine-tuning processes, and model changes using version-controlled repositories to track model iterations and ensure auditability. 

- Create a model card for each LLM deployment which is a document that provides essential information about a machine learning or AI model, including its purpose, performance, limitations, and ethical considerations (learn more from (IAPP)[https://iapp.org/news/a/5-things-to-know-about-ai-model-cards]). 

- Use diverse, representative datasets for tuning and training to minimize demographic and historical bias.  Even language models trained on large datasets are not necessarily free from demographic, historical, algorithmic or geographic biases among others. 

- Always validate outputs with human experts before deploying models for any purpose.  Create feedback processes and tests of model performance that can be regularly deployed to monitor your model over time so you can identify and respond to emerging biases or shifts in performance or validity. 

 

### What NOT to Do

- Do NOT assume that all open-source models are free from IP risks—some may be trained on scraped, copyrighted biomedical literature. 

- Do NOT fine-tune an LLM on proprietary research data without confirming IP ownership rights, reviewing licensing terms and securing necessary approvals. 

- Do NOT mix datasets with unknown or undocumented licensing origins when training an LLM—always check metadata and source documentation. 

- Do NOT release an LLM without documentation on their training process, potential sources of bias, evaluation metrics and data sources. 

- Do not deploy models without measuring fairness across participant populations, particularly in clinical decision-support applications. 

- Do not assume LLMs always generate accurate medical or scientific information—hallucinations and misinterpretations are common. 

- Do not use LLMs for clinical diagnosis, medical decision-making, or regulatory documentation. 
