$ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))


# A convenient method to refer to a file in the current path.
#   __("file.js")
#
# As opposed to:
#   File.expand_path(File.join(File.dirname(__FILE__), 'file.js'))
#
# @param *args [Strings] path to the file, where each folder/filename is an individual string
# @return [File]
def __(*args)
  file_this_included_from = caller.first.split(":").first
  app_root = File.expand_path(File.dirname(file_this_included_from))
  args = [app_root]+args
  File.expand_path(File.join(args))
end

# A convenient method to refer to a file from the root directory.
#   ___('apps','website','website.rb')
#
# @param *args [Strings] path to the file, where each folder/filename is an individual string
# @return [File]
def ___(*args)
  File.join($ROOT, *args)
end

# Helper method to list all routes to include.
#
# @param [Strings] relative path
def include_all(*args)
  path = ___(*args)
  files_to_include = []
  Dir.entries(path).each do |file|
    if file !~ /^\./ and file =~ /\.rb$/
      files_to_include << File.join(path, file)
    end
  end
  files_to_include.sort.each do |full_path|
    require full_path
  end
end

# Helper method to add directories to the $LOAD_PATH
def add_include_path(*args)
  path = File.expand_path(File.join(*args))
  $: << path unless $:.include?(path)
end
add_include_path(___('lib')) # /{root}/lib/

def ensure_auth
  redirect '/' unless session[:login]
end
