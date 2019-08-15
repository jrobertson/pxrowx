#!/usr/bin/env ruby

# file: pxrowx.rb

require 'line-tree'
require 'rexle-builder'


class PxRowX

  def initialize(txt, record_name: 'item')

    @record_name = record_name
    
    lt = LineTree.new(txt)
    a = lt.to_a

    labels = []

    i = 0
    label = a[i][0][/^\w+/]

    while (not labels.include?(label)) and i < a.length do

      labels << label
      i+=1
      label = a[i][0][/^\w+/]

    end

    r = scan_tree labels.length, a
    rows = make_rows r

    ['items', {}, nil].reverse.each {|x| rows.unshift x}
    
    h = {
      title: '',
      recordx_type: 'polyrex',
      schema: "items[title]/#{@record_name}[#{labels.join(', ')}]"
    }

    summary = RexleBuilder.new(h, debug: false).to_a
    summary[0] = 'summary'
    rows.insert 3, summary
    
    @doc = Rexle.new(rows)
    
  end

  def to_xml(options={})
    @doc.xml options
  end

  private

  def scan_tree(n, a)
    
    items = []
    item = a.first

    while a.any? do

      if item.length < 2 then

        items << n.times.flat_map do
          
          r = []
          line = a.shift

          r << line.shift
          r.concat scan_tree(n, line) unless line.empty?
          r

        end

      else
        scan n, a
      end

    end

    return items

  end

  def make_rows(a)

    a.inject([]) do |r, x|      
      
      if x.is_a? String then

        r = [@record_name,{},nil, ['summary',{}, nil ]] if r.empty?
        field, value = x.split(/:\s*/,2)
        r.last <<  [field, {}, value]

      elsif x.is_a? Array

       raw_rows = x.length > 1 ? x : x.first        
       r << ['records', {}, nil, make_rows(raw_rows)]

      end

      r
    end
  end
end

