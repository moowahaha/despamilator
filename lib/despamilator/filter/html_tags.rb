module DespamilatorFilter

  class HtmlTags < Despamilator::Filter

    def parse subject
      text = subject.text.downcase

      html_tags.each do |tag|
        opening_elements = Despamilator::Text.count(text, /<\s*#{tag}\W/)
        closing_elements = Despamilator::Text.count(text, /\W#{tag}\s*\/>/)

        if opening_elements > 0 or closing_elements > 0
          safest_element_count = opening_elements > closing_elements ? opening_elements : closing_elements
          subject.register_match!({:score => 0.6 * safest_element_count, :filter => self})
        end
      end
    end

    def name
      'HTML tags'
    end

    def description
      'Detects HTML tags in text'
    end

    def html_tags
      # make sure these are lowercase, in order to save processing
      [
              '!--',
              '!doctype',
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
      ]

    end

  end

end
