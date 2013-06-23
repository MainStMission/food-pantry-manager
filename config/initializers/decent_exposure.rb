class StrongParametersStrategy < DecentExposure::ActiveRecordWithEagerAttributesStrategy
	  def attributes
	     (request.get? || request.delete?) ? super : controller.send(:"#{name.singularize}_params")
	  end
end
