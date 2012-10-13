$model_default_attributes = OpenStruct.new

Given /^a "([^"]*)" exists$/ do |model|
  @model = model.titleize.constantize.create($model_default_attributes.send(model))
end

When /^I edit a "(.*?)" with these attributes:$/ do |model, table|
  @attributes = hash_from_table(table)
  visit "/#{model.pluralize}/#{@model.id}/edit"
  @attributes.each do |attr, val|
    fill_in "#{model}_#{attr}", :with => val
  end
  click_button "Update #{model.titleize}"
end

When /^I create a "(.*?)" with these attributes:$/ do |model, table|
  @attributes = hash_from_table(table)
  visit "/#{model.pluralize}/new"

  @attributes.each do |attr, val|
    fill_in "#{model}_#{attr}", :with => val
  end
  click_button "Create #{model.titleize}"
end

When /^I delete the "([^"]*)"/ do |model|
  visit "/#{model.pluralize}"
  click_link 'Destroy'
end

Then /^I should not see the "([^"]*)"/ do |model|
  model.titleize.constantize.find_by_id(@model.id).should be_nil
end

Then /^I should see "([^"]*)" for the "([^"]*)"$/ do |text, model|
  visit "/#{model.pluralize}"
  page.should have_content text

  click_link("Edit")
  @attributes.each do |attr, val|
    page.should have_xpath("//input[@value='#{val}']")
  end
end

Then /^I should see the new attributes for the "([^"]*)"$/ do |model|
  page.should have_content(@model.reload.send(@attributes.keys.first))
end
