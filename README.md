# everyword

A everyword bot implementation written in Ruby!

## Requirements

* Ruby (*nix package `ruby` or [RubyInstaller](http://rubyinstaller.org/))
* A [Twitter App](https://apps.twitter.com)

## Prerequisites

* Run `bundle install` to install the project dependencies.
* Fill `source.txt` with the words you want to get posted.
* Copy
  * `config.example.yml` to `config.yml` and add your application keys.
  * `source.example.txt` to `source.txt` and add your words.
  * `index.example.txt` to `index.txt` so the bot can count it's progress.

## Running

* Just execute `ruby everyword.rb` in the project directory.

## How it Works

Pretty simple, let's start explaining the setup:

* `source.txt`
* `index.txt`

**`source.txt`:** You include all the words here that you want your bot to tweet!

**`index.txt`:** Don't touch this file, it includes the line-number (zero-indexed), so the bot knows where to continue if it stops or crashes!

---

1. The bot loads the index from the file, which is always 0 in the beginning (the first line)
2. Looks up the word with the set index (0) and tweets that
3. Increments the index by one and saves it to the index-file
4. Repeat from **2**

## Customize

Besides the contents from `source.txt` you can also customize other parts of the bot, main two being **pre/suffixed contents in a tweet** and the **sleep time between tweets**!

**Prefixed Content Example (Line 48 of `everyword.rb`)**

```ruby
client.update "Great #{get_line('source.txt', $index)}"
```

**Suffixed Content Example (Line 48 of `everyword.rb`)**

```ruby
client.update "#{get_line('source.txt', $index)} is great!"
```

**Change Sleep Time (Line 50 of `everyword.rb`)**

```ruby
sleep 30 * 60 # replace 30 with what you want, * 60 turns it into minutes
```

## License

everyword is licensed under the aGPLv3 license.
