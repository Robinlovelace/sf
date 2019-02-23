context("sf: st_crs tests")

test_that("st_sample works", {
	nc = read_sf(system.file("shape/nc.shp", package="sf"))
	n = 100
	sample_default = st_sample(x = nc, size = n)
	expect_s3_class(sample_default, "sfc")
	sample_exact = st_sample(x = nc, size = n, exact = TRUE)
	expect_equal(length(sample_exact), n)

	# test to identify issue - see https://github.com/r-spatial/sf/issues/985
	# to reproduce:
	# remotes::install_github("robinlovelace/sf", "update-st_sample_exact2")
	# mtq = sf::st_read(system.file("gpkg/mtq.gpkg", package="cartography"))
	# mtq_pencil = cartography::getPencilLayer(x = mtq)
	#
	# # test with single multipolygon feature:
	# nc_multipolygon = st_cast(nc, "MULTIPOLYGON")
})
