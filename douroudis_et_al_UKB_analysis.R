## Script describing analyses presented in:
##
## Douroudis et al, Differences in Clinical Features and Comorbid Burden between
## HLA-C∗06:02 Carrier Groups in >9,000 People with Psoriasis, Journal of
## Investigative Dermatology (2022) 142, 1617e1628; doi:10.1016/j.jid.2021.08.446


## Load data for UKB psoriasis cases
##----------------------------------

data2 <- read.table("datasets/UKBB1.txt", stringsAsFactors = FALSE, header = TRUE)
names(data2)[names(data2) == "DGN"] <- "HLA_C_0602_STATUS"
names(data2)[names(data2) == "f.21001.0.0"] <- "BMI"
names(data2)[names(data2) == "f.21002.0.0"] <- "Weight"
names(data2)[names(data2) == "f.48.0.0"] <- "Waist"

## Sex-based subsets
data2male <-  subset(data2, data2$sex=="male")
data2female <-  subset(data2, data2$sex=="female")

## HLA-C*06:02-based subsets
data2pos <- subset(data2, HLA_C_0602_STATUS == 1)
data2neg <- subset(data2, HLA_C_0602_STATUS == 0)



## Table 1: cohort summary
##------------------------

## Age at onset
quantile(data2$ageatonset, c(0.25, 0.5, 0.75), na.rm = TRUE)

## Age at recruitment
quantile(data2$ageatrecruitment, c(0.25, 0.5, 0.75), na.rm = TRUE)

## Psoriasis duration
quantile(data2$duration, c(0.25, 0.5, 0.75), na.rm = TRUE)

## Sex
sum(data2$sex == "female")
sum(data2$sex == "female")/nrow(data2)

## HLA-C*06:02 positive
sum(data2$HLA_C_0602_STATUS == 1)
sum(data2$HLA_C_0602_STATUS == 1)/nrow(data2)

## HLA-C*06:02 homozygous
sum(data2$HLA_C_0602_TRANSFORMED == 2)
sum(data2$HLA_C_0602_TRANSFORMED == 2)/nrow(data2)



## Table 2: summary by HLA-C*06:02 status
##---------------------------------------

## Age at onset
quantile(data2neg$ageatonset, c(0.25, 0.5, 0.75), na.rm = TRUE)
quantile(data2pos$ageatonset, c(0.25, 0.5, 0.75), na.rm = TRUE)

## Early onset (age<=40)
sum(data2neg$AGEATONSETGROUPS40v2 == 1, na.rm = TRUE)
sum(data2neg$AGEATONSETGROUPS40v2 == 1, na.rm = TRUE)/sum(!is.na(data2neg$AGEATONSETGROUPS40v2))

sum(data2pos$AGEATONSETGROUPS40v2 == 1, na.rm = TRUE)
sum(data2pos$AGEATONSETGROUPS40v2 == 1, na.rm = TRUE)/sum(!is.na(data2pos$AGEATONSETGROUPS40v2))

## Age at recruitment
quantile(data2neg$ageatrecruitment, c(0.25, 0.5, 0.75), na.rm = TRUE)
quantile(data2pos$ageatrecruitment, c(0.25, 0.5, 0.75), na.rm = TRUE)

## Psoriasis duration
quantile(data2neg$duration, c(0.25, 0.5, 0.75), na.rm = TRUE)
quantile(data2pos$duration, c(0.25, 0.5, 0.75), na.rm = TRUE)

## Sex
sum(data2neg$sex == "female")
sum(data2neg$sex == "female")/nrow(data2neg)

sum(data2pos$sex == "female")
sum(data2pos$sex == "female")/nrow(data2pos)

## Ever smoked
sum(data2neg$smoking == 1, na.rm = TRUE)
sum(data2neg$smoking == 1, na.rm = TRUE)/sum(!is.na(data2neg$smoking))

sum(data2pos$smoking == 1, na.rm = TRUE)
sum(data2pos$smoking == 1, na.rm = TRUE)/sum(!is.na(data2pos$smoking))



## Table 5: anthropometric measures
##---------------------------------

## Testing association of HLA-C*06:02 status with BMI, Weight and Waist Circumference
##
## Crude models using simple linear regression
##   lm(y ~ x, data=data1)
## Fully adjusted models using multiple linear regression
##   lm (y ~  x + PC1 + PC2 + PC3 + PC4 + PC5 + smoking + sex + ageatrecruitment + I(ageatrecruitment^2))

## BMI

summary(lm(BMI ~ HLA_C_0602_STATUS, data=data2))
summary(lm(BMI ~ HLA_C_0602_STATUS + PC1 + PC2 + PC3 + PC4 + PC5 + smoking + sex + ageatrecruitment + I(ageatrecruitment^2), data=data2))

summary(lm(BMI ~ HLA_C_0602_STATUS, data=data2male))
summary(lm(BMI ~ HLA_C_0602_STATUS + PC1 + PC2 + PC3 + PC4 + PC5 + smoking + ageatrecruitment + I(ageatrecruitment^2) , data=data2male))

summary(lm(BMI ~ HLA_C_0602_STATUS, data=data2female))
summary(lm(BMI ~ HLA_C_0602_STATUS + PC1 + PC2 + PC3 + PC4 + PC5 + smoking + ageatrecruitment + I(ageatrecruitment^2) , data=data2female))

## Weight

summary(lm(Weight ~ HLA_C_0602_STATUS, data=data2))
summary(lm(Weight ~ HLA_C_0602_STATUS + PC1 + PC2 + PC3 + PC4 + PC5 + smoking + sex + ageatrecruitment + I(ageatrecruitment^2), data=data2))

summary(lm(Weight ~ HLA_C_0602_STATUS, data=data2male))
summary(lm(Weight ~ HLA_C_0602_STATUS + PC1 + PC2 + PC3 + PC4 + PC5 + smoking + ageatrecruitment + I(ageatrecruitment^2) , data=data2male))

summary(lm(Weight ~ HLA_C_0602_STATUS, data=data2female))
summary(lm(Weight ~ HLA_C_0602_STATUS + PC1 + PC2 + PC3 + PC4 + PC5 + smoking + ageatrecruitment + I(ageatrecruitment^2) , data=data2female))
  
## Waist

summary(lm(Waist ~ HLA_C_0602_STATUS, data=data2))
summary(lm(Waist ~ HLA_C_0602_STATUS + PC1 + PC2 + PC3 + PC4 + PC5 + smoking + sex + ageatrecruitment + I(ageatrecruitment^2), data=data2))

summary(lm(Waist ~ HLA_C_0602_STATUS, data2male))
summary(lm(Waist ~ HLA_C_0602_STATUS + PC1 + PC2 + PC3 + PC4 + PC5 + smoking + ageatrecruitment + I(ageatrecruitment^2), data=data2male))

summary(lm(Waist ~ HLA_C_0602_STATUS, data2female))
summary(lm(Waist ~ HLA_C_0602_STATUS + PC1 + PC2 + PC3 + PC4 + PC5 + smoking + ageatrecruitment + I(ageatrecruitment^2), data=data2female))



## Table 7: comorbidities
##-----------------------

## Test association of common psoriasis comorbidities with HLA-C*06:02 status
## These tests are based on simple and multiple regressions as above, but wrapped
## here into functions to allow them to be conducted and tabulated

two.sd <- qnorm(0.975)

pval.string <- function(p, precision) {
  if ((-log10(p)) > precision) {
    return(sprintf("%2.1e", p))
  } else {
    return(sprintf("%0.3f", p))  
  }
}

run.test <- function(outcome.var, exposure.var="HLA_C_0602_STATUS", data.frame,
                     include.BMI=TRUE, include.sex=TRUE, precision=3) {

  x <- data.frame
  x$expos <- x[, exposure.var]
  
  ## Make the model formula

  if(include.BMI) { bmi.term <- "BMI + I(BMI ^2) + " } else { bmi.term <- "" }
  if(include.sex) { sex.term <- "sex + " } else { sex.term <- "" }
  formula.1 <- paste0(outcome.var, " ~ ", exposure.var)
  formula.2 <- paste0(outcome.var, " ~ ", exposure.var, " + PC1 + PC2 + PC3 + PC4 + PC5 ",
                        "+ ageatrecruitment + I(ageatrecruitment ^2) ",
                        "+ ", bmi.term, sex.term, "smoking")
  
  x0 <- subset(x, expos == 0)[, outcome.var]
  x1 <- subset(x, expos == 1)[, outcome.var]
  
  effect.format <- "%0.2f (%0.2f, %0.2f)"
  median.iqr.format <- "%0.1f (%0.1f-%0.1f)"
  
  summary0 <- sprintf("%i (%0.1f)", sum(x0, na.rm = TRUE),
                      100 * sum(x0, na.rm = TRUE) / sum(!is.na(x0)))
  summary1 <- sprintf("%i (%0.1f)", sum(x1, na.rm = TRUE),
                      100 * sum(x1, na.rm = TRUE) / sum(!is.na(x1)))
  mod.1 <- coefficients(summary(glm(formula.1, data = x, family = "binomial")))
  eff1 <- sprintf(effect.format, exp(mod.1[2, 1]),
                  exp(mod.1[2, 1] - two.sd * mod.1[2, 2]),
                  exp(mod.1[2, 1] + two.sd * mod.1[2, 2]))
  
  p1 <- pval.string(mod.1[2, 4], precision)
  mod.2 <- coefficients(summary(glm(formula.2, data = x, family = "binomial")))
  eff2 <- sprintf(effect.format, exp(mod.2[2, 1]),
                  exp(mod.2[2, 1] - two.sd * mod.2[2, 2]),
                  exp(mod.2[2, 1] + two.sd * mod.2[2, 2]))
  p2 <- pval.string(mod.2[2, 4], precision)

  return(list(crude.model=mod.1, full.model=mod.2,
              table.row=c(summaryneg=summary0,
                          summarypos=summary1,
                          crudeeff=eff1,
                          crudep=p1,
                          fulleff=eff2,
                          fullp=p2)))
}

ukb.comorbs.posneg <- t(sapply(c("cardiovascularUKBB", "ischaemicUKBB", "hypertensionUKBB",
                                 "dyslipidaemiaUKBB", "type2diabetesUKBB", "osteoarthritisUKBB",
                                 "psoriaticarthritisUKBB", "anxietyUKBB", "depressionUKBB",
                                 "asthmaUKBB", "liver_noanlcUKBB", "pepticulcerUKBB", "thyroid2UKBB"),
                               function(outcome.var) {
                                 return(run.test(outcome.var,
                                                 data.frame = data2,
                                                 precision = 2)$table.row)
                                 }))

ukb.comorbs.posneg
