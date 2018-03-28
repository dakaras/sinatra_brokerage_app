# Seed the database with `rake db:seed`

# Users
john = User.create({username: "john123", email: "john@gmail.com", password: "test"})
mark = User.create({username: "mark456", email: "mark@gmail.com", password: "invest"})
luke = User.create({username: "luke007", email: "luke@yahoo.com", password: "password"})

# Accounts
john_primary = Account.create(name: "Tech Fund", category: "growth", user_id: "#{john.id}")
john_secondary = Account.create(name: "Industrials Fund", category: "value", user_id: "#{john.id}")

# Stocks
aapl = Stock.create(name: "Apple", ticker:"AAPL", account_id: "#{john_primary.id}")
msft = Stock.create(name: "Microsoft", ticker: "MSFT", account_id: "#{john_primary.id}")
googl = Stock.create(name: "Google" , ticker: "GOOGL")
ge = Stock.create(name: "General Electric", ticker: "GE", account_id: "#{john_secondary.id}")
x = Stock.create(name: "US Steel", ticker: "X", account_id: "#{john_secondary.id}")
unp = Stock.create(name: "Union Pacific", ticker: "UNP")
fcx = Stock.create(name: "Freeport Mcmoran", ticker: 'FCX')
a = Stock.create(name: "Alcoa", ticker: "A")
slw = Stock.create(name: "Silver Wheaton", ticker: "SLW")
nem = Stock.create(name: "Newmont Mining", ticker: "NEM")
