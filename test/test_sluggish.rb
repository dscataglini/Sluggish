require "sluggish"
require 'test/unit'

class Mock1
  include Sluggish
  sluggit! :foo
  def self.find_by_foo(msg)
    msg
  end
end

%w{name slug key}.each do |k|
  eval <<-EOF
    class Mock#{k}
      include Sluggish
      def self.find_by_#{k}(msg)
        msg
      end
    end
  EOF
end

class TestSluggish < Test::Unit::TestCase
  def test_should_look_for_name
    assert_equal "bar", Mockname["bar"]
  end
  def test_should_look_for_slug
    assert_equal "bar", Mockslug["bar"]
  end
  def test_should_look_for_key
    assert_equal "bar", Mockkey["bar"]
  end

  def test_sluggit_should_override_defaults
    assert_equal "bar", Mock1["bar"]
  end
  
  def test_sluggit_variable_is_available_to_class
    assert_equal :foo, Mock1.instance_variable_get('@sluggable_finder_key')
  end
  
  def test_sluggit_variable_is_not_available_to_instance
    assert_equal nil, Mock1.new.instance_variable_get('@sluggable_finder_key')
  end
end