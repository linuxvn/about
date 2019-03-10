#!/usr/bin/env ruby

# Author   : Ky-Anh Huynh
# License  : MIT
# Date     : 2019-03-09
# Purpose  : Send notes to telegram channel/group

# Input format:
#
#   ### [topic](the_official_or_an_important_link)
#
#   Topic contents
#
# Code block content must use ```

require 'time'

NOTES_ID = "Notes-#{Time.now.utc.year}"
F_INPUT = File.join(__dir__, "../#{NOTES_ID}.md")

$blames = %x[git blame #{F_INPUT}].split(%r{[\r\n]})

# FIXME: This is expensive.
if $blames.join.strip.empty?
  STDERR.puts ":: Unable to execute git blames against '#{F_INPUT}'"
  exit(1)
end

def author(section)
  found = $blames.detect{|bl| bl.include?(section)}
  found ? found.split("### ").first : "unknown"
end

lines = File.open(F_INPUT, "r").readlines
notes = {}
current_section = nil
code_block = false

lines.each do |line|
  if gs = line.match(%r{^## .+})
    current_section = nil
    code_block = false
    next
  end

  if gs = line.match(%r{^### (.+)})
    current_section = gs[1]
    code_block = false
    next
  end

  # Skip the line if section information is not found.
  next unless current_section

  notes[current_section] ||= []
  if line.match(%r{^```})
    notes[current_section] << line
    code_block = (not code_block)
    next
  end

  # Code block -> verbatim adding
  if code_block
    notes[current_section] << line
    next
  end

  # Paragraph -> insert new line
  # FIXME: There are some extra lines after a code block.
  if line.strip == ""
    notes[current_section] << line
    notes[current_section] << "\n"
    next
  end

  # Otherwise -> remove the right spaces
  notes[current_section] << line.rstrip + " "
end

F_STATE = "#{__FILE__}.state.txt"
CHAT_ID = ENV["TELEGRAM_NEWS_CHANNEL_ID"]

begin
  $states = File.open(F_STATE, "r").readlines
rescue Errno::ENOENT
  $states = []
rescue
  raise
end

def write_notes(notes, bot = nil)
  notes.each do |k,v|
    gs = k.match(%r{^\[([^\]]+)\]\((.+)\)})
    if not gs
      STDERR.puts ":: Invalid section key: #{k}"
      next
    end
    key, link = gs[1], gs[2]
    key.gsub!('`', '')
    state_id = "#{CHAT_ID}##{NOTES_ID}##{key}"

    if $states.detect{|line| line.include?(state_id)}
      STDERR.puts ":: Note (#{state_id}) sent as recorded in state file '#{F_STATE}'"
      next
    end

    github_link = "https://github.com/linuxvn/about/blob/master/#{NOTES_ID}.md##{key}"
    contents = "`#{key}` #{link}\n\n#{github_link}\n#{v.join()}\n\n-- #{author(k)} at #{github_link}"
    contents.gsub!(%r{```[\n]{2,}}, "```\n\n")
    STDERR.puts ":: Sending #{state_id}"
    if bot.nil?
      STDOUT.puts "=" * 64
      STDOUT.puts contents
    else
      bot.api.send_message(chat_id: CHAT_ID,
        text: contents, parse_mode: 'Markdown', disable_web_page_preview: true)
      STDERR.puts ":: Saving #{state_id} to state file #{F_STATE}"
      File.open(F_STATE, "a") {|f| f.puts state_id}
    end
  end
end

if ARGV.include?("--test")
  write_notes(notes, nil)
  exit(0)
end

require 'telegram/bot'
Telegram::Bot::Client.run(ENV["TELEGRAM_BOT_TOKEN"]) do |bot|
  write_notes(notes, bot)
end
