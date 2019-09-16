library(ggplot2)
library(extrafont)

loadfonts()

pdf("ggplot_cm.pdf", width=4, height=4)
p <- qplot(c(1,5), c(1,5)) + xlab("Made with CM fonts") + ylab("Made with CM fonts") + ggtitle("Made with CM fonts") +  theme(text=element_text(family="CM Roman", size=14))
ggsave("ggplot_cm.pdf", p, width=4, height=3.5)
embed_fonts("ggplot_cm.pdf", outfile="ggplot_cm_embed.pdf")
# # Equation
# eq <- "italic(sum(frac(1, n*'!'), n==0, infinity) ==
#        lim(bgroup('(', 1 + frac(1, n), ')')^n, n %->% infinity))"

# # Without the new fonts
# p + annotate("text", x=3, y=3, parse=TRUE, label=eq)

# # With the new fonts
# p + annotate("text", x=3, y=3, parse=TRUE, family="CM Roman", label=eq) +
#     theme(text         = element_text(size=16, family="CM Roman"),
#           axis.title.x = element_text(face="italic"),
#           axis.title.y = element_text(face="bold"))

dev.off()

# Embed the fonts
# embed_fonts("ggplot_cm.pdf", outfile="ggplot_cm_embed.pdf")