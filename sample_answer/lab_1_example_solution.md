---
title: "Fear and Anger as Motivators for Voter Turnout"
author: 'Datasci 203: An Example Statistical Analysis'
output:
  bookdown::pdf_document2: 
    toc: false
---












# Importance and Context

In the United States, the last decades have seen an increasingly polarized political climate. On a set of political questions measured by the Pew Research Center, the average partisan gap between liberals and conservatives has increased from 15 percentage points in 1994 to 36 percentage points in 2017 \footnote{Pew Research Center. "The partisan divide on political values grows even wider." (2017).}.  At the same time, national elections have been decided by increasingly narrow margins.  In both 2000 and 2016, the winner of the presidential election lost the popular vote - an event that hadn't occured previously since 1888. Responding to thislevels environment, political campaigns have increasingly emphasized voter turnout as a way to winning elections. The question of how to motivate voters to show up at the polls has become crucial to political strategists, as well as commentators and researchers.

This analysis contributes to the discussion of voter motivation, focusing on two emotions that frequently surface in discussions of the 2016 election: anger and fear. These two emotions are often cited in explaining voter behavior, and they are key targets that political advertisements are designed to play on.  While anger and fear often go hand in hand, they may differ in how well they motivate voter turnout, as well as how they contribute to the overall polarization of society.  As a first step, this analysis aims to address the following research question:

\begin{quote}
  \textit{Was fear or anger more effective at causing voters to turn out in the 2018 election?}
\end{quote}

The answer to this question could provide guidance to future political campaigns hoping to increase voter turnout. It could also provide useful background for governments that are interested civic participation. A better understanding of the factors that polarize society, and how they express themselves through the voting process, may also help those hoping to counteract that polarization.

# Data and Methodology

Our analysis leverages data from the 2018 American National Election Studies (ANES).  This is an observational dataset, based on a sample of respondents drawn from the YouGov platform. The Yougov panel is not nationally representative, and consists of participants who sign up to complete questionnaires in exchange for rewards.  This dataset includes 2500 individuals. We elect to remove individuals who do not have election turnout values reported in either 2016 or 2018, as well as individuals who either report that they "Do not know", or "Did not repond" to the key _anger_ or _fear_ survey questions. 

As we report in Table \@ref(tab:summary-table), 70% of ANES respondents report that they voted in both the 2016 and 2018 elections. While turnout of 75% might be expected in the presidential general, it is highly unusual to have turnout this high in an off-cycle election. Also notable in this data is that voting (or not voting) seems to be highly consistent over time -- only 10% of the respondents report taking a different action in 2016 compared to 2018. 

To operationalize the concept of voter turnout, we identify those voters who went from not voting in 2016 to voting in 2018. Our process excludes voters who were potentially too young to vote in 2016.  These "new voters" represent changes in voting behavior, so the emotions they experience are especially relevant as potential drivers of turnout. As an alternative, we considered directly comparing voting rates at a fixed point in time, but this method would focus mostly on people who's voting behavior has been constant for many cycles, and less related to the emotions experienced specifically in 2018.




Table: Cross Tab of Self Reported Voting in 2016 and 2018

|                  | Did not Vote 2018| Voted 2018|
|:-----------------|-----------------:|----------:|
|Did not Vote 2016 |              0.20|       0.05|
|Voted 2016        |              0.05|       0.70|

The survey includes questions about how angry and how afraid respondents "feel about the way things are going in this country." Data is reported on a 5-point Likert scale that ranges from 1 ("not at all") to 5 ("extremely"), and the same question is asked to each respondent. These questions are about emotions in general, not necessarily emotions relevant to voting, and the survey does not provide more information about whether these emotions *cause* voting behavior to change.

Because of the observational nature of the ANES data, we are not able to directly measure whether anger or fear *causes* voter turnout.  We can only check whether angry people or fearful people are more likely to increase their voting behavior.  Care must therefore be taken before drawing causal conclusions based on our results.


```
## Warning: `guides(<scale> = FALSE)` is deprecated. Please use `guides(<scale> =
## "none")` instead.
```


```
## Warning: `guides(<scale> = FALSE)` is deprecated. Please use `guides(<scale> =
## "none")` instead.
```



![Voter Emotions and Voter Turnout. 
 The red series did not vote; the blue series did vote.](figure/plots-1.png)

The left panel of Figure \@ref(fig:plots)  plots the marginal distributions of respondents' feelings of fear and anger. While there are about the same proportion of respondents who report being the lowest category in both fear and anger, there are more who report being somewhat afraid than report being somewhat angry. This is offset by fewer individuals reporting high levels of fear. 

To compare the two emotions, we identify the respondents who are more angry than afraid, and the repondents who are more afraid than angry.  While it would be possible to retain more information by subtracting one measure from the other, this would innapropriately impose a metric structure on these ordinal variables.  We find that there are 854 people in the more-anger group and 519 people in the more-fear group.  There are 1112 people who did not specify a difference in emotions, which we cannot leverage for our test.  The right panel of Figure \@ref(fig:plots) shows the fraction of people in each group that went from not voting to voting.

Both our grouping variable and our outcome variable are measured at the binary level.  In these circumstances, common tests could include a two-sample proportion test and Fischer's exact test.  We proceed with a two-sample t-test to demonstrate tools used in Datasci 203.  Given the large sample sizes, the loss of accuracy from the t-test will be negligible.  The null hypothesis for the t-test can be expressed as follows:

\begin{quote}

\textbf{Null Hypothesis:} \textit{The probability that a member of the more-anger group shows an increase in turnout is equal to the probability that a member of the more-fear group shows an increase in turnout.}

\end{quote}

The t-test requires the following assumptions to be true: 

\begin{enumerate}
  \item \textbf{i.i.d. data}  First, data must be generated via an iid process.  The ANES 2018 pilot uses a panel of individuals from the YouGov platform. There is a possibility that this introduces dependencies.  For example, participants may tell friends or family members about YouGov, resulting in a cluster of individuals that give similar responses.  Nevertheless, YouGov claims to have millions of users, which suggests that links between individuals should be rare. 

  \item \textbf{Metric scale}  Even though our raw data includes ordinal variables, we have transformed them to binary form.  A binary variable qualifies as metric as there is only a single interval, which goes from zero to 1.
  
  \item \textbf{Sufficient normality} The small number of new voters can be understood as a positive skew in our turnout variable (skewness = 4.82).  Nevertheless, the large sample size suggests that the sampling distribution of the statistic should be approximately normal via the Central Limit Theorem. 
\end{enumerate}

# Results


```r
test <- t.test(new_voter ~ emotions, data = anes)
```



The test yields evidence that angry people are more likely than fearful people to increase voting behavior (t = 2.01, p = 0.05).  From a practical perspective, this result appears potentially important.  In the more-anger group, 0.023 of participants are new voters.  This compares to 0.044 in the more-fear group, a difference of 2.09 percentage points.  A difference of this size might typically be considered a small effect, but in a polarized electorate, even a small increase in message effectiveness may swing an election.

Several limitations of our test affect the conclusions that may be drawn from it.  As mentioned above, we are only able to measure associations between emotions and voter turnout, not causations. Additionally, the ANES data is not nationally representative, suggesting that our results may not generalize to the US population.

# Discussion

This study found evidence that anger is more effective than fear at driving voter turnout.  The effect appears practically significant, with angry people estimated to be nearly twice as likely to be new voters in 2018.  While the absolute number of new voters remains small, in a polarized and closely divided electorate, the difference of 2.09 percentage points may be enough to swing some close elections.  

Our results may be of key interest to political campaigns, who have the goal of tailoring advertisements to drive their supporters to the polls. While this study addresses emotions in general, future studies may focus directly on the emotional content of political advertisements. We are especially interested in manipulating the emotional content of advertisements in an experiment, providing a way to measure the causal pathway from emotion to voting behavior. Finally, we hope that a general understanding of emotions and voting can benefit society more broadly, by revealing new ways to manage political polarization.
