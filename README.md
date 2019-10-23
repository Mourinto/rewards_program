# Rewards

back enf implementaion for rewards program which
The inviter gets (1/2)^k points for each confirmed invitation, where k is the level of the invitation: level 0
(people directly invited) yields 1 point, level 1 (people invited by someone invited by the original customer)
gives 1/2 points, level 2 invitations (people invited by someone on level 1) awards 1/4 points and so on.

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
