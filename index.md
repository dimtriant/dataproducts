---
title       : Average MPG Calculator
subtitle    : Find the average MPG for a specific number of cylinders
author      : dimtriant
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap, quiz, shiny, interactive]            # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

This application can be used to determine the average MPG for a certain number of cylinders. It is based on the mtcars database and has the following fetaures:

1. Widget to select the number of cylinders
2. Display of the selected number of cylinders for verification
3. Display of the count of samples with the selected number of cylinders that is contained in the mtcars database
4. Display of the average MPG for the given number of cylinders
5. Display of the car with the highest MPG given the selected number of cylinders
6. Histogram of the max MPG car compared to the population of cars


**You can access the application here:**
http://dimtriant.shinyapps.io/project1

---

## Usage & Results

The application was created using Shiny. The code is split into a ui.R and a server.R. The ui.R contains the code required for the front end of the application. When launching the application, you will be able to use a slider like the one below to select the number of cylinders.
<img src='slider.jpg' />

According to the number of cylinders you select you will get the results in a format like below:
<img src='results.jpg' />

---

## Histogram

Additionally, you will see the following histogram. This displays the distribution of MPGs in the mtcars sample and the red line is the MPG of the best car for the number of cylinders selected.
![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1.png) 

---

## ui.R Code

A portion of the code contained in ui.R is displayed below for your reference:

```r
library(shiny)

shinyUI(navbarPage("Menu",
  tabPanel("Application",
    pageWithSidebar(
    headerPanel("Average MPG for Cylinders"),
    sidebarPanel(
      sliderInput('cylinders', 'Select Number of Cylinders' , 
                  6, min = 4, max = 8, step = 2)),
    mainPanel(
      h3('Results'),
      h4('Cylinders you selected'),
      verbatimTextOutput("inputValue"),
      h4('Sample Size'),
      verbatimTextOutput("count"),
      h4('Average MPG')
```
---
