library(synapser)
ids <- synGetChildren('syn42255513')$asList()
files <- lapply(ids, synGet)

combined_data <- lapply(files, function(x){
  
  spec <- x$annotations$get("specimenID")
  
  data <- x$path %>% 
    readr::read_delim() %>% 
    slice(2) %>% 
    mutate(specimenID = spec)
  
}) %>% bind_rows()

combined_data_subset <- select(combined_data, Reads, specimenID) %>% distinct()

write_csv(combined_data_subset, "rnaseq_read_counts.csv")

synStore(File("rnaseq_read_counts.csv", parentId = 'syn42255513'))
