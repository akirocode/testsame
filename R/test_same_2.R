
# private -----------------------------------------------------------------

storage_folder <- function() here("tests", "storage")
storage_file   <- function(.name) file.path(storage_folder(), paste0(.name, ".Rds"))

test_run <- function(.call, .name) {
	if (!file.exists(storage_file(.name)))
		stop("no ", storage_file(.name), " recorded yet")
	expected <- readRDS(file = storage_file(.name))
	output <- .call
	expect_equal(output, expected)
}

test_rec <- function(.call, .name) {
	output <- .call
	saveRDS(output
					, file = storage_file(.name))
}

fake_expect <- function() expect_true(TRUE)

# public ------------------------------------------------------------------

expect_same <- function(.call, .name, record = FALSE) {
	if (record) {
		test_rec(.call = .call, .name = .name)
	} else {
		test_run(.call = .call, .name = .name)
		fake_expect()
	}
}
