% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/application_prediction.R
\name{calculate_fraction_top_predicted}
\alias{calculate_fraction_top_predicted}
\title{Determine the fraction of genes belonging to the geneset or background and to the top-predicted genes.}
\usage{
calculate_fraction_top_predicted(affected_gene_predictions, quantile_cutoff = 0.95)
}
\arguments{
\item{affected_gene_predictions}{Tibble with columns "gene", "prediction" and "response" (e.g. output of function `assess_rf_class_probabilities`)}

\item{quantile_cutoff}{Quantile of which genes should be considered as top-predicted targets. Default: 0.95, thus considering the top 5 percent predicted genes as predicted targets.}
}
\value{
A tibble indicating the number of genes belonging to the gene set of interest or background (true_target column), the number and fraction of genes of these gruops that were part of the top predicted targets in a specific cross-validation round.
}
\description{
\code{calculate_fraction_top_predicted} Defines the fraction of genes belonging to the geneset or background and to the top-predicted genes.
}
\examples{
\dontrun{
weighted_networks = construct_weighted_networks(lr_network, sig_network, gr_network,source_weights_df)
ligands = list("TNF","BMP2","IL4")
ligand_target_matrix = construct_ligand_target_matrix(weighted_networks, ligands, ltf_cutoff = 0, algorithm = "PPR", damping_factor = 0.5, secondary_targets = FALSE)
potential_ligands = c("TNF","BMP2","IL4")
geneset = c("SOCS2","SOCS3", "IRF1")
background_expressed_genes = c("SOCS2","SOCS3","IRF1","ICAM1","ID1","ID2","ID3")
gene_predictions_list = seq(2) \%>\% lapply(assess_rf_class_probabilities,2, geneset = geneset,background_expressed_genes = background_expressed_genes,ligands_oi = potential_ligands,ligand_target_matrix = ligand_target_matrix)
target_prediction_performances_discrete_cv = gene_predictions_list \%>\% lapply(calculate_fraction_top_predicted) \%>\% bind_rows() \%>\% ungroup() \%>\% mutate(round=rep(1:length(gene_predictions_list), each = 2))
}

}
