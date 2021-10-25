#' The KSN of biogrid for yeast to run Kinase activity estimation
#'
#' Using common yeast gene names
#'
#' @format The full KSN contains 73388 Kinase substrate interaction
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
#' @format The full KSN contains 4662 signed directed protein protein interactions
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

#' The TF-target network of yeast from JASPAR motif recognition
#'
#' The sign of each TF-target network interaction is determined from a large collection of gene KO experiement of TFs
#' to determine the score, the sign of the "value" column of the original table (see source) is multiplied by -1
#'
#' @format The full TFTN contains 4201 signed interactions
#' \describe{
#'     \item{tf}{upstream transcription factor}
#'     \item{target}{downstream transcript}
#'     \item{mor}{activation/inhibition of transcription(1/-1)}
#' }
#' @keywords TFTN
#' @name TFTN_JASPAR_yeast
#' @examples data("TFTN_JASPAR_yeast")
#' @source \url{https://github.com/saezlab/yeast_phospho/blob/master/files/tf_gene_network_binding_sites_posterior_90.tab}
NULL
