# Add class-level method called ActsAsChainModel to mix this into a class

# automatically make all instance variables using special first arg (:all)
#    may want to reject all other symbols

# implement chain_model method

# move into a relevance module (module scope)

module ActsAsChainModel
  def chain(model, *redirect_args)
    raise ArgumentError, "Can't call :chain with a single model object; arg must be a hash." unless model.is_a?(Hash)

    flash[:chain_model] = model
    self.redirect_to *redirect_args
  end
  
  # 
  def chain_model
    flash[:chain_model] || raise("Can't call :chain_model without first calling :chain.")
  end
end