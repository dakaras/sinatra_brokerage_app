# Seed the database with `rake db:seed`

# Users
john = User.create({username: "john123", email: "john@gmail.com", password: "test"})
mark = User.create({username: "mark456", email: "mark@gmail.com", password: "invest"})
luke = User.create({username: "luke007", email: "luke@yahoo.com", password: "password"})

# Accounts
john_primary = Account.create(name: "Tech Fund", category: "growth", user_id: "#{john.id}")
john_secondary = Account.create(name: "Industrials Fund", category: "value", user_id: "#{john.id}")

# Stocks
aapl = Stock.create(name: "Apple", ticker:"AAPL", shares: 10)
msft = Stock.create(name: "Microsoft", ticker: "MSFT", shares: 200)
john_primary.stocks << aapl
john_primary.stocks << msft

ge = Stock.create(name: "General Electric", ticker: "GE", shares: 1000)
x = Stock.create(name: "US Steel", ticker: "X", shares: 500)
john_secondary.stocks << ge
john_secondary.stocks << x
