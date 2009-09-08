require 'esv/bible'
require 'esv/reading_plan'

module ESV
  OUTPUT_FORMATS =
    ['html', 'crossway-xml-1.0', 'plain-text', 'mp3']
  
  HTML_OPTIONS =
    { 
      'include-passage-references' => true,
      'include-first-verse-numbers' => true,
      'include-verse-numbers' => true,
      'include-footnotes' => true,
      'include-footnote-links' => true,
      'include-headings' => true,
      'include-subheadings' => true,
      'include-surrounding-chapters' => false,
      'include-word-ids' => false,
      'link-url' => 'http://www.gnpcb.org/esv/search/',
      'include-audio-link' => true,
      'audio-format' => 'flash',
      'audio-version' => 'hw',
      'include-short-copyright' => true,
      'include-copyright' => false,
    }
  
  XML_OPTIONS =
    {
      'include-xml-declaration' => false,
      'include-doctype' => true,
      'include-quote-entities' => true,
      'include-simple-entities' => false,
      'include-cross-references' => false,
      'include-line-breaks' => true,
      'include-word-ids' => false,
      'include-virtual-attributes' => false,
      'base-element' => 'verse-unit',
    }
  
  TEXT_OPTIONS =
    {
      'include-passage-references' => true,
      'include-first-verse-numbers' => true,
      'include-verse-numbers' => true,
      'include-footnotes' => true,
      'include-short-copyright' => true,
      'include-copyright' => false,
      'include-passage-horizontal-lines' => true,
      'include-heading-horizontal-lines' => true,
      'include-headings' => true,
      'include-subheadings' => true,
      'include-selahs' => true,
      'include-content-type' => true,
      'line-length' => 74,
    }
end