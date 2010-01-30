require File.dirname(__FILE__) + '/../spec_helper.rb'

context "HTMLTags" do
  describe "detecting various script tags" do
    [
            '!--',
            '!DOCTYPE',
            'a',
            'abbr',
            'acronym',
            'address',
            'applet',
            'area',
            'b',
            'base',
            'basefont',
            'bdo',
            'big',
            'blockquote',
            'body',
            'br',
            'button',
            'caption',
            'center',
            'cite',
            'code',
            'col',
            'colgroup',
            'dd',
            'del',
            'dfn',
            'dir',
            'div',
            'dl',
            'dt',
            'em',
            'fieldset',
            'font',
            'form',
            'frame',
            'frameset',
            'h1>toh6',
            'head',
            'hr',
            'html',
            'i',
            'iframe',
            'img',
            'input',
            'ins',
            'isindex',
            'kbd',
            'label',
            'legend',
            'li',
            'link',
            'map',
            'menu',
            'meta',
            'noframes',
            'noscript',
            'object',
            'ol',
            'optgroup',
            'option',
            'p',
            'param',
            'pre',
            'q',
            's',
            'samp',
            'select',
            'small',
            'span',
            'strike',
            'strong',
            'style',
            'sub',
            'sup',
            'table',
            'tbody',
            'td',
            'textarea',
            'tfoot',
            'th',
            'thead',
            'title',
            'tr',
            'tt',
            'u',
            'ul',
            'var',
            'xmp'
    ].each do |script_tag|
      [script_tag.upcase, script_tag.downcase].each do |script_tag|
        [
                "<#{script_tag}",
                "#{script_tag}/>",
                "<#{script_tag}/>",
                "< #{script_tag} ",
                "#{script_tag} />",
                "<\n#{script_tag}\n/>",
                "<\n#{script_tag} ",
                "#{script_tag}\n/>",
                "<\r#{script_tag}\r/>"
        ].each do |script_tag|
          it "should detect '#{script_tag}' of a script tag" do
            dspam = Despamilator.new(script_tag)
            dspam.score.should == 0.3
          end
        end
      end
    end

    describe 'attributes' do
      before :all do
        @dspam = Despamilator.new('<xmp>').matched_by.first
      end

      it "should have a name" do
        @dspam.name.should == 'Detects HTML tags in text'
      end

      it "should have a description" do
        @dspam.description.should == 'Searches for various HTML tags'
      end

      it "should have a filename" do
        @dspam.filename.should == 'html_tags.rb'
      end
    end
  end
end