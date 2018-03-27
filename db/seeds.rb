# Seed the database with `rake db:seed`

# Users
john = User.create({username: "john123", email: "john@gmail.com", password: "test"})
mark = User.create({username: "mark456", email: "mark@gmail.com", password: "invest"})
luke = User.create({username: "luke007", email: "luke@yahoo.com", password: "password"})

# Accounts
john_primary = Account.create(name: "tech", category: "growth")
john_secondary = Account.create(name: "industrial", category: "value")

# Stocks
aapl = Stock.create(name: "Apple", ticker:"AAPL")
msft = Stock.create(name: "Microsoft", ticker: "MSFT")
googl = Stock.create(name: "Google" , ticker: "GOOGL")
ge = Stock.create(name: "General Electric", ticker: "GE")
unp = Stock.create(name: "Union Pacific", ticker: "UNP" )
x = Stock.create(name: "US Steel", ticker: "X")
