module FormBuilderExtensions
  def labelled_field(type, field)
    <<-END
<p>
<label>#{field.to_s.humanize}</label><br />
#{self.send type, field}
</p>
END
  end
end
