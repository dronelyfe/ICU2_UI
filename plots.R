cars <- mpg
flowers <- iris

## ex. mockup for now; We just want to try out some geometries and such
## then, we can be ready to just slot our production plots right in.
carplot <- ggplot(data = cars, aes(x = model, y = displ)) + geom_point()

