# THIS PROGRAM DOESN'T WORK, DO NOT USE IT
# ruby-definition-clearer
A simple ruby script meant to remove method bodies

## Easy install:
```bash
git clone https://github.com/candyapplecorn/ruby-definition-clearer.git
mv ruby-definition-clearer .def-clear
cd .def-clear
bash install.sh
exec bash
echo "Hopefully installed successfully! Now def-clear is an alias."
echo "You can even type def and hit tab; aliases are cool!"
```
## Usage

```bash
$ def-clear --help
$ def-clear input-file.rb [output-file.rb]
```

## Examples

Say you've got a file, "foo.rb", with the contents:
```ruby
# this is a ruby file!
def my_beloved_method(beloved_parameter)
  p beloved_parameter
end
```
 Now let's say you run def-clear from your command line:
```bash
 $ def-clear foo.rb
```
 You should see this printed to your console:
```ruby
# this is a ruby file!
def my_beloved_method(beloved_parameter)
end
```
As it's sent to STDOUT, you may use misdirection to send the output to another file. If the file doesn't exist, bash automatically creates it. Use one __>__ for overwriting, and two (__>>__) for appending. Be careful not to overwrite precious files, UNIX does not send overwritten files' contents to any sort of trash bin!

If you want to create a new file with empty definitions from another ruby file with definitions, you could use misdirection like so:

```bash
$ def-clear some-ruby-file.rb > my-fresh-ruby-file.rb
```

This will create a new file, _my-fresh-ruby-file.rb_, with all the code from _some-ruby-file.rb_, minus the actual method bodies.

The script supports output filenames, so you could also run this command to achieve the same effect:
```bash
$ def-clear some-ruby-file.rb my-fresh-ruby-file.rb
```
## WARNING:
Do not pipe the STDOUT output of def-clear into its input file. __THIS WILL ERASE THE INPUT FILE'S CONTENTS__. If you want to overwrite a file with itself, sans method bodies, use def-clear's optional second argument like so:

```bash
$ def-clear some-ruby-file.rb some-ruby-file.rb
```

This will safely remove the method bodies from _some-ruby-file.rb_ without erasing it completely.

Also: I haven't tested this script to see what it does to "golfer" definitions like so: `def name; do.stuff; end`.
