# knife-attribute

Manipulate Chef attributes via Knife

## Installation

Install via rubygems:

```bash
gem install knife-attribute
```

Or for more recent Chef or ChefDK installations:

```bash
chef gem install knife-attribute
```

## Usage

To work with attributes of type `default`, `normal` or `override`, use the
`-t TYPE` flag (the default type if unspecified is `normal` for `nodes`, and
`default` for all other entity types).

### node attribute set

Setting node attributes may be achieved as follows:

```bash
knife node attribute set foo.example.org tz 'Australia/Melbourne'
```

The above would set the `foo.example.org` node's `normal` attribute `tz` to the
string `Austraila/Melbourne`.

You may specify either a regular string, or a JSON structure, ie:

```bash
knife node attribute set foo.example.org apache.listen_ports '["80", "443"]' -t override
```

The above would set the `foo.example.org` node's `override` attribute
`['apache']['listen_ports']` to the array `["80", "443"]`.

### node attribute get

Getting node attributes may be achieved as follows:

```bash
knife node attribute get foo.example.org apache.listen_ports
```

Use the standard `-F FORMAT` flag to set the output format for complex data
structures.

Unlike other actions, by default the `get` action will return the combined
(effective) value for the attribute, if an attribute type (`-t TYPE`) is not
specified.

```bash
knife node attribute get foo.example.org apache.listen_ports -t override -F json
```

The above would get the `foo.example.org` node's `override` attribute
`['apache']['listen_ports']` and output it as JSON.

### node attribute delete

Deleting node attributes may be achieved as follows:

```bash
knife node attribute delete foo.example.org tz
```

The above would delete the `foo.example.org` node's `normal` attribute `tz`.

```bash
knife node attribute delete foo.example.org apache.listen_ports -t override
```

The above would delete the `foo.example.org` node's `override` attribute
`['apache']['listen_ports']`.

### role attribute set

Valid attribute types for roles are: `['default', 'override']`.

For usage, see `node attribute set` above.

### role attribute get

Valid attribute types for roles are: `['default', 'override']`.

For usage, see `node attribute get` above.

### role attribute delete

Valid attribute types for roles are: `['default', 'override']`.

For usage, see `node attribute delete` above.

### environment attribute set

Valid attribute types for environments are: `['default', 'override']`.

For usage, see `node attribute set` above.

### environment attribute get

Valid attribute types for environments are: `['default', 'override']`.

For usage, see `node attribute get` above.

### environment attribute delete

Valid attribute types for environments are: `['default', 'override']`.

For usage, see `node attribute delete` above.

