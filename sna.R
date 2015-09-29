# install.packages('sna')
# install.packages('igraph')
# install.packages('network')
# install.packages('statnet')
library(sna)
library(igraph)
library(network)
library(statnet)
# http://web.stanford.edu/~messing/RforSNA.html

#header = TRUE indica che la prima riga rappresenta i nomi delle colonne
#spe = ";" indica che i dati sono seprati da ";"
chefMatrix <- read.table("/home/lorenzo/Dropbox/Andrea Sna/QST.csv",  header = TRUE ,sep = ";")

#riscrivo in chefMatrix esclusivamente le colonne dalla terza all'ultima
#ncol(chefMatrix) restituisce il numero di colonne
chefMatrix <- chefMatrix[,3:ncol(chefMatrix)]

#data.matrix converte il data.frame in data.matrix
chefMatrix <- data.matrix(chefMatrix)

#assegno alle righe lo stesso nome delle colonne
rownames(chefMatrix) <-  colnames(chefMatrix)

#creo un oggetto grafo utilizzando la funzione graph_from_adjacency_matrix che
#si aspetta come input una matrix
chefGraph <- graph_from_adjacency_matrix(chefMatrix)

#plot.igraph disegna il grafo passadogli l'oggetto grafo
plot.igraph(chefGraph,  layout=layout.fruchterman.reingold)

#calcolo closeness
chefCloseness <- closeness(chefGraph)
print(chefCloseness)

#calcolo betweenness
chefBetweenness <- betweenness(chefGraph)
print(chefBetweenness)

#gabola
#colnames(chefMatrix) <- chefCloseness
#chefGraph <- graph_from_adjacency_matrix(chefMatrix)
#plot.igraph(chefGraph,  layout=layout.fruchterman.reingold)

#installare Rstudio https://www.rstudio.com/products/rstudio/download/

library(knitr)

chefCloseness <- data.frame(chefCloseness = chefCloseness)

chefBetweenness <- data.frame(chefBetweenness  = chefBetweenness)

kable(chefCloseness)

kable(chefBetweenness)
