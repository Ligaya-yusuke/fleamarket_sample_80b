json.array! @category_children do |child|
  json.id child.id
  json.name child.category_name
end