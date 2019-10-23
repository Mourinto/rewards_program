# Rewards

this project Works through postgressql

Setup :  
```
rvm use 2.6.0
rvm gemset create rewards_program
bundle
rake db:create
rake db:migrate
```


 for run console just open the app in terminal then  type `rack console`
for running the tests 

```
 RACK_ENV=test rake db:drop db:create db:migrate --trace
 rspec
```

