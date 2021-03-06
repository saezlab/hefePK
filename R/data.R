#' The KSN of biogrid for yeast to run Kinase activity estimation
#'
#' Using common yeast gene names
#'
#' @format The full KSN contains 15553 Kinase substrate interaction for 146 unique kinases
#' \describe{
#'     \item{psite}{substrate identifier with gene name, residue and position}
#'     \item{kinase}{kinase name}
#' }
#' @keywords KSN
#' @name KSN_biogrid_yeast
#' @examples data("KSN_biogrid_yeast")
#' @source \url{https://github.com/saezlab/conformationomic_yeast_picotti_2020/blob/master/scripts/generate_KSN.R}
NULL

#' The PKN of yeast from STRING
#'
#' Filtered interactions comming from database only, with 700 confidence score at least
#'
#' @format The full PKN contains 4662 signed directed protein protein interactions
#' \describe{
#'     \item{source}{upstream protein}
#'     \item{targets}{downstream protein}
#'     \item{sign}{activation/inhibition (1/-1)}
#' }
#' @keywords PKN
#' @name PKN_STRING_yeast
#' @examples data("PKN_STRING_yeast")
#' @source \url{https://github.com/saezlab/conformationomic_yeast_picotti_2020/blob/master/scripts/format_STRING_PKN_signed.R}
NULL

#' The TF-target network of yeast from JASPAR motif recognition and yeastract curated database
#'
#' The sign of each TF-target network interaction is determined from a large collection of gene KO experiement of TFs
#' to determine the score of the jaspar interactions, the sign of the "value" column of the original table of jaspar (see source) is multiplied by -1
#'
#' @format The full TFTN contains 14183 signed interactions for 155 unique TFs
#' \describe{
#'     \item{tf}{upstream transcription factor}
#'     \item{target}{downstream transcript}
#'     \item{mor}{activation/inhibition of transcription(1/-1)}
#' }
#' @keywords TFTN
#' @name TFTN_compound_yeast
#' @examples data("TFTN_compound_yeast")
#' @source \url{https://github.com/saezlab/yeast_phospho/blob/master/files/tf_gene_network_binding_sites_posterior_90.tab}
#' @source \url{https://github.com/ptgm/Paper_2020_Sci_Rep_scripts/blob/master/yeast2019-full-conds-net.txt}
NULL
