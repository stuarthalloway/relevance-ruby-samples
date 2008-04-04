# codecite wrap
class Module
  def wrap_method(meth, &blk)
    old_meth = instance_method(meth)
    # codecite wrap
    # codecite define
    define_method(meth) do |*args|
      blk.call(self, old_meth.bind(self), *args)
    end 
  end
end
# codecite define

