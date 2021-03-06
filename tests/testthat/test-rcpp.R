context("rcpp")

## TODO(tests)

## - non-numeric alpha value
## - string, logical, numeric, factor fill values
## - na_colour
## - matrix palette, including alpha
## - check alpha is [0,255]
## - polygon fill & opacity
## - pointcloud fill & opacity


test_that("defaults are overwritten by user-supplied arguments from input data", {

	# ## TODO( n == 2 fails colourvalues::colour_values)
	# map <- mapdeck(token = 'abc')
	# set.seed(1)
	# n <- 5
	# df <- data.frame(
	# 	id = 1:n
	# 	, lon = sample(-180:180, size = n, replace = T)
	# 	, lat = sample(-90:90, size = n, replace = T)
	# 	, polyline = sample(letters, size = n, replace = T)
	# 	, rad = 1:n
	# 	, sample = rnorm(n)
	# 	, stringsAsFactors = F
	# )
	# l <- list(mapdeck::add_scatterplot, map = map, data = df, lon = "lon",
	# 		 lat = "lat", polyline = "polyline", radius = "rad", fill_colour = "id",
	# 		 fill_opacity = "id", tooltip = "id", palette = "viridis")
	#
	# ## Scatterplot
	# # - lon
	# # - lat
	# # - polyline
	# # - radius
	# # - fill_colour
	# # - fill_opacity
	# # - tooltip
	#
	# plot <- mapdeck:::rcpp_scatterplot(df, l)
	# expect_true( attr(plot, "class") == "json")
	# plot <- jsonlite::fromJSON( plot )
	#
	# expect_true( !"lon" %in% names( plot ) )
	# expect_true( !"lat" %in% names( plot ) )
	# expect_true( all(plot$polyline == df$polyline ) )
	# expect_true( all(plot$radius == df$rad) )
	# expect_true( all(colourvalues::colour_values(df$id, alpha = df$id) == plot$fill_colour) )
	# expect_true( all(plot$tooltip == df$id) )

})

test_that("defaults are overwritten by user-supplied arguments as single values", {

	# ## TODO( n == 2 fails colourvalues::colour_values)
	# map <- mapdeck(token = 'abc')
	# set.seed(1)
	# n <- 5
	# df <- data.frame(
	# 	id = 1:n
	# 	, lon = sample(-180:180, size = n, replace = T)
	# 	, lat = sample(-90:90, size = n, replace = T)
	# 	, polyline = sample(letters, size = n, replace = T)
	# 	, rad = 1:n
	# 	, sample = rnorm(n)
	# 	, stringsAsFactors = F
	# )
	# l <- list(mapdeck::add_scatterplot, map = map, data = df, lon = "lon",
	# 					lat = "lat", polyline = "polyline", radius = 20, fill_colour = 100,
	# 					fill_opacity = "id", tooltip = "20", palette = "viridis")
	#
	# ## Scatterplot
	# # - lon
	# # - lat
	# # - polyline
	# # - radius
	# # - fill_colour
	# # - fill_opacity
	# # - tooltip
	#
	# plot <- mapdeck:::rcpp_scatterplot(df, l)
	# expect_true( attr(plot, "class") == "json")
	# plot <- jsonlite::fromJSON( plot )
	#
	# expect_true( !"lon" %in% names( plot ) )
	# expect_true( !"lat" %in% names( plot ) )
	# expect_true( all(plot$polyline == df$polyline ) )
	# expect_true( all(plot$radius == 20) )
	# expect_true( all(colourvalues::colour_values(rep(100, 5), alpha = df$id) == plot$fill_colour) )
	# expect_true( all(plot$tooltip == 20) )

})

test_that("different palette choice work", {

	# # other colourvalues palettes
	# map <- mapdeck(token = 'abc')
	# set.seed(1)
	# n <- 5
	# df <- data.frame(
	# 	id = 1:n
	# 	, lon = sample(-180:180, size = n, replace = T)
	# 	, lat = sample(-90:90, size = n, replace = T)
	# 	, polyline = sample(letters, size = n, replace = T)
	# 	, rad = 1:n
	# 	, sample = rnorm(n)
	# 	, stringsAsFactors = F
	# 	, palette = "inferno"
	# )
	# l <- list(mapdeck::add_scatterplot, map = map, data = df, lon = "lon",
	# 					lat = "lat", polyline = "polyline", radius = 20, fill_colour = 100,
	# 					fill_opacity = "id", tooltip = "20", palette = "inferno")
	#
	# plot <- mapdeck:::rcpp_scatterplot(df, l)
	# expect_true( attr(plot, "class") == "json")
	# plot <- jsonlite::fromJSON( plot )
	#
	# expect_true( all(colourvalues::colour_values(rep(100, 5), palette = "inferno", alpha = df$id) == plot$fill_colour) )
	#
	# ## matrix palette
	# map <- mapdeck(token = 'abc')
	# r <- seq(0,255)
	# g <- seq(255, 0)
	# b <- rep(255, 256)
	# a <- rep(0, 256)
	# pal <- matrix(c(r,g,b,a), ncol = 4)
	# set.seed(1)
	# n <- 5
	# df <- data.frame(
	# 	id = 1:n
	# 	, lon = sample(-180:180, size = n, replace = T)
	# 	, lat = sample(-90:90, size = n, replace = T)
	# 	, polyline = sample(letters, size = n, replace = T)
	# 	, rad = 1:n
	# 	, sample = rnorm(n)
	# 	, stringsAsFactors = F
	# 	, palette = pal[1:5, 1:3]
	# )
	#
	# l <- list(mapdeck::add_scatterplot, map = map, data = df, lon = "lon",
	# 					lat = "lat", polyline = "polyline", radius = 20, fill_colour = "id",
	# 					fill_opacity = "id", tooltip = "20", palette = pal[1:5,1:3])
	#
	# plot <- mapdeck:::rcpp_scatterplot(df, l)
	# expect_true( attr(plot, "class") == "json")
	# plot <- jsonlite::fromJSON( plot )
	#
	# expect_true( all(colourvalues::colour_values(df$id, palette = pal[1:5,1:3], alpha = df$id) == plot$fill_colour) )
	#
	# ## matrix with alpha
	# set.seed(1)
	# n <- 5
	# df <- data.frame(
	# 	id = 1:n
	# 	, lon = sample(-180:180, size = n, replace = T)
	# 	, lat = sample(-90:90, size = n, replace = T)
	# 	, polyline = sample(letters, size = n, replace = T)
	# 	, rad = 1:n
	# 	, sample = rnorm(n)
	# 	, stringsAsFactors = F
	# 	, palette = pal[1:5,]
	# )
	#
	# l <- list(mapdeck::add_scatterplot, map = map, data = df, lon = "lon",
	# 					lat = "lat", polyline = "polyline", radius = 20, fill_colour = "id",
	# 					fill_opacity = "id", tooltip = "20", palette = pal[1:5,])
	#
	# plot <- mapdeck:::rcpp_scatterplot(df, l)
	# expect_true( attr(plot, "class") == "json")
	# plot <- jsonlite::fromJSON( plot )
	#
	# expect_true( all(colourvalues::colour_values(df$id, palette = pal[1:5,], alpha = df$id) == plot$fill_colour) )
})

test_that("opacity can be a single value, or a column of data", {

		# ## TODO( n == 2 fails colourvalues::colour_values)
		# map <- mapdeck(token = 'abc')
		# set.seed(1)
		# n <- 5
		# df <- data.frame(
		# 	id = 1:n
		# 	, lon = sample(-180:180, size = n, replace = T)
		# 	, lat = sample(-90:90, size = n, replace = T)
		# 	, polyline = sample(letters, size = n, replace = T)
		# 	, rad = 1:n
		# 	, sample = rnorm(n)
		# 	, stringsAsFactors = F
		# )
		# l <- list(mapdeck::add_scatterplot, map = map, data = df, lon = "lon",
		# 					lat = "lat", polyline = "polyline", radius = "rad", fill_colour = "id",
		# 					fill_opacity = 100, tooltip = "id", palette = "viridis")
		#
		# plot <- mapdeck:::rcpp_scatterplot(df, l)
		# expect_true( attr(plot, "class") == "json")
		# plot <- jsonlite::fromJSON( plot )
		#
		# expect_true( all(colourvalues::colour_values(df$id, alpha =100) == plot$fill_colour) )
		#
		# ## TODO( n == 2 fails colourvalues::colour_values)
		# map <- mapdeck(token = 'abc')
		# set.seed(1)
		# n <- 5
		# df <- data.frame(
		# 	id = 1:n
		# 	, lon = sample(-180:180, size = n, replace = T)
		# 	, lat = sample(-90:90, size = n, replace = T)
		# 	, polyline = sample(letters, size = n, replace = T)
		# 	, rad = 1:n
		# 	, sample = rnorm(n)
		# 	, stringsAsFactors = F
		# )
		# l <- list(mapdeck::add_scatterplot, map = map, data = df, lon = "lon",
		# 					lat = "lat", polyline = "polyline", radius = "rad", fill_colour = "id",
		# 					fill_opacity = "rad", tooltip = "id", palette = "viridis")
		#
		# plot <- mapdeck:::rcpp_scatterplot(df, l)
		# expect_true( attr(plot, "class") == "json")
		# plot <- jsonlite::fromJSON( plot )
		#
		# expect_true( all(colourvalues::colour_values(df$id, alpha = df$rad) == plot$fill_colour) )

})

test_that("na_colour works", {

	# map <- mapdeck(token = 'abc')
	# set.seed(1)
	# n <- 5
	# df <- data.frame(
	# 	id = c(1,2,NA,4,NA)
	# 	, lon = sample(-180:180, size = n, replace = T)
	# 	, lat = sample(-90:90, size = n, replace = T)
	# 	, polyline = sample(letters, size = n, replace = T)
	# 	, rad = 1:n
	# 	, sample = rnorm(n)
	# 	, stringsAsFactors = F
	# )
	# l <- list(mapdeck::add_scatterplot, map = map, data = df, lon = "lon",
	# 					lat = "lat", polyline = "polyline", radius = "rad", fill_colour = "id",
	# 					fill_opacity = 100, tooltip = "id", palette = "viridis", na_colour = "#000000FF")
	#
	# plot <- mapdeck:::rcpp_scatterplot(df, l)
	# expect_true( attr(plot, "class") == "json")
	# plot <- jsonlite::fromJSON( plot )
	# expect_true( unique(plot[c(3,5), "fill_colour"]) == "#000000FF")
	#
	# l <- list(mapdeck::add_scatterplot, map = map, data = df, lon = "lon",
	# 					lat = "lat", polyline = "polyline", radius = "rad", fill_colour = "id",
	# 					fill_opacity = 100, tooltip = "id", palette = "viridis")
	#
	# plot <- mapdeck:::rcpp_scatterplot(df, l)
	# expect_true( attr(plot, "class") == "json")
	# plot <- jsonlite::fromJSON( plot )
	# expect_true( unique(plot[c(3,5), "fill_colour"]) == "#808080FF")

})
