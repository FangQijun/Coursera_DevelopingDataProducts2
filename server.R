library(shiny)
bmi <- function (height, weight) weight/(height^2)*10000

shinyServer(
  function(input, output){
    output$inputHeight <- renderPrint({input$height})
    output$inputWeight <- renderPrint({input$weight})
    output$BMI <- renderPrint({bmi(input$height, input$weight)})
    output$inputStandard <- renderPrint({input$standard})
    output$Result <- renderPrint({
      A <- input$standard
      if (length(A)==1 && A=="HK"){
      B <- bmi(input$height, input$weight)
        if (B>30) {
          "Overweight - Severely Obese"
        } 
        else if (B<=30 && B>25) {
          "Overweight - Moderately Obese"
        }
        else if (B<=25 && B>23) {
          "Overweight - At Risk"
        }
        else if (B<=23 && B>18.5) {
          "Normal Range"
        }
        else {
          "Underweight"
        }
      }
      else if (length(A)==1 && A=="JPN"){
        B <- bmi(input$height, input$weight)
        if (B>40) {
          "Obese (Level 4)"
        } 
        else if (B<=40 && B>35) {
          "Obese (Level 3)"
        }
        else if (B<=35 && B>30) {
          "Obese (Level 2)"
        }
        else if (B<=30 && B>25) {
          "Obese (Level 1)"
        }
        else if (B<=25 && B>18.5) {
          "Normal"
        }
        else {
          "Low"
        }
      }
      else if (length(A)==0){ "Sorry, you forgot to choose the standard." }
      else if (length(A)==2){ "Sorry, you may choose only ONE standard." }
    })
  }  
)