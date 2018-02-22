# vignette:
# setup ----

# user code -----

tfun_right <- function(x) {
	sum(x)
}

tfun_wrong <- function(x) {
	sum(x) + 100
}

# test_recording 2 -----

storage_folder

test_same_2(.call = tfun_right(x = 1), .name = "out1", record = TRUE)

# testing -----

x <- 1:5

test_same_2(.call = tfun_right(x = 1), .name = "out1")
test_same_2(.call = tfun_wrong(x = 1), .name = "out1")
