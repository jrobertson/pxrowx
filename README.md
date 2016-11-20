# Introducing the pxrowx gem

    require 'pxrowx'

    txt =<<EOF
    heading: fun 1
    when: 
    priority:
    planned_duration: 22

      heading: fun 2
      when: monday
      priority: 3
      planned_duration: 33

    heading: fun 20
    when: 
    priority:
    planned_duration:  

    heading: fun 30
    when: 
    priority: 
    planned_duration: 

    EOF

    pr = PxRowX.new(txt)
    puts pr.to_xml pretty: true

Output:

<pre>
&lt;?xml version='1.0' encoding='UTF-8'?&gt;
&lt;items&gt;
  &lt;item&gt;
    &lt;summary&gt;
      &lt;heading&gt;fun 1&lt;/heading&gt;
      &lt;when/&gt;
      &lt;priority/&gt;
      &lt;planned_duration&gt;22&lt;/planned_duration&gt;
    &lt;/summary&gt;
    &lt;records&gt;
      &lt;item&gt;
        &lt;summary&gt;
          &lt;heading&gt;fun 2&lt;/heading&gt;
          &lt;when&gt;monday&lt;/when&gt;
          &lt;priority&gt;3&lt;/priority&gt;
          &lt;planned_duration&gt;33&lt;/planned_duration&gt;
        &lt;/summary&gt;
      &lt;/item&gt;
    &lt;/records&gt;
  &lt;/item&gt;
  &lt;item&gt;
    &lt;summary&gt;
      &lt;heading&gt;fun 20&lt;/heading&gt;
      &lt;when/&gt;
      &lt;priority/&gt;
      &lt;planned_duration/&gt;
    &lt;/summary&gt;
  &lt;/item&gt;
  &lt;item&gt;
    &lt;summary&gt;
      &lt;heading&gt;fun 30&lt;/heading&gt;
      &lt;when/&gt;
      &lt;priority/&gt;
      &lt;planned_duration/&gt;
    &lt;/summary&gt;
  &lt;/item&gt;
&lt;/items&gt;
</pre>

## Resources

* pxrowx https://rubygems.org/gems/pxrowx

pxrowx gem polyrex rowx
