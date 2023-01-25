sam <- withr::with_seed(
  1061,
  quote_lotr("Sam Gamgee")
)

test_that("quotes successful", {
  expect_equal(sam, "Potatoes! Boil 'em, mash 'em, stick 'em in a stew.")
})

test_that("Wrong Name Errors", {
  expect_error(quote_lotr("Gandorf"))
})
