require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "postrender" do

  it "should return the whole string when the variable is undefined" do
    replacements = { }

    '{{ first_name | default }}'.postrender(replacements).should == '{{ first_name | default }}'
  end

  it "should accept mixed cased variables" do
    replacements = { :first_name => "John" }

    '{{ first_name | James }}'.postrender(replacements).should == "John"
    '{{ First_name | James }}'.postrender(replacements).should == "John"
    '{{ FIRST_NAME | James }}'.postrender(replacements).should == "John"
  end

  it "should return nothing when the variable is blank and there is no default" do
    replacements = { :first_name => "" }
    expected_string = ""

    '{{ first_name | }}'.postrender(replacements).should == expected_string
    '{{ first_name |}}'.postrender(replacements).should == expected_string
    '{{ first_name| }}'.postrender(replacements).should == expected_string
    '{{ first_name|}}'.postrender(replacements).should == expected_string
    '{{first_name | }}'.postrender(replacements).should == expected_string
    '{{first_name |}}'.postrender(replacements).should == expected_string
    '{{first_name| }}'.postrender(replacements).should == expected_string
    '{{first_name|}}'.postrender(replacements).should == expected_string
    '{{ first_name }}'.postrender(replacements).should == expected_string
    '{{ first_name}}'.postrender(replacements).should == expected_string
    '{{first_name }}'.postrender(replacements).should == expected_string
    '{{first_name}}'.postrender(replacements).should == expected_string
  end

  it "should return the default value when the variable is blank and there is a default" do
    replacements = { :first_name => "" }
    expected_string = "James"

    '{{ first_name | James }}'.postrender(replacements).should == expected_string
    '{{ first_name | James}}'.postrender(replacements).should == expected_string
    '{{ first_name |James }}'.postrender(replacements).should == expected_string
    '{{ first_name |James}}'.postrender(replacements).should == expected_string
    '{{ first_name| James }}'.postrender(replacements).should == expected_string
    '{{ first_name| James}}'.postrender(replacements).should == expected_string
    '{{ first_name|James }}'.postrender(replacements).should == expected_string
    '{{ first_name|James}}'.postrender(replacements).should == expected_string
    '{{first_name | James }}'.postrender(replacements).should == expected_string
    '{{first_name | James}}'.postrender(replacements).should == expected_string
    '{{first_name |James }}'.postrender(replacements).should == expected_string
    '{{first_name |James}}'.postrender(replacements).should == expected_string
    '{{first_name| James }}'.postrender(replacements).should == expected_string
    '{{first_name| James}}'.postrender(replacements).should == expected_string
    '{{first_name|James }}'.postrender(replacements).should == expected_string
    '{{first_name|James}}'.postrender(replacements).should == expected_string

  end

  it "should return the variable when the variable is set and there is a default" do
    replacements = { :first_name => "John" }
    expected_string = "John"

    '{{ first_name | James }}'.postrender(replacements).should == expected_string
    '{{ first_name | James}}'.postrender(replacements).should == expected_string
    '{{ first_name |James }}'.postrender(replacements).should == expected_string
    '{{ first_name |James}}'.postrender(replacements).should == expected_string
    '{{ first_name| James }}'.postrender(replacements).should == expected_string
    '{{ first_name| James}}'.postrender(replacements).should == expected_string
    '{{ first_name|James }}'.postrender(replacements).should == expected_string
    '{{ first_name|James}}'.postrender(replacements).should == expected_string
    '{{first_name | James }}'.postrender(replacements).should == expected_string
    '{{first_name | James}}'.postrender(replacements).should == expected_string
    '{{first_name |James }}'.postrender(replacements).should == expected_string
    '{{first_name |James}}'.postrender(replacements).should == expected_string
    '{{first_name| James }}'.postrender(replacements).should == expected_string
    '{{first_name| James}}'.postrender(replacements).should == expected_string
    '{{first_name|James }}'.postrender(replacements).should == expected_string
    '{{first_name|James}}'.postrender(replacements).should == expected_string
  end

  it "should return the variable when the variable is set and there is no default" do
    replacements = { :first_name => "John" }
    expected_string = "John"

    '{{ first_name | }}'.postrender(replacements).should == expected_string
    '{{ first_name |}}'.postrender(replacements).should == expected_string
    '{{ first_name| }}'.postrender(replacements).should == expected_string
    '{{ first_name|}}'.postrender(replacements).should == expected_string
    '{{first_name | }}'.postrender(replacements).should == expected_string
    '{{first_name |}}'.postrender(replacements).should == expected_string
    '{{first_name| }}'.postrender(replacements).should == expected_string
    '{{first_name|}}'.postrender(replacements).should == expected_string
    '{{ first_name }}'.postrender(replacements).should == expected_string
    '{{ first_name}}'.postrender(replacements).should == expected_string
    '{{first_name }}'.postrender(replacements).should == expected_string
    '{{first_name}}'.postrender(replacements).should == expected_string
  end

  it "should accept multiple replacements on one line" do
    replacements = { :first_name => "John", :last_name => "Smith" }
    expected_string = "John Smith"

    '{{first_name}} {{last_name}}'.postrender(replacements).should == expected_string
    '{{first_name|banana}} {{last_name}}'.postrender(replacements).should == expected_string
  end

end
