require('pry')
require_relative('./db/sqlrunner')

SqlRunner.run("SELECT * FROM tickets")
