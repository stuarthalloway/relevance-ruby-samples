# codecite all
# codecite not_decl
class Object
  # codecite not_proxy_decl
  def not
    # codecite not_decl
    NotProxy.new(self)
    # codecite not_decl
  end
  # codecite not_decl

  class NotProxy
    def initialize(subject)
      @subject = subject
    end
    # codecite not_proxy_decl
  
    # codecite method_missing
    def method_missing(sym, *args, &blk)
      !@subject.send(sym, *args, &blk)
    end
    # codecite method_missing
  
    # codecite privatize_ordinary_methods
    private *instance_methods.select {|m| m !~ /(^__|^\W|^binding$)/ }
    # codecite privatize_ordinary_methods
  # codecite not_proxy_decl
  end
  # codecite not_proxy_decl
# codecite not_decl
end
# codecite not_decl
# codecite all