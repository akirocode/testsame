read_same <- function(.name) {
	file <- storage_file(.name)
	readRDS(file)
}
