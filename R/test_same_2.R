
# private -----------------------------------------------------------------

storage_folder <- function() here("tests", "storage")

test_run <- function(.call, .name) {
	expected <- readRDS(file = file.path(storage_folder(), .name))
	output <- .call
	expect_equal(output, expected)
}

test_rec <- function(.call, .name) {
	output <- .call
	saveRDS(output
					, file = file.path(storage_folder(), .name))
}


# public ------------------------------------------------------------------

expect_same <- function(.call, .name, record = FALSE) {
	if (record) {
		test_rec(.call = .call, .name = .name)
	} else {
		test_run(.call = .call, .name = .name)
	}
}
