# Help File

> **Note:** that this is a very simple application created for the demonstration of proficiency in building a shiny App for the datascience course. 
> 
>  - Please do not use this for any sort of serious data processing. 
>  - Please do not use this for attempting to learn large datasets. 
>  - Please realize that the `read.csv` function has been used for loading a file with only three parameters. If the file cant be read with the parameters provided, then this will result in an error.
>  - A small data set like the `iris` dataset can be loaded using the commands `load(iris); write.csv(iris, 'iris.csv')` and can be used for testing the functions. 

A typical machine learning task happens in the following sequence:

```
[1.  Get some data ]
         |         
        \|/        
[2.  Separate the data into training and testing sets ]
         |         
        \|/        
[3.  Use the training set to train a model ]
         |         
        \|/        
[4. Use the model to predict using the prediction set ]
```
The above steps are fairly common, and because of that it would be reasonable that a relatively sophisticated GUI will be able to help us tremendously in this aspect. In this program, we create a shiny workflow which resembles a rudimentary structure shown above.

The shiny application follows the structure which is shown in the class, where all the inputs are placed in the side panel, while the results are placed in the main panel. 

## The Side Panel

The side panel is divided into the following sections which are paractically self-explanatory. It is divided into the sections

1. `Data Input`
2. `Training vs. Testing`
3. `Model Selection`
4. `Run Application`

### A quick overview of the `Side Panle`

The four sections mentioned above are expected to be followed in dequence in all data analysis tasks. 

#### The `Data Input` section

This contains a button which can be used for selecting a `.csv` file within your local file system. This expectes that a `.csv` file will be provided and that you will also select whether it has a header, the type of separator used, and the quote character used in the file. Once you select the file, it will read the first 50 lines of the file and display it in the `Data Tab` in the `Main Panel`.

#### The `Training vs. Testing` section

In this section, you are expected to select the ration of the training to the testing data which will be used to split the dataset. You also need to select the column which will be used for prediction. All the other columns will automatically become features in this simple system.

#### The `Model Selection` section

In this section, you shall be choosing one of four models. 

 - Random forests,
 - Neural Networks,
 - Linear Support Vector Machine, and 
 - A Bayesian Generalized Linear Model

#### The `Run Application` Section

This section just contains a single button. When the button is pressed, 

1. the data within the file is read in, 
2. is separated into the training, and training set, 
3. and a particular model which has been chosen is set. 
4. Then it will do a prediction with the testing set, and
5. create a table containing its prediction and the value of the column already present in the data,
6. and display this table in the `Output1` tab.

This is schematically shown below

```
                 [data]
                   |
        +----------+--------------+
        |                         |
  [testing set]              [training set]
        |                         |
  +-----+---------+        [ train a model ]
  |               |               |
 [prediction] [features]    [prediction model]
 [  column  ]     |               |
     |            +-[prediction]--+
     |                  |
    \|/                \|/
  +-------------------------------+ (output table)
  |  Actual     |  Prediction     |
  +-------------+-----------------+
  |   ...       |  ...            |
```


## The Main Panel

The main panel is where most of the output of the program is present. This section is divided up into 4 distinct tabs, where different things are inserted. Two if the tabs are dedicated to the `help.md` and the `Readme.md` files. Since inserting an entire `.md` file just takes one like of code, the `help.md` and the `Readme.md` are simply added into the application in their own tabs. For the rest of the tabs, one is reserved for the input, and one for the output. 

### Description of the tabs

There are several tabs in the main window. They are the following: 


0. `Data`
1. `Output1`
2. `Readme`
3. `Help`


#### The `Data` Tab

Before the file is loaded, there is nothing in this tab, except a single line telling you to make sure that your data is fine. Once you choose a particular file, the first 50 lines are piced and displayed here so that you can see what the data looks like. In the case that the data looks odd, it is possible that you might have to try a different `Separator` or `Quote` character to load the file properly. Note that file input does not do any sort of checks, and these are the only optiosn available for loading a file. So not all file types can be loaded.  

#### The `Output1` Tab

Once the computation of the model is performed, this tab will display a single table containing one column which contains the actual column data which we were trying to predict, and the other one which is predicted. THis way, you will be able to see how the model did for prediction. 

#### The `Readme` Tab

This tab provides a little bit of the motivation of why the application was created, and some related details. 

#### The `Help` Tab

The `Help` tab is the tab you are looking at right now. This contains all of the help which is required for understanding how to use this application.


