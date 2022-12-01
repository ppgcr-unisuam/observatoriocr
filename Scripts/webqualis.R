# read QUALIS xlsx file (download from https://sucupira.capes.gov.br/sucupira/public/consultas/coleta/veiculoPublicacaoQualis/listaConsultaGeralPeriodicos.jsf)
qualis <-
  data.frame(read_excel(
    file.path(
      "Metrics",
      "Qualis",
      "WebQualis_Compilada_2021.xlsx"
    ),
    sheet = 1,
    col_types = c("text")
  ))

# estratos Qualis
estratos <- sort(unique(qualis$Estrato))

qualis.base <- table(qualis$Estrato) / length(qualis$Estrato) * 100
qualis.PPG <- c()
for(i in 1:length(estratos)){
  qualis.PPG[i] <- sum(artigos$WebQualis == estratos[i])/length(artigos$WebQualis) * 100
}
names(qualis.PPG) <- estratos