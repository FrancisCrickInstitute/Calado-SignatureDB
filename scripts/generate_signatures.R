
generate_signatures <- function(df, gene_column = "gene", n = NULL, p.thresh = 0.05, fc.thresh = 0.5, pct.thresh = 0.1, direction = "both"){
    
    stopifnot(direction %in% c("both", "up", "down"))
    stopifnot(all(c("p_val_adj", "avg_log2FC", "pct.1", gene_column, "cluster") %in% colnames(df)))
    output <- df %>%
        filter(p_val_adj < p.thresh & avg_log2FC^2 > fc.thresh^2 & pct.1 > pct.thresh) %>%
        group_by(cluster) %>%
        arrange(desc(avg_log2FC))
    
    if(direction == "up"){
        output <- output %>%
            filter(avg_log2FC > 0)} 
    else if (direction == "down"){
        output <- output %>%
            filter(avg_log2FC < 0)}
    
    if(!is.null(n) & is.numeric(n)){
        output <- output %>%
            arrange(desc(avg_log2FC)) %>%
            filter(!!sym(gene_column) != "") %>%
            filter(!is.na(!!sym(gene_column))) %>%
            distinct(!!sym(gene_column), .keep_all = TRUE) %>%
            slice_max(n = n, order_by = avg_log2FC)}

    output <- output %>%
        arrange(desc(avg_log2FC)) %>%
        filter(!!sym(gene_column) != "") %>%
        filter(!is.na(!!sym(gene_column))) %>%
        distinct(!!sym(gene_column), .keep_all = TRUE) %>%
        ungroup() %>%
        dplyr::select(!!sym(gene_column), cluster) %>%
        split(.$cluster, .[[gene_column]]) %>%
        lapply(function(x) x[[gene_column]])

    return(output)}

report_signatures <- function(sig){
    stopifnot(is.list(sig))
    stopifnot(any(str_detect(names(sig), "[A-Z]")))
    for(i in seq_along(sig)){
        org <- ifelse(any(grepl("^[A-Z]", sig[[i]]) & grepl("^.[a-z]", sig[[i]])), "mouse", "human")
        message(paste0(org, " signature ", names(sig)[i], " has ", length(sig[[i]]), " genes"))
    }
}
