


library("RQGIS")
set_env()
open_app()
#
info_r <- version
info_qgis <- qgis_session_info()
c(platform = info_r$platform, R = info_r$version.string, info_qgis)
#
find_algorithms(search_term = "curvature",
name_only = TRUE)
open_help(alg = "grass7:r.slope.aspect")
get_usage(alg = "grass7:r.slope.aspect")
#
params <- get_args_man(alg = "grass7:r.slope.aspect", options = TRUE)
#
data("dem", package = "RQGIS")
out <- run_qgis(alg = "grass7:r.slope.aspect",
elevation = dem,
pcurvature = file.path(tempdir(), "pcurv.tif"),
tcurvature = file.path(tempdir(), "tcurv.tif"),
show_output_paths = FALSE,
load_output = TRUE)
#
params$elevation <- dem
params$pcurvature <- file.path(tempdir(),"pcurv.tif")
params$tcurvature <- file.path(tempdir(),"tcurv.tif")
out <- run_qgis(alg = "grass7:r.slope.aspect",
params = params,
load_output = TRUE,
show_output_paths = FALSE)
class(out)
names(out)
#
library(raster)
plot(stack(out))
