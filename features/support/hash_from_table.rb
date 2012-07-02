def hash_from_table(table)
  Hash[*table.raw.flatten]
end
