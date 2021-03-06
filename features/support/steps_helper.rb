def check_link_presence(div, li_class_name, link_text)
  lis = div.all :xpath, "//li[@class=\"#{li_class_name}\"]"
  expect(lis.size).to be >= 1
  found = false
  lis.each do |li|
    begin
      li.find('a', :text => link_text)
      found = true
      break
    rescue Capybara::ElementNotFound
      next
    end
  end
  expect(found).not_to be false
end
