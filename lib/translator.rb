require "yaml"


def load_library (file_path)
  emoticon_raw = YAML.load_file(file_path)
  dictionary_start = { 
    :get_meaning => {},
    :get_emoticon => {}
  }
  emoticon_raw.each do |memo,value|
    dictionary_start[:get_meaning][value[1]] = memo
    dictionary_start[:get_emoticon][value[0]] = value[1]
  end
 dictionary_start   
end

def get_japanese_emoticon (file_path,emoticon)
 dictionary = load_library(file_path)
  answer = "Sorry, that emoticon was not found"
  dictionary[:get_emoticon].each do |key,value|
  if emoticon == key
    answer = value
    end 
  end
  answer
end

def get_english_meaning (file_path,emoticon)
  dictionary = load_library(file_path)
  answer = "Sorry, that emoticon was not found"
  dictionary[:get_meaning].each do |key,value|
    if key == emoticon
      answer = value
    end
  end
  answer
end