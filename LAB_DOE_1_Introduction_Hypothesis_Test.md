# LAB 1 Introduction


## Problem 1: 1 Sample Z test
First, in a groups of 3 people. Imagine you are going to buy a batch of 1000 capacitors for a electronic project, with the value of 650 uF. 
At the store the buyer say that his capacitors are perfect, they have a nominal value of 650 uF with a tolerance of +-25 uF, 
but you are not sure about his words, so you are going to make a Hypothesis test with a sample of 10 capacitors. So you made the follow measurements

C1 =  620 uF
C2 = 622 uF
C3 = 680 uF
C4 = 670 uF
C5 = 645 uF
C6 = 678 uF
C7 = 615 uF
C8 = 613 uF
C9 = 612 uF
C10 = 613 uF


### Activities

1) Write de Ho and Ha
2) Choose a statistical test and make it with R
3) Make conclusions and recomendations

### Process

#### 1) Write de Ho and Ha

Ho: Capacitors of the store have a nominal value of 650 uF
Ha: No, they do not

### Choose a statistical test and make it with R
We will use the 1 sample Z test

See LAB_DOE_1_Problem_1.R to resolve this problem
Use the data file LAB_DOE_1_Data_Set_1.csv

You need to have this documents on the same directory

On R follow this steps

<img width="375" height="90" alt="imagen" src="https://github.com/user-attachments/assets/c4f8f275-6003-4bf8-bbc0-65661e8b31ff" />

To execute the script use:
source("LAB_DOE_1_Problem_1.R")

To show Z use:
Z

To show the p-value use:
p_value

<img width="171" height="106" alt="imagen" src="https://github.com/user-attachments/assets/6dcb2937-ee70-451e-901a-a8e7892480ba" />


The p-value is 0.094. So p_value is more than our alpha of 0.05. We do not reject the Ho. 
In other words the Capacitors the store have a nominal value of 650 uF.

#### 3) Make conclusions and recomendations

Se puede decir con un 95% de confianza que los capacitores de la tienda tienen un valor nominal de 650 uF
