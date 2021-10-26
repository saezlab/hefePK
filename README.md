# yeastPK

This package is a collection of prior knowledge ressources for yeast. 
Mainly, it contains a kianse substrate network, a transcription factor target netowrk and a prior knowledge network

## Instalation

To install `yeastPK` please run:
```
devtools::install_github('saezlab/yeastPK')
```

## Sources:
- PKN (signed, directed) : from STRING https://github.com/saezlab/conformationomic_yeast_picotti_2020/blob/master/scripts/format_STRING_PKN_signed.R

- KSN : from Biogrid 
https://github.com/saezlab/conformationomic_yeast_picotti_2020/blob/master/scripts/generate_KSN.R

- TF-target network: from JASPAR  and yeastract 
https://github.com/saezlab/yeast_phospho/blob/master/files/tf_gene_network_binding_sites_posterior_90.tab
https://github.com/ptgm/Paper_2020_Sci_Rep_scripts/blob/master/yeast2019-full-conds-net.txt
