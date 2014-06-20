library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Body Mass Index(BMI) Calculator for Adults"),
  sidebarPanel(
      numericInput('height', 'Please select your height in centimeters(cm):', 170, min=140, max=210, step=1),
      numericInput('weight', 'Please selecr your weight in kilograms(kg):', 64, min=30, max=180, step=1),
      checkboxGroupInput('standard', "Which standard would you like to choose:", c("Hong Kong Standard"="HK", "Japan Standard"="JPN")),
      submitButton('Show me!')
  ),
  mainPanel(
      h3('---Here are some notes for using this Shinyapp'),
      p('1. The BMI formula is quoted from Wikipedia: http://en.wikipedia.org/wiki/Body_mass_index'),
      p('2. Click on the up or down arrow on the right side of the blanks to adjust to your height & weight (Note the units).'),
      p('3. Check one of the boxes to select which standard you would like to refer to interpret your BMI index.'),
      p('4. Press the "Show me!" button to submit your data. Or, your analysis will not be generated.'),
      p('5. You may check only one box. Error warning would appear to you if none or two are checked.'),
      h3(' '),
      h3('---Here is Your Body Shape Analysis Result'), 
      h4('The height you entered just now'), 
      verbatimTextOutput("inputHeight"),
      h4('The weight you entered just now'), 
      verbatimTextOutput("inputWeight"),
      h4('Your BMI'),
      verbatimTextOutput("BMI"),
      h4('The standard you chose just now'), 
      verbatimTextOutput("inputStandard"),
      h4('Your Analysis Result'),
      verbatimTextOutput("Result") 
  )    
))