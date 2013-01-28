require 'spec_helper'

describe Household do
  it should { belong_to(:person).through(:households) }
end
