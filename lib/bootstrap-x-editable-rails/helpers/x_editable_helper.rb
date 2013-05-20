module XEditableHelper

  # support restful update url
  def xeditable(url, type, model, column, value, options = {})
    options_hash = {}
    options.each do |k, v|
      options_hash.merge!({("data-"+(k.to_s)).to_sym => v})
    end
    pk = url.split('/')[-1]
    id = "#{model}_#{column}_#{pk}"
    attributes_hash = {"data-type" => type, "data-pk" => pk, "data-url" => url, "id" => id}.merge!(options_hash)
    link = link_to(value, '#', attributes_hash)
    script = "<script>$(document).ready(function(){$('##{id}').editable("
    script += "{ajaxOptions: {type: 'put',dataType:'json'},"
    script += "success: function(response, newValue) {if(!response.success) alert(response.msg);}"
    script += "})})</script>"
    return link+(script.html_safe)
  end

end
