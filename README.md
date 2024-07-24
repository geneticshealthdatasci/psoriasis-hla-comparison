This repository comprises code to support results derived using UK Biobank approved project 15147 that have been published in:

Douroudis _et al_, Differences in Clinical Features and Comorbid Burden between HLA-C∗06:02 Carrier Groups in >9,000 People with Psoriasis, _Journal of Investigative Dermatology_ (2022) 142, 1617e1628; doi:10.1016/j.jid.2021.08.446

### Study lay summary

Psoriasis is a very common skin condition with major impact on health and wellbeing. Unfortunately, some people also develop other health conditions (often termed ‘comorbidities’) such as arthritis and heart disease.

A person’s genetic make-up is an important determinant factor of health and disease. We know very little about the genes that determine whether a person will develop psoriasis comorbidities, but we know more about the genes that can lead to psoriasis. Of these, a gene called HLA-C is by far the most important. People with a version of this gene known as HLA-C\*06:02 are at considerably higher risk of developing psoriasis than people with other versions of HLA-C. We therefore set out to explore what influence HLA-C\*06:02 has on risk for psoriasis comorbidities.

We used information on more than 9,000 people with psoriasis, collected through two UK studies, UK Biobank and BSTOP. This included medical and genetic information, made available to our researchers with participants’ consent. We divided the study participants into two groups: those who did, and those who did not carry the HLA-C\*06:02 version of the HLA-C gene. We then compared comorbidities and other health-related outcomes between these two groups.

Our study confirmed that people who carry HLA-C\*06:02 are more likely to have psoriasis earlier in life. While the differences between groups were not large, we found a definite tendency for people without HLA-C\*06:02 to be above a healthy weight, and to suffer more heart problems. We also found this to be more evident in women than in men. It may be that HLA-C\*06:02 in some way protects people with psoriasis against development of certain comorbidities, compared to other versions of the HLA-C gene. Or perhaps people who don’t carry HLA-C\*06:02 carry other genes that increase their risk of comorbidities.

These results are only the first step in understanding why some people with psoriasis develop comorbidities and some do not. It does however provide an important direction for future research. We need to further investigate the differences between men and women across other genes to understand how they might play a role in development of comorbidities. Testing for HLA-C\*06:02 status alone won’t be powerful enough to identify everyone at risk of comorbidities but might be helpful if combined with other risk factors.

### Data

UK Biobank data cannot be openly shared, but researchers can apply for access.

The presence of psoriasis and comorbid diseases were established from diagnoses self-reported at UKB assessment centres and from linked hospital episode statistics (described in Supplementary Table S4 of the paper). Other non-genetic variables were derived from UK Biobank fields as clearly described in Supplementary Table S2. Imputed dosages for HLA-C\*06:02 were obtained from UK Biobank field 22182 and only values precisely equal to 0, 1 or 2 were included; HLA-C\*06:02 positive participants were those carrying either 1 or 2 copies. Genetic principal components were derived from genotyping array data using EIGENSOFT.

All derived variables used as inputs to these scripts have been returned to UK Biobank.

### Code

| Script                                                           | Description                                                                                                     |
| ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| [douroudis_et_al_UKB_analysis.R](douroudis_et_al_UKB_analysis.R) | Includes code for all summary and regression analyses using UK Biobank data (Tables 1, 2, 5 and 7 of the paper) |
 