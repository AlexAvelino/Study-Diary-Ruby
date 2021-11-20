require 'sqlite3'

class StudyItem
  attr_accessor :title, :category

  def initialize(title:, category:)
    @title = title
    @category = category
  end

  def self.all
    db = SQLite3::Database.open "task.db"
    db.results_as_hash = true
    tasks = db.execute "SELECT title, category FROM tasks"
    db.close
    tasks.map.with_index(1) {|task, index| puts "[#{index}] #{task['title']} - #{task['category']}" }
  end

  def save_to_db
    db = SQLite3::Database.open "task.db"
    db.execute "INSERT INTO tasks VALUES('#{ title }', '#{ category }')"
    db.close
    self
  end

  def self.find_by_title(title)
    db = SQLite3::Database.open "task.db"
    db.results_as_hash = true
    tasks = db.execute "SELECT title, category FROM tasks where title LIKE'#{title}'"
    db.close
    tasks.map {|task| puts " #{task['title']} -  #{task['category']}" }
  end
end

e = StudyItem.new(title: "Laços", category: "Ruby")

# e.save_to_db

print StudyItem.find_by_title("Laços de Repetição")