install.packages("neuralnet")
# creating training data set
TKS=c(20,10,30,20,80,30)
CSS=c(90,20,40,50,50,80)
Placed=c(1,0,0,0,1,1)
# Here, you will combine multiple columns or features into a single set of data
df=data.frame(TKS,CSS,Placed)
# load library
require(neuralnet)

# fit neural network with 3 layers
nn=neuralnet(Placed~TKS+CSS,data=df, hidden=3,act.fct = "logistic",
                linear.output = FALSE)
# plot neural network
plot(nn)
# fit neural network with 1 layers
nn2=neuralnet(Placed~TKS+CSS,data=df, hidden=1,act.fct = "logistic",
             linear.output = FALSE)
plot (nn2)
nn2
##predict it now
TKS=c(0,20,50)
CSS=c(20,50,90)
test=data.frame(TKS,CSS)
predict=compute(nn,test)
predict$net.result
help("neuralnet")
?neuralnet
