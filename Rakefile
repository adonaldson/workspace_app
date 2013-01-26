require 'rake/clean'

desc "Set up the folder structure"
task install: ['../assets/stylesheets', '../assets/javascripts', '../templates'] do
  # mkdir_p '../assets/stylesheets'
  # mkdir   '../assets/javascripts'
  # mkdir   '../templates'
  symlink 'public', '../public'
end

directory '../assets/stylesheets'
directory '../assets/javascripts'
directory '../templates'

# no CLOBBER yet, sorry
