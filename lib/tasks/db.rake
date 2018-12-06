namespace :db do
  desc "Run RAILS_ENV=#{Rails.env} ridgepole, annotate"
  task :ridgepole do
    schema_file = 'db/Schemafile'
    if Rails.env.development?

      # 参照先になるテーブルは個別に定義
      refs = %w[authors_credit_logs authors_credits credit_logs mmd_objects wanteds emms]
      refs.map! {|row| "#{row}.schema"}
      lines = []
      Dir.glob(Rails.root.join('db','schemas', '*.schema')) do |file|
        basename = File.basename(file)
        lines << row_cmd(basename) unless refs.include?(basename)
      end

      write_libes = refs.map {|row| row_cmd(row)}
      write_libes += lines.sort

      File.open(Rails.root.join(schema_file), "w") do |f|
        f.puts(write_libes.join("\n"))
      end
    end
    sh "bundle exec ridgepole -c config/database.yml -E #{Rails.env} --apply -f #{schema_file}"
    sh "bundle exec annotate" if Rails.env.development?
  end

  def row_cmd(basename)
    "require 'schemas/#{basename}'"
  end

end
