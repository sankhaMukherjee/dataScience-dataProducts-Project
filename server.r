library(shiny)
library(caret)

shinyServer(
    function(input, output, session) {
        
        output$Result <- renderTable({
            
            # Take a dependency on input$goButton
            input$goButton
            
            inFile <- isolate(input$file1)
            if (is.null(inFile)) return(NULL)
            
            quote <- isolate(switch(input$quote,
                            'NoSep'  = '',
                            'SC'     = "'",
                            'DC'     = '"'
            ))
            
            data       <- read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=quote)
            colName    <- isolate(input$predictCol)
            splitRatio <- isolate(input$decimal)
            method     <- isolate(input$model)
            
            inTraining <- createDataPartition( data[, colName] , p = splitRatio, list = FALSE)
            
            training <- data[ inTraining,]
            testing  <- data[-inTraining,]
            
            model <- train( training[,colnames(training) != colName], training[,colName], method=method )
            
            prediction <- as.data.frame(predict(model, newdata = testing))
            
            colnames(prediction) <- c('Prediction')
            prediction['Actual'] <- testing[[colName]]
            
            prediction
            
        })
        
        output$data <- renderTable({
            
            ###############################################################
            # The file input is adapted from 
            # http://shiny.rstudio.com/gallery/file-upload.html
            ###############################################################
            # input$file1 will be NULL initially. After the user selects
            # and uploads a file, it will be a data frame with 'name',
            # 'size', 'type', and 'datapath' columns. The 'datapath'
            # column will contain the local filenames where the data can
            # be found. 
            
            # Note that this will only read a maximum of 
            # 50 rows. This is because we just want to read the first few 
            # rows to see of the data is ok. For the actual calculation the 
            # entire data will be read in. 
            
            ###############################################################
            # Note that no attempt has been made at trying to check whether 
            # the file is ok for input. This function will simply get the 
            # file and display the data available ...
            ###############################################################
            
            inFile <- input$file1
            
            if (is.null(inFile)) return(NULL)
            
            quote <- switch(input$quote,
                        'NoSep'  = '',
                        'SC'     = "'",
                        'DC'     = '"'
                     )
            
            data <- read.csv(inFile$datapath, header=input$header, sep=input$sep, 
                     quote=quote, nrows=50)
            
            updateSelectInput(session, 'predictCol', choices = colnames(data))
            
            data
        })
        
        output$output1 <- renderText({'This is where the output goes'})
        
        
        
    }    
)
