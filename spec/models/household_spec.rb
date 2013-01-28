require 'spec_helper'

describe Household do
  it should { belong_to(:neighbor).through(:households) }
end
