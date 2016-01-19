require "spec_helper"

describe Comment do
	it {should belong_to :article}
	it {should validate_legth_of :title}
end