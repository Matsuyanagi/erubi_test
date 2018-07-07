#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#-----------------------------------------------------------------------------
#	erubi の動作テスト
#	
#	gem install erubi
#	gem install dry-inflector
#	
#	
# [dry-rb/dry-inflector: Inflector for Ruby](https://github.com/dry-rb/dry-inflector)
#    require "dry/inflector"
#    inflector = Dry::Inflector.new
#    inflector.pluralize("book")    # => "books"
#    inflector.singularize("books") # => "book"
#    inflector.camelize("dry/inflector") # => "Dry::Inflector"
#    inflector.classify("books")         # => "Book"
#    inflector.tableize("Book")          # => "books"
#    inflector.dasherize("dry_inflector")  # => "dry-inflector"
#    inflector.underscore("dry-inflector") # => "dry_inflector"
#    inflector.demodulize("Dry::Inflector") # => "Inflector"
# 
# [ERB vs Erubis vs Erubi](https://gist.github.com/adam12/8c3613d0c9ba6ebddc8eb8a962b36323)
#	
#	
#	
#	2018-07-07
#-----------------------------------------------------------------------------
require 'pp'
require 'fileutils'
require 'date'
require 'time'
require 'ostruct'
require 'erubi'
require 'dry/inflector'

Encoding.default_external="utf-8"
#-----------------------------------------------------------------------------
#	
#-----------------------------------------------------------------------------
settings = {
	
}

#-----------------------------------------------------------------------------
#	
#-----------------------------------------------------------------------------
def main( settings )
	filename_template = "template.erb"
	template_text = File.read( filename_template, mode: 'r:BOM|UTF-8' )

	inflector = Dry::Inflector.new
	
	template_values = {
		name: "template_name"
	}

	template_context = OpenStruct.new( template_values ).instance_eval{ binding }
	rendering_text = eval( Erubi::Engine.new( template_text, :trim => true ).src, template_context )
	puts rendering_text
end

main( settings )