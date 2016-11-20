#!/usr/bin/env ruby

# file: pxrowx.rb

require 'line-tree'


class PxRowX

  def initialize(txt)

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
          r << scan_tree(n, line) unless line.empty?
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

        r = ['item',{},nil, ['summary',{}, nil ]] if r.empty?
        field, value = x.split(/:\s*/,2)
        r.last <<  [field, {}, value]

      elsif x.is_a? Array

        if  x.length > 1 then
          r << make_rows(x)
        else
          r << ['records', {}, nil, make_rows(x.first)]
        end

      end

      r
    end
  end
end

