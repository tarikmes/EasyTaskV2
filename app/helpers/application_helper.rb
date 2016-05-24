module ApplicationHelper

  def link_to_add_used_resources(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render('admin/used_resources/used_resources_new', f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def nice_date_form(the_date)
   return the_date.strftime('%d-%m-%Y')
end

end



