require 'despamilator/filter_base'

module DespamilatorFilter

  class HtmlTags < Despamilator::FilterBase

    def parse text
      text.downcase!

      html_tags.each do |tag|
        if text.match(/<\s*#{tag}\W/) || text.match(/<\n*#{tag}\W/) || text.match(/\W#{tag}\s*\//) || text.match(/\W#{tag}\n*\//)
          self.append_score = 0.48
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
