# vignette:
# setup ----

#devtools::install_github("krlmlr/here")
## https://krlmlr.github.io/here/
#devtools::use_testthat()
library(here)
library(testthat)
# implementation -----

test_run <- function(.name, .input, .fun) {
	expected <- readRDS(file = file.path(storage_folder, .name))
	output <- do.call(.fun, .input)
	expect_equal(output, expected)
}

test_rec <- function(.name, .input, .fun) {
	output <- do.call(.fun, .input)
	saveRDS(output
					, file = file.path(storage_folder, .name))
}

test_same_1 <- function(.name, .input, .fun, record = FALSE) {
	if (record) {
		test_rec(.name = .name, .input = .input, .fun = .fun)
	} else {
		test_run(.name = .name, .input = .input, .fun = .fun)
	}
}

# 2 -----------------------------------------------------------------------


# user code -----

tfun_right <- function(x) {
	sum(x)
}

tfun_wrong <- function(x) {
	sum(x) + 100
}

# test recording 1 -----

test_same_1(.name = "out1", .input = list(x = 1), .fun = tfun_right, record = TRUE)

# testing -----

x <- 1:5

test_same_1(.name = "out1", .input = list(x = 1), .fun = tfun_right)
test_same_1(.name = "out1", .input = list(x = 1), .fun = tfun_wrong)

# test_recording 2 -----

storage_folder

test_same_2(.call = tfun_right(x = 1), .name = "out1", record = TRUE)

# testing -----

x <- 1:5

test_same_2(.call = tfun_right(x = 1), .name = "out1")
test_same_2(.call = tfun_wrong(x = 1), .name = "out1")
