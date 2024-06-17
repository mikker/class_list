# ClassList

Utility to create HTML `classList` strings from any argument. With a shorthand:

## Install

```sh
$ # bundle add class_list # doesn't work, naming conflict
```

```ruby
# in Gemfile, for now
gem "class_list", github: "mikker/class_list"
```

## Usage

```erb
<% button = CL("rounded", ['bg-black'], { "bg-white": true }) %>
  <!-- CL == ClassList.new -->

<%= tag.a "hi", class: button %>
  <!-- <a class="rounded bg-black bg-white">hi</a> -->

<% primary = button.add("text-xl") %>
<%= tag.a "bigger hi", class: primary %>
  <!-- <a class="rounded bg-black bg-white text-xl">bigger hi</a> -->
```

## License

MIT
