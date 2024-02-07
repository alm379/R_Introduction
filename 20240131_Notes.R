# Data structures
cats_df <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1,5.0,3.2),
                   likes_strings = c(1,0,1))
#c combines values into a vector or list
rm(cats)
#remove previous data frame that was created and named "cats" prior to "cats_df"
cats_df

?data.frame
?c

#? pulls up help sheet for commands

str(cats_df)

#str for structure

cats_df$weight+ 2
#adding bumerical with categorical?
cats_df$weight+cats_df$coat
#Error in cats_df$weight + cats_df$coat : 
#non-numeric argument to binary operator

paste("My cat is", cats_df$coat)

#Data structures
typeof(cats_df$weight)
#lists data type, in this case "double"
typeof(TRUE)
#lists data type, in this case "logical"
typeof(cats_df$coat)
#lists data type, in this case "character"

#Writing files
write.csv(x=cats_df, file = "cats_df.csv", row.names=FALSE, quote=FALSE)
#default parameters will include quotes (quote = TRUE) and row names (row.names =TRUE)

#Marix
example_mat <- matrix(0,ncol=6,nrow=3)
example_mat

#Dimensions
dim(example_mat)
dim(cats_df)


#Subsetting
head(cats_df)
cats_df[3]
#third column in dataframe
#functionally the same as
cats_df$likes_strings
#returns vector 
str(cats_df[1])
str(cats_df$coat)
#different data structure outputs

cats_df[1,]
#full first row
cats_df[1,2]
#row 1, column 2
cats_df[1:2,2]
#rows 1 and 2, column 2

#create numerical vector
1:10

example_mat[1:2,4:6]
#rows 1 and 2, columns 4,5,6

cats_df[c(1,3), c(1,3)]
#rows 1 and 3, columns 1 and 3

cats_df[c(1,1,1)]
#rows 1-3, 3 times

#Install package
install.packages("ggplot2")
library("ggplot2")

download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", destfile = "gapminder_data.csv")

gapminder_df <- read.csv(file="gapminder_data.csv")
str(gapminder_df)
dim(gapminder_df)

#plot data
ggplot(data=gapminder_df, 
       mapping = aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(alpha=0.5, aes(color=continent))+
  labs(x = "GDP Per Capita", y = "Life Expectancy (yrs)") +
  scale_x_log10()+
  geom_smooth(method = "lm")
  #make multiple plots by continent
  #facet_wrap(.~continent)

#make a plot, modify the shapes and the size (related to population) of the point
?ggplot2

ggplot(data=gapminder_df, 
       mapping = aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(alpha=0.5, 
             aes(color=continent,
                shape=continent, 
                size=pop))+
  labs(x = "GDP Per Capita", y = "Life Expectancy (yrs)") +
  scale_x_log10()+
  geom_smooth(method = "lm")

#For specific shape, shape=shape outside of aes()
ggplot(data=gapminder_df, 
       mapping = aes(x=gdpPercap, y=lifeExp)) + 
  geom_point(alpha=0.5, 
             aes(color=continent,
                 size=pop), shape=8)+
  labs(x = "GDP Per Capita", y = "Life Expectancy (yrs)") +
  scale_x_log10()+
  geom_smooth(method = "lm")
  

#alpha refers to opacity (or transparency of geom)
#labs refers to labels
# ".~" or "~" = "by". "~." after category will configure in opposite direction from ".~" before category for facet_grid
#facet_grid similar to facet_wrap

head(gapminder_df)

#Evaluating lifeExp by year
ggplot(data = gapminder_df, 
       mapping = aes(x=year, y =lifeExp,
                     #grouping the data
                     group = continent))+
  #add line to connect years
  geom_line()+
  geom_point(aes(color=continent))
#color continent only for point, not line



#What software do I have?
#always include session info in document for traceability 
sessionInfo()
