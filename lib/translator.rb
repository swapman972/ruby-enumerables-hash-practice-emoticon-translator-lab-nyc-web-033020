# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}

  new_hash["get_emoticon"] = {}
  new_hash["get_meaning"] = {}

  emoticons.each do |english_meaning, emoticon_set|
    new_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
    new_hash["get_meaning"][emoticon_set.last] = english_meaning
  end
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  result = hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, emoticon not found!" 
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end