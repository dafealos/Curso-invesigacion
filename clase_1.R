library(tidyverse)
library(datos)



# Resumen -----------------------------------------------------------------

flor <- flores

str(flor)
summary(flor)
glimpse(flor)
head(flor)


# Pipeline ------------------ ctr + shift + M--------------------------------------- %>% 

x <- c(1, 4, 6, 8)
y <- round(mean(sqrt(log(x))), 2)
y

x <- c(1, 4, 6, 8)
y <- x %>% log() %>% sqrt() %>% mean() %>% round(2)

## Dplyr


# Group_by ------- summarize---------------------------------------------------------

sp <- flor %>% 
        group_by(Especies)  %>% 
        summarize(promedio_sepalo =  mean(Largo.Sepalo),
                  desviacion = sd(Largo.Sepalo), numero = n()
                                            )


# Mutate ------------------------------------------------------------------

df <- flor %>% mutate(ratio = Largo.Sepalo/Ancho.Sepalo)

ggplot(df, aes(x = Especies, y = ratio)) + geom_boxplot()


# Filter ------------------------------------------------------------------

        
filtro <- flor %>% 
        filter(Especies != "versicolor") %>% 
        group_by(Especies) %>% 
        summarise_all(mean)


