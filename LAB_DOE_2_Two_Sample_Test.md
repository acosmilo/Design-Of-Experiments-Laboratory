# LAB 2: Lecture


## Problem 2: Paired t-test
Each student are going to make the reaction test twice. First time in a normal state, second time after spining in thier own axis 10 times.
So we will have two samples, before and after.


### Activities

1) Write de Ho and Ha
2) Gather data
3) Choose a statistical test and make it with R
4) Make conclusions and recomendations

### Process

#### 1) Write de Ho and Ha

Ho: The student  have the same reaction time before an after the spining process
Ha: No, they do not

### 2) Choose a statistical test and make it with R
We will use the 2 sample paired t test

See LAB_DOE_2_Problem_1.R to resolve this problem


On R follow this steps

Change the data of the samples, in the script



To execute the script use, in the R console:
source("LAB_DOE_2_Problem_1.R")

<img width="633" height="235" alt="imagen" src="https://github.com/user-attachments/assets/e5aeebeb-ffad-488d-97cb-488964f171ee" />


If the p-value is less than 0.05. We reject the Ho. 
In other words there is a diference in the time reaction between before and after the spining process
Else the p-value is more than 0.05. We do not reject the Ho. 
In other words there is not a diference in the time reaction between before and after the spining process

#### 3) Make conclusions and recomendations

Se puede decir con un 95% de confianza que los estudiantes cambian/ no cambian su tiempo de reacción entre antes y despues del proceso de spinning

## Problem 2: 1 Sample t test

Clic on this link to make 5 or more experimental run test
https://www.arealme.com/reaction-test/es/

We will use the 1 sample Z test

See LAB_DOE_1_Problem_2.R to resolve this problem
Con media de un ciudadano com[un
<img width="617" height="337" alt="imagen" src="https://github.com/user-attachments/assets/964eb181-3490-4e30-b924-62525b18c375" />

Con media de u piloto de F1

<img width="548" height="247" alt="imagen" src="https://github.com/user-attachments/assets/93f623a9-2238-4180-94ed-d1f6524004ca" />
