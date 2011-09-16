class String
  def requires_postrendering?
    !!(self =~ /\{\{\s*([\w]+)\s*(\|([^{}]*))?\}\}/)
  end
  
  def postrender(replacements)
    gsub(/\{\{\s*([\w]+)\s*(\|([^{}]*))?\}\}/i) do |match|
      key = $1.downcase.to_sym
      default = $3 || ""

      if replacements.has_key?(key)
        k = replacements[key] || ''
        (k == '') ? default.strip : k.strip
      else
        $&
      end
    end
  end
end