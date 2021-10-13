function(input, output, session) {
  
    selectedData1 <- reactive({
      data %>%
      filter(data$player == input$player)})
    
    selectedData2 <- reactive({
      selectedData1() %>%
        select(1,4,6,7,9,10,11,12,13,14,15,17)
    })
    
    # selectedData3 <- reactive({
    #   data %>%
    #     select(1,4,5,6,7,10,39,26,34,24,25,12,13,14,15,16,23,17,
    #            18,19,20,28,27,22,21,29,30,31,32,33) %>%
    #     filter(data$player == gsub("[[:space:]]*$","",gsub("- .*",'',input$player))) 
      
    # })
    
    # selectedData4 <- reactive({
    #   rbind(selectedData1(),selectedData1())
    # })
    
    
    
    
    selectedData5 <- reactive({
      selectedData2() %>%
      select(2:12)
    })
    

     obsB <- observe({
      print(selectedData5())
    })

    # selectedData6 <- reactive({
    # as.numeric(knnx.index(selectedData5(), selectedData5()[1, , drop=FALSE], k=11))
    # })
    
    # selectedData7 <- reactive({
    #   selectedData4()[selectedData6(),]
    # })
    
    # selectedData8 <- reactive({
    #   selectedData7() %>%
    #     select(8:30)
    # })


    # Combine the selected variables into a new data frame
  output$plot1 <- renderPlotly({
    
    # validate(
    #   need(dim(selectedData2())[1]>=10, "Sorry, no ten similar players were found. 
    #        Please change the input filters."
    #   )
    #   )

    plot_ly(
      type = 'scatterpolar',
      mode = "closest",
      fill = 'toself'
    ) %>%
      add_trace(
        r = as.matrix(selectedData5()[1,]),
        theta = c("duracion","mmin","d21km","sprint","maxvel","load","asim",
                  "d8595","d95100","imphi","salto"),
        showlegend = TRUE,
        mode = "markers",
        name = selectedData1()[1,1]
      ) %>%
      # add_trace(
      #   r = as.matrix(selectedData8()[2,]),
      #   theta = c("BAL","STM","SPE","EXP","ATT","BCO","DRI","LPAS","APAS",
      #             "KPOW","FIN","PKIC","SWE","HEA","JUM","PHY","BWIN","DEF",
      #             "GOA","GKC","CLE","REF","COV"),
      #   showlegend = TRUE,
      #   mode = "markers",
      #   visible="legendonly",
      #   name = selectedData7()[2,1]
      # ) %>%
      # add_trace(
      #   r = as.matrix(selectedData8()[3,]),
      #   theta = c("BAL","STM","SPE","EXP","ATT","BCO","DRI","LPAS","APAS",
      #             "KPOW","FIN","PKIC","SWE","HEA","JUM","PHY","BWIN","DEF",
      #             "GOA","GKC","CLE","REF","COV"),
      #   showlegend = TRUE,
      #   mode = "markers",
      #   visible="legendonly",
      #   name = selectedData7()[3,1]
      # ) %>%
      # add_trace(
      #   r = as.matrix(selectedData8()[4,]),
      #   theta = c("BAL","STM","SPE","EXP","ATT","BCO","DRI","LPAS","APAS",
      #             "KPOW","FIN","PKIC","SWE","HEA","JUM","PHY","BWIN","DEF",
      #             "GOA","GKC","CLE","REF","COV"),
      #   showlegend = TRUE,
      #   mode = "markers",
      #   visible="legendonly",
      #   name = selectedData7()[4,1]
      # ) %>%
      # add_trace(
      #   r = as.matrix(selectedData8()[5,]),
      #   theta = c("BAL","STM","SPE","EXP","ATT","BCO","DRI","LPAS","APAS",
      #             "KPOW","FIN","PKIC","SWE","HEA","JUM","PHY","BWIN","DEF",
      #             "GOA","GKC","CLE","REF","COV"),
      #   showlegend = TRUE,
      #   mode = "markers",
      #   visible="legendonly",
      #   name = selectedData7()[5,1]
      # ) %>%
      # add_trace(
      #   r = as.matrix(selectedData8()[6,]),
      #   theta = c("BAL","STM","SPE","EXP","ATT","BCO","DRI","LPAS","APAS",
      #             "KPOW","FIN","PKIC","SWE","HEA","JUM","PHY","BWIN","DEF",
      #             "GOA","GKC","CLE","REF","COV"),
      #   showlegend = TRUE,
      #   mode = "markers",
      #   visible="legendonly",
      #   name = selectedData7()[6,1]
      # ) %>%
      # add_trace(
      #   r = as.matrix(selectedData8()[7,]),
      #   theta = c("BAL","STM","SPE","EXP","ATT","BCO","DRI","LPAS","APAS",
      #             "KPOW","FIN","PKIC","SWE","HEA","JUM","PHY","BWIN","DEF",
      #             "GOA","GKC","CLE","REF","COV"),
      #   showlegend = TRUE,
      #   mode = "markers",
      #   visible="legendonly",
      #   name = selectedData7()[7,1]
      # ) %>%
      # add_trace(
      #   r = as.matrix(selectedData8()[8,]),
      #   theta = c("BAL","STM","SPE","EXP","ATT","BCO","DRI","LPAS","APAS",
      #             "KPOW","FIN","PKIC","SWE","HEA","JUM","PHY","BWIN","DEF",
      #             "GOA","GKC","CLE","REF","COV"),
      #   showlegend = TRUE,
      #   mode = "markers",
      #   visible="legendonly",
      #   name = selectedData7()[8,1]
      # ) %>%
      # add_trace(
      #   r = as.matrix(selectedData8()[9,]),
      #   theta = c("BAL","STM","SPE","EXP","ATT","BCO","DRI","LPAS","APAS",
      #             "KPOW","FIN","PKIC","SWE","HEA","JUM","PHY","BWIN","DEF",
      #             "GOA","GKC","CLE","REF","COV"),
      #   showlegend = TRUE,
      #   mode = "markers",
      #   visible="legendonly",
      #   name = selectedData7()[9,1]
      # ) %>%
      # add_trace(
      #   r = as.matrix(selectedData8()[10,]),
      #   theta = c("BAL","STM","SPE","EXP","ATT","BCO","DRI","LPAS","APAS",
      #             "KPOW","FIN","PKIC","SWE","HEA","JUM","PHY","BWIN","DEF",
      #             "GOA","GKC","CLE","REF","COV"),
      #   showlegend = TRUE,
      #   mode = "markers",
      #   visible="legendonly",
      #   name = selectedData7()[10,1]
      # ) %>%
      # add_trace(
      #   r = as.matrix(selectedData8()[11,]),
      #   theta = c("BAL","STM","SPE","EXP","ATT","BCO","DRI","LPAS","APAS",
      #             "KPOW","FIN","PKIC","SWE","HEA","JUM","PHY","BWIN","DEF",
      #             "GOA","GKC","CLE","REF","COV"),
      #   showlegend = TRUE,
      #   mode = "markers",
      #   visible="legendonly",
      #   name = selectedData7()[11,1]
      # ) %>%
      layout(
        polar = list(
          radialaxis = list(
            visible = T,
            range = c(0,200)
          )
       ),
     
     showlegend=TRUE
      
        
      )
    
  })
  
}



