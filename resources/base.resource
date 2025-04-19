*** Settings ***
Resource               global_keywords.resource
Resource               ../pages/home_agibank_blog.resource
Resource               ../steps/home_agibank_blog.resource


###LIBRARIES
Library                FakerLibrary  locale=pt_BR
Variables              qa.yaml
