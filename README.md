# Calado-SignatureDB

Gene Signature Collection used in Calado-Lab


## Data Availability
Data is available on both [DropBox](https://www.dropbox.com/scl/fo/s8c1slvqsb4vgvtt8kyze/ALm1fkTMvmk3M4wYkKN1AVY?rlkey=eatreddt37xe9mqknw9dm321a&st=o09cb0zc&dl=0) and NEMO at `/nemo/lab/caladod/working/Matthew/Calado-SignatureDB`. Please <b>DO NOT</b> share this data externally.

Relevant Directories:
```
Calado-SignatureDB/
├── releases/v0.0.1                   # Official SignatureDB release versions
|   ├── human.gmt                          ## All human gene sets compiled, stored in GMT file
|   └── mouse.gmt                          ## All mouse gene sets compiled, stored in GMT file
├── human-external/gmt/                    ## Individual human GMT files from external sources
├── human-internal/gmt/                    ## Individual human GMT files from lab
├── mouse-external/gmt/                    ## Individual mouse GMT files from external sources
└── mouse-internal/gmt/                    ## Individual mouse GMT files from lab
```

## Suffix Dictionary
`_UP` = all upregulated genes  
`_DN` = all downregulated genes  
`_TOP50` = top 50 upregulated genes  

## Collapsed Index
| GENE SET FILE           | ORG SOURCE     | CONTEXT  | DESCRIPTION                                                | SOURCE DATA   | MOL        | DOI                                                 | NOTES                                                         |
|:------------------------|:--------------:|:--------:|:-----------------------------------------------------------|:--------------|:-----------|:----------------------------------------------------|:-------------------------------------------------------------|
| SHA_MHG                 | human-external | cancer   | MHG signatures                                             | REMoDL-B      | RNA        | 10.1200/JCO.18.01314                                | filtered by `padj` < 0.05|
| ENNISHI_DHIT            | human-external | cancer   | DHIT signature in BL with MYC and BCL2 rearrangements      | Reddy_2017    | RNA        | 10.1200/JCO.18.01583                                | N/A|
| LYMPH2CX_DLBCL          | human-external | cancer   | NanoString Lymph2Cx DLBCL-ABC/GCB panel                    | Lenz_2008     | RNA        | 10.1056/NEJMoa0802885; 10.1182/blood-2013-11-536433 | N/A|
| REDDY_DLBCL             | human-external | cancer   | DLBCL-ABC/GCB signature from Reddy et al.                  | Reddy_2017    | RNA        | 10.1016/j.cell.2017.09.027                          | N/A| 
| ATKINSO_CPC39           | human-internal | cancer   | Common progenitor cell gene signature                      | Silva_2018    | RNA        | N/A                                                 | N/A|
| ATKINSO_CPC_CLUSTER     | mouse-internal | cancer   | Cluster signatures                                         | SC23423       | RNA        | N/A                                                 | `padj` < 0.01, `avg_log2FC` > 0.5, `min.pct` > 0.1           |
| CHENT_MYC_CLUSTER       | mouse-internal | cancer   | Cluster signatures                                         | SC24124       | RNA        | N/A                                                 | `padj` < 0.05, `avg_log2FC` > 0.5, `min.pct` > 0.1           |
| CHENT_MYC_GENOTYPE      | mouse-internal | cancer   | Genotype signatures                                        | SC24124       | RNA        | N/A                                                 | `padj` < 0.05, `avg_log2FC` > 0.5, `min.pct` > 0.1           |
| CHENT_NOMYC_CLUSTER     | mouse-internal | cancer   | Cluster signatures without MYC targets                     | SC24124       | RNA        | N/A                                                 | remove genes from NAKAGAWAR_MYC_RN_MYC_PROMOTER, `padj` < 0.05, `avg_log2FC` > 0.5, `min.pct` > 0.1 |
| NAKAGAWAR_MYC           | mouse-internal | cancer   | MYC target genes with CHIPseq                              |               | RNA        | 10.1038/nature13537                                 | N/A |
| XUA_EFPC                | mouse-internal | celltype | Extrafollicular plasma cell signature                      | CRA004574     | RNA        | 10.1038/s41590-022-01397-7                          | `mu_freq` > 0.0075, `padj` < 0.05, `avg_log2FC` > 0.5, `min.pct` > 0.1 |

## Detailed Index
Please find relevant gene set information in [mouse](releases/v0.0.1/mouse_index.txt) and [human](releases/v0.0.1/human_index.txt) gene set index files.

## Notes
All cross-species gene symbol conversion are performed with 1 to 1 mapping by [hungms/strpip](https://github.com/hungms/strpip) with version 0.1.3