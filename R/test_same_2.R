
# private -----------------------------------------------------------------
# storage_folder <- here("tests", "storage")
storage_folder <- function() here("tests", "storage")

test_run_2 <- function(.call, .name) {
	expected <- readRDS(file = file.path(storage_folder(), .name))
	output <- .call
	expect_equal(output, expected)
}

test_rec_2 <- function(.call, .name) {
	output <- .call
	saveRDS(output
					, file = file.path(storage_folder(), .name))
}


# public ------------------------------------------------------------------

test_same_2 <- function(.call, .name, record = FALSE) {
	if (record) {
		test_rec_2(.call = .call, .name = .name)
	} else {
		test_run_2(.call = .call, .name = .name)
	}
}
