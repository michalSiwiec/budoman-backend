class AddConstraintsForOpinions < ActiveRecord::Migration[5.2]
  def up
    change_column_null :opinions, :user_id, false
    change_column_null :opinions, :mark, false

    execute <<-SQL
      ALTER TABLE opinions
      ADD CONSTRAINT content_check
      CHECK (length(content) > 0);
    SQL

    execute <<-SQL
      ALTER TABLE opinions
      ADD CONSTRAINT mark_range_check
      CHECK (mark BETWEEN 1 AND 5);
    SQL
  end

  def down
    change_column_null :opinions, :user_id, true
    change_column_null :opinions, :mark, true

    execute <<-SQL
      ALTER TABLE opinions
      DROP CONSTRAINT content_check;
    SQL

    execute <<-SQL
      ALTER TABLE opinions
      DROP CONSTRAINT mark_range_check;
    SQL
  end
end
