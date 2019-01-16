install.packages("caret");
install.packages("e1071");
install.packages("gWidgets");
install.packages("gWidgetstcltk");
#install.packages("RGtk2");
library(caret)
library(gWidgets)
library(gWidgetstcltk)
#require(RGtk2)
affairs.raw<-read.csv('./Affairs.csv')[, -1]
affairs.modified<-affairs.raw[,-1]
affairs.modified$affairsType[affairs.raw$affairs>0]<-'unfair'
affairs.modified$affairsType[affairs.raw$affairs==0]<-'fair'
affairs.modified$affairsType<-as.character(affairs.modified$affairsType)
affairs.modified<-affairs.modified[!(affairs.modified$rating<3&affairs.modified$affairsType=='fair'),]
validation_index <- createDataPartition(affairs.modified$affairsType, p=0.50, list=FALSE)
validation <- affairs.modified[-validation_index,]
affairs.modified <- affairs.modified[validation_index,]
percentage <- prop.table(table(affairs.modified$affairsType)) * 100
cbind(freq=table(affairs.modified$affairsType), percentage=percentage)
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"
set.seed(13)
fit.lda <- train(affairsType~., data=affairs.modified, method="lda", metric=metric, trControl=control)
validation$affairsType <- NULL
predictions <- predict(fit.lda, validation)

#Some sample data to test against
x1 <- rnorm(100)
x2 <- runif(100)

labelGender <- "Выберите пол Вашего партнера:"
labelAge <- "Введите возраст Вашего партнера:"
labelYM <- "Сколько полных лет Вы в браке?"
labelKids <- "Дети у Вас есть?"
labelReligion <- "Насколько Ваш партнер религиозный (от 1 до 5)?"
labelEdu <- "Сколько лет Ваш партнер учился?"
labelOccupation <- "occupation"
labelRating <- "Во сколько Ваш партнер оценивает брак (от 1 до 5)?"
labelP <- "Результат:"

#Choices for comboboxes
choicesGender <- c("male", "female")
choicesKids <- c("yes", "no")
choicesFromOneToFive <- c("1", "2", "3", "4", "5")

createKsTestGwidgets <- function()
{
  library(gWidgetstcltk)
  options(guiToolkit = "tcltk")
  win <- gwindow("Определить измену в браке", visible = FALSE)
  
  #TODO: SET PRETTY ICON
  #img <- gdkPixbufNewFromFile("C:/Users/olegr/icon.ico")
  #getToolkitWidget(win)$setIcon(img);
  
  frmGender <- gframe("Пол", container = win)
  lblGender <- glabel(labelGender, container = frmGender)
  cmbGender <- gcombobox(choicesGender, container = frmGender)
  
  frmAge <- gframe("Возраст", container = win)
  lblAge <- glabel(labelAge, container = frmAge)
  txtAge <- gedit(container = frmAge)
  
  frmYM <- gframe("Лет в браке", container = win)
  lblYM <- glabel(labelYM, container = frmYM)
  txtYM <- gedit(container = frmYM)
  
  frmKids <- gframe("Дети", container = win)
  lblKids <- glabel(labelKids, container = frmKids)
  cmbKids <- gcombobox(choicesKids, container = frmKids)
  
  frmReligion <- gframe("Религия", container = win)
  lblReligion <- glabel(labelReligion, container = frmReligion)
  cmbReligion <- gcombobox(choicesFromOneToFive, container = frmReligion)
  
  frmEdu <- gframe("Учеба", container = win)
  lblEdu <- glabel(labelEdu, container = frmEdu)
  txtEdu <- gedit(container = frmEdu)
  
  frmOcc <- gframe("Occupation", container = win)
  lblOcc <- glabel(labelOccupation, container = frmOcc)
  txtOcc <- gedit(container = frmOcc)
  
  frmRating <- gframe("Оценка", container = win)
  lblRating <- glabel(labelRating, container = frmRating)
  cmbRating <- gcombobox(choicesFromOneToFive, container = frmRating)
  
  btnCalc <- gbutton("Мне изменяют?", container = win,
                     handler = function(h, ...)
                     {
                       gender <- svalue(cmbGender)
                       age <- as.numeric(svalue(txtAge))
                       yearsmarried <- as.numeric(svalue(txtYM))
                       children <- svalue(cmbKids)
                       religiousness <- as.integer(svalue(cmbReligion))
                       education <- as.integer(svalue(txtEdu))
                       occupation <- as.integer(svalue(txtOcc))
                       rating <- as.integer(svalue(cmbRating))
                       
                       params <- data.frame("gender" = gender, "age" = age, "yearsmarried" = yearsmarried,
                                            "children" = children, "religiousness" = religiousness,
                                            "education" = education, "occupation" = occupation, "rating" = rating)
                       
                       params
                       
                       predictions <- predict(fit.lda, params)
                       svalue(txtP) <- format(predictions[1])
                     }
  )
  
  frmResults <- gframe("results", container = win)
  lblP <- glabel(labelP, container = frmResults)
  txtP <- gedit(container = frmResults)
  visible(win) <- TRUE
  
}

createKsTestGwidgets()

