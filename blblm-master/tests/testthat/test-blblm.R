test_that("test m split", {
  blblm_fit <- blblm(speed ~ dist, data = cars, m = 10, B = 100)
  expect_equal(length(blblm_fit$estimates), 10)
})
test_that("test with 1 CPU and dataframe", {
  blblm_fit <- blblm(speed ~ dist, data = cars, m = 10, B = 100)
  expect_s3_class(blblm_fit, "blblm")
})
test_that("test more than 1 CPU and dataframe works", {
  blblm_fit <- blblm(speed ~ dist, data = cars, m = 10, B = 100, cl = 3)
  expect_s3_class(blblm_fit, "blblm")
})
test_that("test boostrap did sample B times", {
  blblm_fit <- blblm(speed ~ dist, data = cars, m = 10, B = 100, cl = 3)
  expect_equal(length(blblm_fit$estimates[[1]]), 100)
})