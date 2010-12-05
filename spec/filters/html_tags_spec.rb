describe DespamilatorFilter::HtmlTags do
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
          'h1',
          'h2',
          'h3',
          'h4',
          'h5',
          'h6',
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
              "<#{script_tag}>",
              "<#{script_tag}/>",
              "< #{script_tag} >",
              "<#{script_tag} />",
              "<\n#{script_tag}\n/>",
              "<\n#{script_tag} >",
              "<#{script_tag}\n/>",
              "<\r#{script_tag}\r/>"
      ].each do |tag|
        it "should detect '#{tag}'" do
          dspam = DespamilatorFilter::HtmlTags.new
          dspam.parse(tag)
          dspam.score.should == 0.3
        end
      end
    end
  end

  it_should_behave_like "a filter"

  def filter_name
    'HTML tags'
  end

  def filter_description
    'Detects HTML tags in text'
  end

  def filter_class
    DespamilatorFilter::HtmlTags
  end

  def single_match_string
    '<xmp>'
  end

  def single_match_score
    0.3
  end

  def multiple_match_string
    '<h1></h1> <h2></h2>'
  end

  def multiple_match_quantity
    2
  end

  def multiple_match_score
    0.6
  end


end
