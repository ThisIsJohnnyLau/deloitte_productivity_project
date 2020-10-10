
charting_function <- function(x, y, group){
    ggplot() +
        aes(x = x, y = y, group = group, colour = group) +
        geom_line() +
        theme(
            axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 0, size = 15, face = "bold"),
            axis.text.y = element_text(angle = 90, vjust = 0.5, hjust = 0, size = 15, face = "bold"),
            axis.title.x = element_blank(),
            axis.title.y = element_text(angle = 90, size = 15),
            legend.position = "bottom") +
        ggtitle(region)+
        ylim(0,35) +    ylab(y)
}
