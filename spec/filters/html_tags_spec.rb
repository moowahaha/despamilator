describe DespamilatorFilter::HtmlTags do

  the_name_should_be 'HTML tags'
  the_description_should_be 'Detects HTML tags in text'

  despamilator_should_apply_the_filter_for('<xmp>')

  a_single_match_of('<xmp></xmp>', should_score: 0.6)
  a_multiple_match_of('<h1></h1> <h2></h2>', should_score: 1.2)
  a_multiple_match_of('<div></div> <div></div>', should_score: 1.2)

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
  ].each do |html_tag|
    [html_tag.upcase, html_tag.downcase].each do |cased_html_tag|
      [
              "<#{cased_html_tag}>",
              "<#{cased_html_tag}/>",
              "< #{cased_html_tag} >",
              "<#{cased_html_tag} />",
              "<\n#{cased_html_tag}\n/>",
              "<\n#{cased_html_tag} >",
              "<#{cased_html_tag}\n/>",
              "<\r#{cased_html_tag}\r/>"
      ].each do |tag|
        it "should detect '#{tag}'" do
          parsing(tag).should have_score(0.6)
        end

      end

    end

  end

end
