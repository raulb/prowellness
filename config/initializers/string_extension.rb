class String
  def sanitize_sql
    self.gsub(/\\/, '\&\&').gsub(/'/, "''")
  end

  def get_video_bigger
    unless self.blank?
      self.gsub(/width=\"311\"/, 'width="651"').gsub(/height=\"233\"/, 'height="488"').
           gsub(/height=\"213\"/, 'height="445"').gsub(/height=\"212\"/, 'height="443"').
           gsub(/height=\"249\"/, 'height="521"')
    else
      self
    end
  end
end