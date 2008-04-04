module Relevance; end
module Relevance::PathMixin
  protected
  def is_subpath(parent, child)
    parent_path = Pathname.new(parent).realpath.to_s
    if parent_path
      begin
        child_path = Pathname.new(child).realpath.to_s
      rescue
        return true #don't care if child does not exist
      end
      return child_path.match(/\A#{Regexp.escape(parent_path)}/)
    end
    false
  rescue
    false
  end
end