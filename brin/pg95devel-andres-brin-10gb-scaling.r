# R --slave --no-save < pg95devel-andres-brin-10gb-scaling.r

df10 <- read.csv("pg95devel-andres-brin-10gb-scaling.csv", header=T)
df30 <- read.csv("pg95devel-andres-brin-30gb-scaling.csv", header=T)

colors <- rainbow(2)
pch <- seq.int(1, 2)

# https://wiki.postgresql.org/wiki/Color_Palette
#color="#0064a5"

bitmap("pg95devel-andres-brin-10gb-scaling.png", type="png16m", units="px",
       width=888, height=555, res=150, taa=4, gaa=4)

plot(df10$streams, df10$throughput, col=colors[1], type="b", pch=pch[1],
     ylim=c(0, max(df10$throughput)),
     main="DBT3 PostgreSQL 9.5devel (andres&brin) Throughput Test Scaling",
     xlab="Number of Streams",
     ylab="Numerical Quanitity")
points(df30$streams, df30$throughput, col=colors[2], type="b", pch=pch[2])

legend('bottomright', c("10GB", "30GB"), col=colors, pch=pch)

grid(col="gray")
dev.off()
