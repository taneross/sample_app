module ApplicationHelper
  # Return a title on a per-page basis.
   def title
     base_title = "Trailhed"
     if @title.nil?
       base_title
     else
       "#{base_title} | #{@title}"
     end
   end
   
   def logo
       image_tag("logo.png", :alt => "Sample App", :class => "round")
   end
   
   def link_to_remove_fields(name, f)
       f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
   end
   
   def link_to_add_fields(name, f, association)
     
       logger.debug "HELPER!!!!!!!!!!!!add .... association? #{association.to_yaml}"
       logger.debug "HELPER!!!!!!!!!!!!add .... name? #{name.to_yaml}"
       
       new_object = f.object.class.reflect_on_association(association).klass.new
       fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
         render(association.to_s.singularize + "_fields", :f => builder)
       end
       link_to_function(name, ("add_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
     end
     
end
