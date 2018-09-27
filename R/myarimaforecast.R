#' SST off the WEST Coast of india
#'
#' This fits an Arima model to data with forecast's auto.arima() function and plots
#' a forecast with the forecast() function.
#'
#' @param data A vector (time series) of data
#' @param nyears Number of time steps to forecast forward
#' @return A plot of a forecast.
#' @examples
#' dat <- WWWusage
#' myarimaforecast(dat, nyears=100)
#' @export
myarimaforecast <- function(data, nyears=10)
  # This is how I would write these 3 lines using a pipe
  # data %>% auto.arima %>% forecast(h = nyears) %>% plot
  fit <- forecast::auto.arima(data)
  fc <- forecast::forecast(fit, h = nyears)
  plot(fc)
}

