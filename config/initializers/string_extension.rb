class String
  def sanitize_sql
    self.gsub(/\\/, '\&\&').gsub(/'/, "''")
  end
end