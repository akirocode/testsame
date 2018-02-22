# Installation

```
if (!require(devtools)) install.packages("devtools")
devtools::install_github("akirocode/testsame")
```

# Usage

```
# setup ----

testsame_setup()

# user code -----

tfun_right <- function(x) {
	sum(x)
}

tfun_wrong <- function(x) {
	sum(x) + 100
}

# test_recording 2 -----

expect_same(tfun_right(x = 1), "out1", record = TRUE)

# testing -----

expect_same(tfun_right(x = 1), "out1")
expect_same(tfun_wrong(x = 1), "out1") # returns error
```

