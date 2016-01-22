shared_examples "a configuration option" do |name, value|
  before do
    @original_value = subject.class.send(name)
  end

  after do
    subject.class.configure do |rebay|
      rebay.send("#{name}=", @original_value)
    end
  end

  it "should support configuration option #{name}" do
    expect(subject.class).to respond_to "#{name}="
    expect(subject.class).to respond_to "#{name}"
    subject.class.configure do |rebay|
      expect(rebay).to respond_to "#{name}="
      expect(rebay).to respond_to "#{name}"
    end
  end

  it "should set configuration option #{name} to #{value}" do
    subject.class.configure do |rebay|
      rebay.send("#{name}=", value)
    end
    expect(subject.class.send(name)).to eq(value)
  end
end

