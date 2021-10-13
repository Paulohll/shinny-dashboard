# Used packages
pacotes = c("shiny", "shinydashboard", "shinythemes", "plotly", "shinycssloaders","tidyverse",
            "scales", "knitr", "kableExtra", "ggfortify","dplyr","plotly","FNN")

# Run the following command to verify that the required packages are installed. If some package
# is missing, it will be installed automatically
package.check <- lapply(pacotes, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
  }
})

# Definimos data
data <- read.csv ('dataplayers.csv')

#renombramos cabeceras
names(data)[1] <- "player"
names(data)[2] <- "position"
names(data)[3] <- "team"
names(data)[4] <- "duracion"
names(data)[5] <- "dtotal"
names(data)[6] <- "mmin"
names(data)[7] <- "d21km"
names(data)[8] <- "d21kmrel"
names(data)[9] <- "sprint"
names(data)[10] <- "maxvel"
names(data)[11] <- "load"
names(data)[12] <- "asim"
names(data)[13] <- "d8595"
names(data)[14] <- "d95100"
names(data)[15] <- "imphi"
names(data)[16] <- "impnum"
names(data)[17] <- "salto"
names(data)[18] <- "hmdl"
