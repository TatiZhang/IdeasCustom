% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{microglia_sun_df}
\alias{microglia_sun_df}
\title{Sun et al. microglia AD genes}
\format{
\subsection{\code{microglia_sun_df}}{

A data frame with 3689 rows (genes) and 8 columns:
\describe{
\item{Gene}{Gene name}
\item{Pr..Chisq.}{P-value from MAST}
\item{coef}{Coefficient for the gene in the MAST model}
\item{ci.hi}{Upper confidence value for the coef}
\item{ci.lo}{Lower confidence value for the coef}
\item{fdr}{False discovery rate (i.e., adjusted p-value) based on the p-value}
\item{groupID}{The microglia subtype the DE analysis was performed on, where "early" refers to control-vs-earlyAD and "late" refers to earlyAD-vs-lateAD}
\item{DEG}{Internal criteria to deem a gene as DEG when looking at microglia as a whole}
}
}
}
\source{
\url{https://www.sciencedirect.com/science/article/pii/S0092867423009716}
}
\usage{
microglia_sun_df
}
\description{
From https://www.sciencedirect.com/science/article/pii/S0092867423009716,
1-s2.0-S0092867423009716-mmc1.xlsx.
}
\details{
Using the criterion that a gene is deemed DEG if it was found to be DE in 5 or more (among the 24 microglia subtype and AD-progression combinations).
}
\examples{
\dontrun{
# How the data was loaded
df <- openxlsx::read.xlsx("1-s2.0-S0092867423009716-mmc1.xlsx",
sheet = "Page 10.DEGs_AD")
colnames(df)[1] <- "Gene"
microglia_sun_df <- df
table_vec <- table(microglia_sun_df$Gene)
enriched_genes <- unique(names(table_vec)[table_vec >= 5])
microglia_sun_df$DEG <- (microglia_sun_df$Gene \%in\% enriched_genes)
usethis::use_data(microglia_sun_df)

# To load
microglia_sun <- unique(microglia_sun_df$Gene[microglia_sun_df$DEG])
}
}
\keyword{datasets}
