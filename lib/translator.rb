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
  translation = hash["get_emoticon"][emoticon]
  if translation == nil
    translation = "Sorry, that emoticon was not found" 
  end
  translation
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  translation = hash["get_meaning"][emoticon]
  if translation == nil
    translation = "Sorry, that emoticon was not found" 
  end
  translation
end