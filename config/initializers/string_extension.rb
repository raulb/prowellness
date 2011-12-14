class String
  def sanitize_sql
    self.gsub(/\\/, '\&\&').gsub(/'/, "''")
  end

  def get_video_bigger
    unless self.blank?
      self.gsub("311", "651").gsub("233", "488").gsub("213", "445").gsub("212", "443")
    else
      self
    end
  end
end