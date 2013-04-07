class StaticInput
  include Formtastic::Inputs::Base
  def to_html
    input_wrapping do
      label_html <<
      @options[:value]
    end
  end

end
