df <- read.csv("FileToPlot.tsv", sep="\t", header = T)
library(ggplot2)
library(hrbrthemes)
ggplot(df, aes(x=virus_full)) + geom_bar() + xlab("Virus") + ylab("# tumors detected in") + 
  labs(title = "Viruses detected in # tumors") + theme(axis.text.x=element_text(angle = 45, hjust = 1))

ggplot(df, aes(x=virus_full, y=mapped)) + xlab("Virus") + ylab("# reads mapped per tumor") + 
  labs(title = "Number of reads mapped") + theme(axis.text.x=element_text(angle = 45, hjust = 1)) + geom_point()

x <- unique(df$virus_full)
y <- unique(paste0(df$patient, "_", df$tumor))
data <- expand.grid(X=x, Y=y)
as.data.frame(data)
data$check <- ifelse(is.na(match(paste0(paste0(data$X, data$Y)), 
                   paste0(df$virus_full, paste0(df$patient, "_", df$tumor)))),0,1)


data$count <- ifelse(is.na(match(paste0(paste0(data$X, data$Y)), 
                                 paste0(df$virus_full, paste0(df$patient, "_", df$tumor)))),0,
                     df[which(df$id == paste0(df$virus_full, paste0(df$patient, "_", df$tumor))), ]$id)


count_df <- data.frame(col1=paste0(df$virus_full, paste0(df$patient, "_", df$tumor)), col2=
                       df[which(df$id == paste0(df$virus_full, paste0(df$patient, "_", df$tumor))), ]$mapped)

# Heatmap 
ggplot(data, aes(x=X, y=Y, fill=check)) +
  theme(axis.ticks=element_blank()) + 
  theme(axis.text.x=element_text(angle = 45, hjust = 1)) + 
  scale_fill_gradient('check', limits=c(0, 1), breaks = c(0, 1),  low = "lightblue", high = "darkblue") +
  labs(x="Viruses", y="Tumor ID", title="Virus presence/absence in 41 tumors") +
  geom_tile() 

ggplot(data, aes(x=X, y=Y, fill=count)) + coord_equal() +
  theme(axis.ticks=element_blank()) + 
  theme(axis.text.x=element_text(angle = 45, hjust = 1)) + 
  labs(x="Viruses", y="Tumor ID", title="Virus presence/absence in 33 tumors") +
  geom_tile() 

dat <- data.frame(person=factor(paste0(df$patient, "_", df$tumor), 
                                levels =rev(paste0(df$patient, "_", df$tumor))), matrix(sample(LETTERS[1:5], 205, T), ncol = 5))


df$id <- paste0(df$virus_full, paste0(df$patient, "_", df$tumor))
df[which(df$id == "Human endogenous retrovirus K1131_1"), ]$mapped
