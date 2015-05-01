library(tikzDevice)

## bug-proneness alteration example

xcoords = c(0, 2, 3, 5, 6, 9, 11, 12, 13, 15)
ycoords = c(0.2, 0.5, 0.9, 1.0, 0.0, 0.3, 0.7, 1.0, 0.0, 0.2)
labels = c("commit 1", "commit 2", "commit 3", "commit 4", "\\textbf{bug-fix 1}",
           "commit 6", "commit 7", "commit 8", "\\textbf{bug-fix 2}", "commit 10")

tikz("bug_proneness.tex", width = 6, height = 3)
par(mar = c(5.2,4,0.5,0.5))
plot(xcoords, ycoords, xlab = "", ylab = "bug-proneness", type = "l", xaxt = "n")
axis(1, at = xcoords, labels = labels, las = 2)
abline(v = 6, lty = "dotted", lwd = 4)
abline(v = 13, lty = "dotted", lwd = 4)
dev.off()


## bug-proneness estimation strategies

xcoords = 1:9
labels = labels[1:9]
sizes1 = c(35, 56, 9, 21)
sizes2 = c(7, 38, 16)
lin = c(0.25, 0.5, 0.75, 1, 0, 1/3, 2/3, 1, 0)
geom = c(0.125, 0.25, 0.5, 1, 0, 0.25, 0.5, 1, 0)
weight = c(cumsum(sizes1 / sum(sizes1)), 0, cumsum(sizes2 / sum(sizes2)), 0)

tikz("bug_proneness_strategies.tex", width = 6, height = 3.5)
par(mar = c(5.2,4,2.5,0.5))
plot(xcoords, lin, xlab = "", ylab = "bug-proneness", type = "l", xaxt = "n", lty = "dashed")
points(xcoords, lin, pch = 16)
lines(xcoords, geom, lty = "dotted")
points(xcoords, geom, pch = 16)
lines(xcoords, weight)
points(xcoords, weight, pch = 16)
axis(1, at = xcoords, labels = labels, las = 2)
legend("top", c("linear", "geometric", "weighted"), lty = c("dashed", "dotted", "solid"), 
       pch = c(16, 16, 16), seg.len = 3, horiz = T, inset = -0.15, bty = "n", xpd = T, 
       text.width = rep(1.7, 3))
dev.off()


## SVM example

tikz("svm.tex", width = 5.25, height = 3)
par(mar = c(3,3,3,1))
par(mfrow = c(1,2))

c1_xcoords = c(1,2,2,3,4,5,6)
c1_ycoords = c(8,5,7,6,9,8,9)
c2_xcoords = c(5,6,7,8,9)
c2_ycoords = c(1,2,3,1,3)

plot(c1_xcoords, c1_ycoords, xlab = "", ylab = "", type = "p", pch = 1,
     xlim = c(0,10), ylim = c(0,10), main = "A", xaxt = "n", yaxt = "n")
mtext("$x_1$", side = 1, line = 1)
mtext("$x_2$", side = 2, line = 1)
points(c2_xcoords, c2_ycoords, pch = 16)
lines(-1:11, -1:11)
lines(-1:11, -1:11 + 2, lty = "dashed")
lines(-1:11, -1:11 - 2, lty = "dashed")
points(5, 7, pch = 16, col = "white", cex = 1.3)
points(5, 7, pch = 1, cex = 1.3)
points(c(5,8), c(3,6), pch = 16, cex = 1.3)

c1_xcoords = c(1,2,2,3,4,5)
c1_ycoords = c(8,5,7,6,9,8)
c2_xcoords = c(5,6,7,8,8,9)
c2_ycoords = c(1,2,3,1,6,3)

plot(c1_xcoords, c1_ycoords, xlab = "", ylab = "", type = "p", pch = 1,
     xlim = c(0,10), ylim = c(0,10), main = "B", xaxt = "n", yaxt = "n")
mtext("$x_1$", side = 1, line = 1)
mtext("$x_2$", side = 2, line = 1)
points(c2_xcoords, c2_ycoords, pch = 16)
lines(2:10, 2:10 * 2 -5)
lines(2:10 - 1, 2:10 * 2 -5, lty = "dashed")
lines(2:10 + 1, 2:10 * 2 -5, lty = "dashed")
points(c(5,6), c(7,9), pch = 16, col = "white", cex = 1.3)
points(c(5,6), c(7,9), pch = 1, cex = 1.3)
points(5, 3, pch = 16, cex = 1.3)
dev.off()
