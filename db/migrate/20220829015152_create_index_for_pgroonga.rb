class CreateIndexForPgroonga < ActiveRecord::Migration[6.1]
  def change
    execute <<~SQL
      CREATE INDEX pgroonga_plain_text_body_index ON rich_texts USING pgroonga (body);
    SQL
  end
end
