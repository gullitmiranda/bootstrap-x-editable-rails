module XEditableHelper

  # support restful update url
  def xeditable(url, type, model, column, value, options = {})
    option_attributes = ' '
    options.each do |key, value|
      option_attributes += "data-#{key}='#{value}' "
    end
    pk = url.split('/')[-1]
    id = "#{model}-#{column}-#{pk}"
    html = "<a href='#' id='#{id}' data-type='#{type}' data-pk='#{pk}' data-url='#{url}' "
    html += option_attributes
    html += ">#{value}</a>"
    html += "<script>$(document).ready(function(){$('##{id}').editable("
    html += "{ajaxOptions: {type: 'put',dataType:'json'}})})</script>"
    html.html_safe
  end

end