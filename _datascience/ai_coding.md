---
title: Using AI for Code Development

---

Artificial Intelligence (AI) tools, especially large language models, are becoming powerful allies for software development. They can help accelerate coding tasks, suggest optimizations, generate test cases, and even assist with secure coding practices. But using AI to support code development — especially in environments handling sensitive patient and research data, or intellectual property — comes with important responsibilities.

This guidance is here to help you make the most of AI while protecting your work, your collaborators, the people whose data you work with, and your institution. Whether you are new to AI-assisted code development or already experimenting with it, we encourage you to learn more to ensure you choose secure, compliant tools, manage risks like open-source licensing, and keep sensitive information safe. 

As you explore how AI can help with coding, remember: AI is a tool, not a substitute for human judgment, security review, or careful coding. Following the principles in this guidance will help you take advantage of AI’s benefits without introducing new vulnerabilities or compliance risks into your projects.

>At Fred Hutch, support for choosing and using AI tools can be obtained by emailing [dataprotection@fredhutch.org](mailto:dataprotection@fredhutch.org).  We can connect you to our resources supporting AI Governance (for ethical and policy concerns) and IT’s ARB (for software implementations and security reviews).  

## Secure and Compliant AI Tool Selection

✅ **What to Do:**

- Choose enterprise-supported or locally hosted AI models rather than public, cloud-based tools that may store or log sensitive code or data.
- Request expert reviews from experts in security, technology, software and data protection on the appropriateness of the tools for your use case.
- Understand open-source licensing risks (e.g., GPL, MIT, Apache) when using AI-generated code. Some licenses, like GPL, may require releasing your own source code.
- Validate that AI-generated code does not introduce non-compliant licenses or expose your research intellectual property.

❌ **What NOT to Do:**

- Do not use public AI chatbots (e.g., free-tier ChatGPT, Bard) for generating code that touches sensitive data.
- Do not use AI-generated code without checking the licensing terms of the training data.
- Do not assume AI-generated code is secure—always conduct security reviews and ensure you understand what the code is doing prior to executing it.

🤖 **Examples of How AI Can Help:**

- Prompt AI to generate security-hardened code (e.g., “Write a secure API endpoint using OAuth2 authentication”).
- Ask AI to explain security vulnerabilities (e.g., “What are common security risks in Python Flask applications?”).
- Generate secure coding checklists for frameworks (e.g., “List the OWASP Top 10 security risks for web applications.”).

## Data, Code, and Credential Protection

✅ **What to Do:**

- Use synthetic data for coding and testing with a validated answer.
- Store credentials in environment variables or secrets management tools rather than hardcoding them.
- Use careful version control (e.g., Git commits) to track human vs. AI-generated contributions.
- Avoid uploading any sensitive research or patient data into AI tools that may expose or train on user input.
- Mask or anonymize any sensitive data when using AI for processing tasks.

❌ **What NOT to Do:**

- Do not copy full project repositories into AI tools for debugging.
- Do not allow AI-generated code to handle sensitive data without proper masking or privacy techniques.
- Do not skip human review of all AI-generated or modified code.
- Never input protected health information (PHI), personally identifiable information (PII), API keys, or credentials into unapproved AI tools.
- Do not run AI-generated queries against sensitive databases without human vetting.

🤖 **Examples of How AI Can Help:**

- Generate secure boilerplate code (e.g., “Create a Python script that connects to a database using environment variables.”).
- Create synthetic datasets for testing (e.g., “Generate a synthetic patient dataset.”).
- Suggest performance improvements to existing code.
- Generate unit test templates (e.g., “Create PyTest cases for this function.”).
- Explain testing best practices (e.g., “What are best practices for testing a machine learning pipeline?”).

