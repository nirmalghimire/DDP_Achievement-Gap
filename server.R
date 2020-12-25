
library(shiny)

shinyServer(function(input, output){
    housing$Freqsp<-ifelse(housing$Freq-30>0, housing$Freq-30,0)
    model1<-lm(Freq~Sat, data=housing)
    model2<-lm(Freq~Sat+Infl, data=housing)
    model3<-lm(Freq~Sat+Infl+Type, data=housing)
    model4<-lm(Freq~Sat+Infl+Type+Cont, data=housing)

    model1pred<-reactive({
        FreqInput<-input$sliderFreq
        predict(model1, newdata=data.frame(Freq=FreqInput))
    })
    model2pred<-reactive({
        FreqInput<-input$sliderFreq
        predict(model2, newdata=data.frame(Freq=FreqInput,
                                           Freqsp=ifelse(FreqInput-30>0, FreqInput-30,0)))
    })
    model3pred<-reactive({
        FreqInput<-input$sliderFreq
        predict(model3, newdata=data.frame(Freq=FreqInput,
                                           Freqsp=ifelse(FreqInput-30>0, FreqInput-30,0)))
    })
    model4pred<-reactive({
        FreqInput<-input$sliderFreq
        predict(model4, newdata=data.frame(Freq=FreqInput,
                                           Freqsp=ifelse(FreqInput-30>0, FreqInput-30,0)))
    })
    output$plot1<-renderPlot({
        FreqInput<-input$sliderFreq

        plot(housing$Freq, housing$Sat, xlab="Level of Satisfaction",
             ylab="Frequency", bty="n", pch=16,
             xlim=c("Low","Medium","High"), ylim=c(3, 86))
        if(input$showModel1){
            abline(model1, col="red", lwd=2)
        }
        if(input$showModel2){
            model2lines<-predict(model2, newdata=data.frame(
                Freq=3:86, Freqsp=ifelse(3:86-30>0, 3:86-30,0)
            ))
            lines(3:86, model2lines, col="blue", lwd=2)
        }
        if(input$showModel3){
            model3lines<-predict(model3, newdata=data.frame(
                Freq=3:86, Freqsp=ifelse(3:86-30>0, 3:86-30,0)
            ))
            lines(3:86, model3lines, col="green", lwd=2)
        }
        if(input$showModel4){
            model4lines<-predict(model4, newdata=data.frame(
                Freq=3:86, Freqsp=ifelse(3:86-30>0, 3:86-30,0)
            ))
            lines(3:86, model3lines, col="yellos", lwd=2)
        }
        legend(0, 90, c("Model 1 Prediction", "Model 2 Prediction", "Model 3 Prediction", "Model 4 Prediction"), pch=16,
               col=c("red", "blue", "green", "yellow"), bty="n", cex=1.2)
        points(FreqInput, model1pred(), col="red", pch=16, cex=2)
        points(FreqInput, model2pred(), col="blue", pch=16, cex=2)
        points(FreqInput, model3pred(), col="green", pch=16, cex=2)
        points(FreqInput, model4pred(), col="yellow", pch=16, cex=2)
    })
    output$pred1<-renderText({
        model1pred()
    })
    output$pred2<-renderText({
        model2pred()
    })
    output$pred3<-renderText({
        model3pred()
    })
    output$pred4<-renderText({
        model4pred()
    })
})
