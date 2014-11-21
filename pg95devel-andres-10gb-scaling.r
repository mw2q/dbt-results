# R --slave --no-save < pg95devel-andres-10gb-scaling.r

df <- read.csv("pg95devel-andres-10gb-scaling.csv", header=T)

# https://wiki.postgresql.org/wiki/Color_Palette
color="#336791"

bitmap("pg95devel-andres-10gb-scaling.png", type="png16m", units="px",
       width=888, height=555, res=150, taa=4, gaa=4)

plot(df$streams, df$throughput, col=color, type="b",
     ylim=c(0, max(df$throughput)),
     main="DBT3 PostgreSQL 9.5devel (andres) Throughput Test Scaling",
     xlab="Number of Streams",
     ylab="Numerical Quanitity")
grid(col="gray")
dev.off()
