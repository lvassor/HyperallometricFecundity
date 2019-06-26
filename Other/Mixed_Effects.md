# Mixed Effect Models
## Intro
* More complicated than basic ANOVA because they account for things which are difficult to address in standard ANOVA
* In repeated measures, time is treated as random effect in ME model, more clumsy to do in ANOVA - Mixed effects handles them more efficiently

## Fixed vs Random Effects
|Fixed Effects|Random Effects|
|-------------|--------------|
|Differences among treatment levels important|Levels not important (just happen to be)|
|Specifically chosen treatment levels|"Whatever" - some difference was there|
|An expected gradient|Some sort of pattern|

## What is a "random" treatment?
* You know you might want to address it ahead of time
* Contrasted to fixed effects
    * spatial
    * temporal (t to t could be stochastic time series)
    * intercept discrepancy is what we're trying to account for in spatial or temporal autocorrelation

## Random intercepts and slopes
* intercepts vary among treatments because of random effect
    * could have similar slopes among groups but different intercepts
* can also have different slopes through cloud of points
* can have both - trying to account for effect like this underneath effects of fixed treatment
* Mixed effects models include Fixed + Random + Fixed*Random


## Hierarchical Linear Modeling (HLM)
Hierarchical linear modeling (HLM) is an ordinary least square (OLS) regression-based analysis that takes the hierarchical structure of the data into account.  Hierarchically structured data is nested data where groups of units are clustered together in an organized fashion, such as students within classrooms within schools.  The nested structure of the data violates the independence assumption of OLS regression, because the clusters of observations are not independent of each other.  HLM can also be called multi-level modeling.  Hierarchical linear modeling can be used for the purpose of prediction.  It can also be used for the purpose of data reduction, and can be helpful for drawing out the causal inference.

The flexibility of HLM models is reflected in the variety of applications for which it is used.  There is substantial application of HLM models for the study of longitudinal data where observations are nested within individuals.  Longitudinal HLM models, sometimes described as growth curve models, treat time in a flexible manner that allows the modeling of non-linear and discontinuous change across time and accommodates uneven spacing of time points and unequal numbers of observations across individuals.

HLM models provide a framework that incorporates variables on each level of the model.  For example, student characteristics, such as age and school characteristics, such as graduation rate, can be modeled.  HLM models can be extended beyond two levels.  For example, students nested within schools are nested within school districts.  In addition to purely hierarchical structures, there is a class of models called cross-classified models that allow units to be nested within more than one cluster where the clusters are not structurally related.  For example, students could be nested within schools and churches, where there is no relationship between schools and churches.

### Questions
* Do school level scores, class level scores, and student level scores effectively impact school district scores?
* Do demographic factors and geographic location influence voter scores?

### Answers
HLM can be explained in two steps.  
* Using the school example, the first step: separate analyses are conducted for every school taken under consideration with the help of the student level data.  For example, the test scores of the students in some particular subjects could be regressed on the basis of the student’s socio-economic status and the gender of the student.

* In the second step, the regression parameters obtained from the first step of the analyses become the outcome variables of interest.

### Assumptions:
* Data does not need to meet the homogeneity-of-regression slopes requirement.
* Data must be linear and normal.
* The assumption of homoscedasticity must be met.
* The assumption of independence is not required.

### Key Terms:
* Linearity: relationship between variables is straight line or rectangular
* Normality: the error terms at every level of the model are normally distributed
* Homoscedasticity: equal variances on groups