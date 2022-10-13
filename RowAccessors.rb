# mixin to automatically return hash values when accessing missing
# methods with the corresponding name, e.g. obj.id returns obj's @row['id']

module RowAccessors
	def method_missing(name, *args, &block)
		sname = name.to_sym
		
		if @row.keys.include? sname
			@row[sname]
		else
			super
		end
	end
end
