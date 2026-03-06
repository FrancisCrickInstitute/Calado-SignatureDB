# Calado-SignatureDB

Gene Signature Collection used in Calado-Lab

## Data Availability
Data is available on both [DropBox](https://www.dropbox.com/scl/fo/s8c1slvqsb4vgvtt8kyze/ALm1fkTMvmk3M4wYkKN1AVY?rlkey=eatreddt37xe9mqknw9dm321a&st=o09cb0zc&dl=0) and NEMO at `/nemo/lab/caladod/working/Shared/Calado-SignatureDB`. Please <b>DO NOT</b> share this data externally.

Relevant Directories:
```
Calado-SignatureDB/
├── releases/v0.0.4                   # Official SignatureDB release versions
|   ├── external.gmt                          ## All gene sets compiled from external sources, stored in GMT file
|   └── internal.gmt                          ## All gene sets compiled from internal sources, stored in GMT file
├── external/gmt/                    ## Individual GMT files from external sources
└── internal/gmt/                    ## Individual GMT files from internal sources
```

## Suffix Dictionary
`_UP` = all upregulated genes  
`_DN` = all downregulated genes  
`_TOP50` = top 50 upregulated genes