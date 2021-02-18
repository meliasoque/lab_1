# Report Guidelines 

In this lab you will be analyzing information regarding the 2020 United States General Election, which eventually placed the 46th President into office in the White House. In this lab, we will ask you to engage in professional data science reporting: your argument, presentation, data, and tests all need to be compelling for your report to be compelling. 

# Data 

Data for the lab should be drawn from the 2020 American National Election Studies (ANES). You can access this data at [https://electionstudies.org](https://electionstudies.org). This is the official site of the ANES, a project that has [been ongoing since](https://en.wikipedia.org/wiki/American_National_Election_Studies) 1948, and federally funded by the National Science Foundation since 1977. 

To access the data, you will need to register for an account, confirm this account, and then login. The data that you should come from the **2020 Time Series Study**. We're asking you to collect this data from source, because we don't want to take this important part of the process away from you. 

You will note that there are two forms of data that are avaiable, data that is stored in a `.dta` format, and data that is stored in a `.sav` format. Both of these are proprietary data formats (`.dta` for STATA, and `.sav` for SPSS). To read this data in R will require that you use the library(`haven`) and the appropriate `read_*` call for the data. 

While you're at the ANES website, you will also want to download the codebook, because all of the variables are marked as something like, `V200002` -- which isn't very descriptive without the codebook. 

# Question 2 Guidance 

- There are two related *Feeling Thermometer* questions about social justice, one about Black Lives Matter movement, and another about the #MeToo movement. 
- Evaluate whether respondents, overall, are warmer toward one or another of these concepts. 
- Is there a difference in warmth toward issues of social justice between individuals who report that they are Democrats or Republicans? 

# Question 3 Guidance 

- There are two related ANES questions that adress this concept -- one question asks if the respondent believes that COVID-19 was developed in a lab and another asks if the respondent believes hydroxychloroquine is a safe and effective treatment for COVID-19. 
- Evaluate whether you should combine the answers to these questions into a single answer, or if these two questions should be tested separately. 
- For each of the questions, there is a follow-up question about how confident the respondent is about this belief. How, if at all, should this information be incorporated into the data for the test? 

# Report Guidelines 

- Your report should be a compelling argument toward your conclusions. 
- Each question should occupy no more than 3 pages in the printed page
- Each question should include either a plot or table that is informative about the distribution of the data, and this plot or table should be discussed in the text. 
- You're going to have to clean, tidy, and structure the data for the questions that you're using; this code should be included in your report `.Rmd` file, but should not be shown in your final report. To accomplish this, you can use an `echo=FALSE` argument in your `.Rmd` file. 
- You're going to have to write code to produce tables and figures. This code should be included in your report `.Rmd` file, but should not be shown in your final report. To accomplish this, you can use an `echo=FALSE` argument in your `.Rmd` file. 
- You're going to have to write tests, for example, a `t.test`. This code *should* be shown in your report, because it makes very clear the specific test that you're conducting. 
- While you can choose to display the results of your test in the report, you also *certinaly* need to write about these results. This should be accomplished using [inline code chunks](https://bookdown.org/yihui/rmarkdown-cookbook/r-code.html), rather than by hard-coding / hard-writing output into your written report. 