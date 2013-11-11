# knife-attribute

Manipulate Chef attributes via Knife

## Installation

Install via rubygems:

```bash
gem install knife-attribute
```

## Usage

In this initial release, only `node attribute set` is implemented, more to
follow in the near future.

To work with attributes of type `default`, `normal`, `override` or `automatic`,
use the `-t TYPE` flag (default if unspecified is `normal`).

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


## TODO
- Implement attribute get/set/delete for roles
- Implement attribute get/set/delete for environments
