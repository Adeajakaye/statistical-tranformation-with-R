## statistical transformation

install.packages(("tidyverse"))
library(tidyverse)

diamonds
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds)+
  stat_count(mapping = aes(x = cut))

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")



demo <- tribble(
  ~cut,           ~freq,
  "fair",        1610,
  "Good",        4908,
  "veey Good",   12082,
  "prenium",     13791,
  "ideal",       21551
)

ggplot(data = demo)+
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")


ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, y =stat(prop), group = 1))

ggplot(data = diamonds)+
  stat_summary(mapping = aes(x = cut, y = depth),
               fun.ymin = min,
               fun.ymax = max,
               fun.y = median)

##positional adjustment

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, colour = cut))


ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")


ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

mpg
ggplot(data = mpg)+
  geom_bar(mapping = aes(x = hwy))
diamonds

ggplot(data = mpg)+
  geom_bar(mapping = aes(x = displ, fill = class), position = "fill")

##Coordinate system

ggplot(data = mpg)+
  geom_boxplot(mapping = aes(x = class, y = hwy))

ggplot(data = mpg, mapping = aes(x = class, y = hwy ))+
  geom_boxplot()+
  coord_flip()

nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()

ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)+
  coord_flip()+
  coord_polar()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()
