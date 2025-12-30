---
title: Using AI in Biomedical Research
primary_reviewers: vortexing
---

Artificial Intelligence (AI) tools — particularly large language models (LLMs) — are increasingly being used by biomedical researchers to write and debug code, analyze data, generate documentation, and support model development. These tools can accelerate routine tasks, lower technical barriers, and help researchers focus more time on scientific questions rather than implementation details. 

At the same time, AI tools introduce new risks and responsibilities, especially in biomedical research settings where data may include protected health information (PHI), sensitive human subjects data, proprietary methods, or intellectual property. How an AI tool is hosted, what data it retains, what it learns from user input, and how generated outputs are licensed can all have implications for data privacy, security, compliance, and research integrity.

This page is meant to provide some basic researcher-oriented guidance on how to use AI safely and responsibly — whether you are using AI to assist with coding, experimenting with model tuning, or training an LLM on research data. The goal is not to limit innovation, but to help you understand what is allowed, what requires extra care, and when to seek support, so you can confidently and ethically incorporate AI into your research workflows.

## Using AI for Coding
Artificial Intelligence (AI) tools, especially large language models, are becoming powerful allies for software development. They can help accelerate coding tasks, suggest optimizations, generate test cases, and even assist with secure coding practices. But using AI to support code development — especially in environments handling sensitive patient and research data, or intellectual property — comes with important responsibilities.

This guidance is here to help you make the most of AI while protecting your work, your collaborators, the people whose data you work with, and your institution. Whether you are new to AI-assisted code development or already experimenting with it, we encourage you to learn more to ensure you choose secure, compliant tools, manage risks like open-source licensing, and keep sensitive information safe. 

As you explore how AI can help with coding, remember: AI is a tool, not a substitute for human judgment, security review, or careful coding. Following the principles in this guidance will help you take advantage of AI’s benefits without introducing new vulnerabilities or compliance risks into your projects.

>At Fred Hutch, support for choosing and using AI tools can be obtained by emailing [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org).  We can connect you to our resources supporting AI Governance (for ethical and policy concerns) and IT’s ARB (for software implementations and security reviews).  

### Secure and Compliant AI Tool Selection

**What to Do:**

- Choose enterprise-supported or locally hosted AI models rather than public, cloud-based tools that may store or log sensitive code or data.
- Request expert reviews from experts in security, technology, software and data protection on the appropriateness of the tools for your use case.
- Understand open-source licensing risks (e.g., GPL, MIT, Apache) when using AI-generated code. Some licenses, like GPL, may require releasing your own source code.
- Validate that AI-generated code does not introduce non-compliant licenses or expose your research intellectual property.

**What NOT to Do:**

- Do not use public AI chatbots (e.g., free-tier ChatGPT, Bard) for generating code that touches sensitive data.
- Do not use AI-generated code without checking the licensing terms of the training data.
- Do not assume AI-generated code is secure—always conduct security reviews and ensure you understand what the code is doing prior to executing it.

**Examples of How AI Can Help:**

- Prompt AI to generate security-hardened code (e.g., “Write a secure API endpoint using OAuth2 authentication”).
- Ask AI to explain security vulnerabilities (e.g., “What are common security risks in Python Flask applications?”).
- Generate secure coding checklists for frameworks (e.g., “List the OWASP Top 10 security risks for web applications.”).

### Data, Code, and Credential Protection

**What to Do:**

- Use synthetic data for coding and testing with a validated answer.
- Store credentials in environment variables or secrets management tools rather than hardcoding them.
- Use careful version control (e.g., Git commits) to track human vs. AI-generated contributions.
- Avoid uploading any sensitive research or patient data into AI tools that may expose or train on user input.
- Mask or anonymize any sensitive data when using AI for processing tasks.

**What NOT to Do:**

- Do not copy full project repositories into AI tools for debugging.
- Do not allow AI-generated code to handle sensitive data without proper masking or privacy techniques.
- Do not skip human review of all AI-generated or modified code.
- Never input protected health information (PHI), personally identifiable information (PII), API keys, or credentials into unapproved AI tools.
- Do not run AI-generated queries against sensitive databases without human vetting.

**Examples of How AI Can Help:**

- Generate secure boilerplate code (e.g., “Create a Python script that connects to a database using environment variables.”).
- Create synthetic datasets for testing (e.g., “Generate a synthetic patient dataset.”).
- Suggest performance improvements to existing code.
- Generate unit test templates (e.g., “Create PyTest cases for this function.”).
- Explain testing best practices (e.g., “What are best practices for testing a machine learning pipeline?”).







## Training and Tuning LLMs

Large Language Models (LLMs) can provide powerful tools for data science, research, and healthcare applications, enabling tasks like automated summarization, predictive modeling, and more efficient knowledge extraction. However, the sensitive nature of clinical and biomedical research data requires careful risk management when tuning, training, and deploying these models. 


This document provides introductory guidance — not an exhaustive review or a policy — to help you navigate data security, regulatory compliance, and ethical risks when working with LLMs.  As AI tools and LLMs evolve, we will periodically edit and update this guidance in response to policies, available tools and models, and guidance and implementation details as they become available.  

**Important**

- This guidance does not imply explicit recommendation or approval of a process, tool or project.  Compliance with current Fred Hutch or your institution's policies and processes remains your responsibility.   

- If you aren’t sure whether the LLM or AI tool you’re working with will learn from or retain your data or if there might be a risk of disclosing sensitive data, or using intellectual property without permission, find support at your institution from the appropriate departments or experts.    

> At Fred Hutch you can contact [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org) to find support for current policies, best practices and resources related to this content.  

 

### Data Privacy and Security when using LLMs

**What TO Do**

- Use institutionally approved, secure computing environments for working with LLMs and sensitive data.  

- Ensure that you are complying with all data and software licenses and applicable regulatory obligations applicable to the datasets you plan to input into an LLM. (e.g., HIPAA, GDPR, institutional policies). 

- Review any Data Use Agreements (DUAs) or Terms of Use associated with datasets (e.g., TCGA, dbGaP, UK Biobank) you intend to use to idnetify if there are any implications for use with an LLM.  

- Check if your use case requires disclosure of LLM usage or if specific datasets prohibit AI-based analysis or result generation such as for some clinical trials or grants.  

- Minimize sensitive data exposure: mask, subset, randomize, anonymize, or de-identify input data before model use. Always identify and use the minimum data required for a process (e.g., if identifiers or unnecessary data are not part of the training or fine-tuning simply remove or code them prior to execution to reduce risk). 


 

**What NOT to Do**

- Do not assume that open-source (e.g., Llama3), publicly available tools (e.g., ChatGPT) or enterprise-grade LLMs (e.g., Claude) automatically comply with regulatory standards—always verify their data handling policies with support from your institution.  

- Do NOT use public, consumer-facing tools or LLM APIs like OpenAI’s free-tier ChatGPT, Gemini, or Claude for healthcare or sensitive data research tasks or decision making. This would be data that is classified as Confidential per the Data Classification Policy and presents an ethical risk as well as a data security risk.  

- Do NOT assume that removing direct identifiers (e.g., patient names) is enough—some models can re-identify individuals based on indirect features (e.g., rare conditions). Understand that information saved in certain file formats (i.e. audio, video and images) cannot be deidentified using presently available methods. 

- Do NOT allow real-time model fine-tuning on user inputs without security audits.  

- Do not use LLMs to fabricate experimental results or manipulate research data without clear documentation of the use of LLMs and purpose.   

 

 
 

### Performance, Ethics and Bias Mitigation 

**What TO Do**

- Choose LLMs with clear, research-friendly licenses (e.g., Apache 2.0, MIT) aligned with your institutional IP policies. 

- Keep thorough records of training data sources, fine-tuning processes, and model changes using version-controlled repositories to track model iterations and ensure auditability. 

- Create a model card for each LLM deployment which is a document that provides essential information about a machine learning or AI model, including its purpose, performance, limitations, and ethical considerations (learn more from the [IAPP](https://iapp.org/news/a/5-things-to-know-about-ai-model-cards) ). 

- Use diverse, representative datasets for tuning and training to minimize demographic and historical bias.  Even language models trained on large datasets are not necessarily free from demographic, historical, algorithmic or geographic biases among others. 

- Always validate outputs with human experts before deploying models for any purpose.  Create feedback processes and tests of model performance that can be regularly deployed to monitor your model over time so you can identify and respond to emerging biases or shifts in performance or validity. 

 

**What NOT to Do**

- Do NOT assume that all open-source models are free from IP risks—some may be trained on scraped, copyrighted biomedical literature. 

- Do NOT fine-tune an LLM on proprietary research data without confirming IP ownership rights, reviewing licensing terms and securing necessary approvals. 

- Do NOT mix datasets with unknown or undocumented licensing origins when training an LLM—always check metadata and source documentation. 

- Do NOT release an LLM without documentation on their training process, potential sources of bias, evaluation metrics and data sources. 

- Do not deploy models without measuring fairness across participant populations, particularly in clinical decision-support applications. 

- Do not assume LLMs always generate accurate medical or scientific information—hallucinations and misinterpretations are common. 

- Do not use LLMs for clinical diagnosis, medical decision-making, or regulatory documentation. 
