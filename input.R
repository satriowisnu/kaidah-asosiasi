library (arules)

library (arulesViz)

library (datasets)

data (Groceries)
show(Groceries)
inspect(Groceries)
frequentItems <- eclat (Groceries, parameter = list(supp = 0.07, maxlen = 15)) # calculates support for frequent items

itemFrequencyPlot (Groceries,topN=10,type="absolute") # plot frequent items
rules <- apriori (Groceries, parameter = list(supp = 0.001, conf = 0.5)) # Min Support as 0.001, confidence as 0.8.
rules
quality(rules) # show the support, lift and confidence for all rules
# Show the top 5 rules, but only 2 digits

options (digits=2)

inspect (rules[1:5])

rules <- sort (rules, by="confidence", decreasing=TRUE) # ‘high-confidence’ rules.

rules <- apriori (Groceries, parameter = list (supp = 0.001, confidence=0.6, maxlen=3)) # maxlen = 3 limits the elements in a rule to 3

plot (rules[1:25],method="graph",interactive=TRUE,shading="confidence") # feel free to expand and move around the objects in this plot

plot (rules, measure=c("support", "lift"), shading="confidence")

rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.08), appearance = list (default="lhs",rhs="whole milk"), control = list (verbose=F)) # get rules that lead to buying ‘whole milk’
plot (rules[1:5],method="graph",interactive=TRUE,shading="confidence") # feel free to expand and move around the objects in this plot

rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.15,minlen=2), appearance = list (default="rhs",lhs="whole milk"), control = list (verbose=F)) # those who bought ‘milk’ also bought..
plot (rules[1:5],method="graph",interactive=TRUE,shading="confidence") # feel free to expand and move around the objects in this plot