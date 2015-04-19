library(tikzDevice)

xcoords = c(0, 2, 3, 5, 6, 9, 11, 12, 13, 15)
ycoords = c(0.2, 0.5, 0.9, 1.0, 0.0, 0.3, 0.7, 1.0, 0.0, 0.2)
labels = c("commit 1", "commit 2", "commit 3", "commit 4", "bug-fix 1",
           "commit 6", "commit 7", "commit 8", "bug-fix 2", "commit 10")

tikz("bug_proneness.tex", width = 6, height = 3)
par(mar = c(5,4,0.5,0.5))
plot(xcoords, ycoords, xlab = "", ylab = "bug-proneness", type = "l", xaxt = "n")
axis(1, at = xcoords, labels = labels, las = 2)
abline(v = 6, lty = "dotted")
abline(v = 13, lty = "dotted")
dev.off()
