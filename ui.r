library(shiny)
require(markdown)
require(e1071)
require(randomForest)
require(arm)
require(MASS)
require(Matrix)
require(lme4)
require(kernlab)

shinyUI(fluidPage(

    titlePanel("Developing Data Products - Basic Data Workflow"),
    
    sidebarLayout(
        
        sidebarPanel(
            h3('Customized Workflow'),
            br(),
            
            ###############################################################
            # The file input is adapted from 
            # http://shiny.rstudio.com/gallery/file-upload.html
            ###############################################################
            tags$div( style = "background-color:#EEFFEE; border-color:#000000; border-style: dotted; padding: 10px; border-radius: 10px;", 
                list(
                    h4('Data Input'),
                    fileInput('file1', 'Choose CSV File', accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
                    tags$hr(),
                    checkboxInput('header', 'Header', TRUE),
                    selectInput('sep', 'Separator', c(Comma=',', Semicolon=';', Tab='\t'), ','),
                    selectInput('quote', 'Quote', c(NoSep='NoSep',DoubleQuote='DC',SingleQuote="SC"), 'DC')
                )
            ),
            
            ###############
            # Down Arrow
            ###############
            tags$div( align='center',
                img( src = "images/arrow-down.png", height='100', width='100', align='center')    
            ),
            
            
            #########################################################
            # Here we want to find the value of the training to 
            # testing ratio. The value is set to 80%:20%. Change
            # it to what you feel is a good value.
            #########################################################
            
            tags$div( style = "background-color:#EEFFEE; border-color:#000000; border-style: dotted; padding: 10px; border-radius: 10px;", 
                list(
                        h4("Training vs. tesitng"),
                        p("Ratio of training to testing data size"),
                        sliderInput("decimal", "Training:Testing", 
                                    min = 0, max = 1, value = 0.8, step= 0.01)),
                        selectInput('predictCol', 'Predict Column', c(Empty="Empty"))
            ),
            
            ###############
            # Down Arrow
            ###############
            tags$div( align='center',
                      img( src = "images/arrow-down.png", height='100', width='100', align='center')    
            ),
            
            
            tags$div( style = "background-color:#EEFFEE; border-color:#000000; border-style: dotted; padding: 10px; border-radius: 10px;", 
                list(
                    h4('Model Selection'),
                    selectInput('model', 'Model', c(RandomForests       = "rf", 
                                                    NeuralNets          = "nnet", 
                                                    LinearSVM           = "svmLinear", 
                                                    BayesianLinearModel = "bayesglm"), 'rf'))
            ),
            
            ###############
            # Down Arrow
            ###############
            tags$div( align='center',
                      img( src = "images/arrow-down.png", height='100', width='100', align='center')    
            ),
            
            tags$div( style = "background-color:#EEFFEE; border-color:#000000; border-style: dotted; padding: 10px; border-radius: 10px;", 
                list(
                        h4('Run Application'),
                        actionButton("goButton", "Run the training")
                        
                )
            )
        ),
        
        mainPanel(
            tabsetPanel( type = 'tabs',
                
                ################################################################
                # This is where the input data will be displayed as a 
                # table. Note that only the first 200 or so rows will be 
                # displayed. 
                ################################################################
                tabPanel('Data', 
                     tags$div( style=" overflow-y:scroll; overflow-x:scroll; height:900px; width:500px",
                        list(
                            tags$p("These are the first few lines of the file. Please make sure that the data looks ok before proceeding."),
                            tableOutput('data')
                        )
                     )
                ),
                         
                tabPanel('Output1', tableOutput('Result') ),
                
                ################################################################
                # This is the Readme tab. We simply source the original 
                # readme file over here. That way we dont have to create
                # the readme contents by ourselves.
                #
                # Customizing UI with HTML: 
                #  http://shiny.rstudio.com/articles/html-tags.html
                ################################################################
                tabPanel('Readme',  
                    tags$div( style="background-color:#EEEEEE; border-color:#000000; border-style: dotted; padding: 10px; border-radius: 10px;overflow-y:scroll; height:900px;",
                        includeMarkdown("mdFiles/Readme.md") 
                    )
                ),
                
                ################################################################
                # This is the Help tab. Just like the readme tab, we are 
                # simply going to source a markdown file here, and update
                # the markdown file independently. 
                ################################################################
                tabPanel('Help',    
                     tags$div( style="background-color:#EEEEEE; border-color:#000000; border-style: dotted; padding: 10px; border-radius: 10px;overflow-y:scroll; height:900px;",
                               includeMarkdown("mdFiles/help.md") 
                     )
                )
                
                
            # End of mainPanel
            )
        )
    )

))