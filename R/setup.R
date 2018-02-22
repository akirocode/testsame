testsame_setup <- function() {
	if (!dir.exists(storage_folder()))
		dir.create(storage_folder(), recursive = TRUE)
}
