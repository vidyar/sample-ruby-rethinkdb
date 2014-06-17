require 'rethinkdb'
include RethinkDB::Shortcuts

class Bowling
  @var = 0
  r.connect(:host => 'localhost', :port => 28015).repl

  def hit()
    r.db_drop('test').run
    r.db_create('test').run

    r.db('test').table_create('table').run

    r.table("table").insert({
        :id => 1,
        :title => "Bowling Score",
        :content => "Strike"
    }).run

    @var = r.table('table').get(1).keys.run.length
  end

  def score
  	return @var
  end
end

